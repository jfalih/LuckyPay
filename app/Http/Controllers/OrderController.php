<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use App\{User, Category, Site, Provider, Service, Operan,History, Subject, History_saldo};
use Auth;
class OrderController extends Controller
{
    public function index($slug){
        $template = Category::where('slug', $slug);
        $category = Category::where('status', 'active')->get();
        $site = Site::first();
        foreach($template->get() as $val){
            $provider = Provider::where('category_id', $val->id)->get();
            switch ($val->template) {
                case 'pulsa':
                    return view('order.pulsa', [
                        "category" => $category,
                        "provider" => $provider,
                        "template" => $template->first(),
                        "site" => $site,
                        'ticket' => Subject::where('status','waiting')
                    ]);
                    break;
                case 'sosmed':
                    return view('order.sosmed', [
                        "provider" => $provider,
                        "category" => $category,
                        "template" => $template->first(),
                        "site" => $site,
                        'ticket' => Subject::where('status','waiting')
                    ]);
                    break;
                case 'pln':
                    return view('order.pln', [
                        "provider" => $provider,
                        "category" => $category,
                        "template" => $template->first(),
                        "site" => $site,
                        'ticket' => Subject::where('status','waiting')
                    ]);
                    break;
                default:
                    return "404";
                    break;
            }
        }
        return abort(404);
    }

    public function add($slug, Request $request)
    {
        $cat = Category::where('slug', $slug)->first();
        $now = date('Y-m-d');
            $validator = Validator::make($request->all(), [
                'service' => ['required'],
            ]);
    
            if($validator->fails()){
                return redirect('order/'.$cat->slug)->withErrors($validator);
            }
            $service = Service::where('id', $request->service)->first();
            $operan = Operan::where('id', $service->operan_id)->first();
            $provider = Provider::where('id', $service->provider_id)->first();
            
           
            switch ($cat->template) {
                case 'pulsa':
                    $validator = Validator::make($request->all(), [
                        'nomorhp' => ['required', 'digits_between:8,20','string'],
                    ]);

                    if($validator->fails()){
                        return redirect('order/'.$cat->slug)->withErrors($validator);
                    }
                    $last_history = History::where([
                        ['date', '=', $now],
                        ['target','=',$request->nomorhp]
                    ])->get();
                    if($last_history->count() !== 0){
                        $count = $last_history->count() + 1;
                        $target = $count.$request->nomorhp;
                    } else {
                        $target = $request->nomorhp;
                    }
                    $random = Str::random(30);
                    
                    if(Auth::user()->balance >= $service->price  && $service->operan->code === 'DIGIFLAZZ') {
                        $digiflazz = Operan::where('code','DIGIFLAZZ')->first();
                        $api = [
                                'username' => $digiflazz->api_id,
                                'api' => $digiflazz->api_key,
                                'ref_id' => $random
                        ];
                        $body = [
                                        'username' => $api['username'], 
                                        'buyer_sku_code' => $service->code_operan,
                                        'customer_no' => $target,
                                        'ref_id' => $api['ref_id'],
                                        'sign' => md5($api['username'].$api['api'].$api['ref_id']),
                                    ];
                        $client = new Client(['headers' => ['Content-Type' => 'application/json']]);
                        try{
                                    $r = $client->request('POST', 'https://api.digiflazz.com/v1/transaction', [
                                        'json' => $body
                                    ]);
                                    $stream = $r->getBody();
                                    $contents = json_decode($stream->getContents());
                                    if($contents->data->rc == 00 || $contents->data->rc == 03) {
                                        $history = History::create([
                                            'status' => 'pending',
                                            'quantity' => 1,
                                            'price' => $service->price,
                                            'date' => $now,
                                            'target' => $request->nomorhp,
                                            'service_id' => $service->id,
                                            'sn' => '0',
                                            'trx_id' => $api['ref_id'],
                                            'user_id' => Auth::user()->id,                            
                                        ]);
                                        if($history){    
                                            $user = User::where('id', Auth::user()->id);
                                            $saldo = History_saldo::create([
                                                'user_id' => $user->first()->id,
                                                'jumlah' => $history->price,
                                                'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price,
                                                'status' => 'minus'
                                            ]);
                                            if($saldo){
                                                $update = $user->update([
                                                    'balance' => Auth::user()->balance - $history->price,
                                                ]);
                                                if($update){
                                                    return redirect('order/'.$cat->slug)->with('success', 'Pemesanan Berhasil Ditunggu Pesanan Selanjutnya..');
                                                } else {
                                                    return redirect('order/'.$cat->slug)->with('error', 'Server Error 1!');
                                                }
                                            } else {
                                                return redirect('order/'.$cat->slug)->with('error', 'Server Error !');
                                            }
                                        } else {
                                            return redirect('order/'.$cat->slug)->with('error', 'Server Error !');
                                        }
                                    } else if($contents->data->rc == 02) {
                                        return redirect('order/'.$cat->slug)->with('error', 'Harap isi form dengan benar!');
                                    } else {
                                        return redirect('order/'.$cat->slug)->with('error', 'Server Error 1!');
                                    }
                        } catch (RequestException $e) {
                            if ($e->getResponse()->getStatusCode() == '400') {
                                return redirect('order/'.$cat->slug)->with('error', 'Server Error!');
                        }
                        }
                } else {
                    return redirect('order/'.$cat->slug)->with('error', 'Saldo Tidak Cukup!');
                }
                    break;
                case 'sosmed':
                    $validator = Validator::make($request->all(), [
                        'quantity' => ['required','integer', 'min:'.$service->min, 'max:'.$service->max],
                        'target' => ['required']
                    ]);
            
                    if($validator->fails()){
                        return redirect('order/'.$cat->slug)->withErrors($validator);
                    }
                    
                    if($service->price * $request->quantity / 1000 <= Auth::user()->balance) {
                                    if($service->operan->code !== 'KMEDIA'){
                                        $body = [
                                            'api_id' => $operan->api_id, 
                                            'api_key' => $operan->api_key,
                                            'service' => $service->code_operan,
                                            'target' => $request->target,
                                            'quantity' => $request->quantity
                                        ];
                                        $client = new Client();
                                        $r = $client->request('POST', $operan->link.'order', [
                                            'form_params' => $body
                                        ]);
                                        $stream = $r->getBody();
                                        $contents = json_decode($stream->getContents()); // returns all the contents
                                        if($contents->status === true){
                                                $history = History::create([
                                                    'status' => 'pending',
                                                    'quantity' => $request->quantity,
                                                    'price' => $service->price,
                                                    'date' => $now,
                                                    'target' => $request->target,
                                                    'service_id' => $service->id,
                                                    'sn' => 0,
                                                    'start_count' => 0,
                                                    'remains' => 0,
                                                    'trx_id' => $contents->data->id,
                                                    'user_id' => Auth::user()->id,
                                                    'price' => $service->price * $request->quantity / 1000
                                                ]);
                                                    if($history){
                                                        $user = User::where('id', Auth::user()->id);
                                                        $update_user = $user->update([
                                                            'balance' => Auth::user()->balance - $history->price,
                                                        ]);
                                                        if($update_user){
                                                            $saldo = History_saldo::create([
                                                                'user_id' => $user->first()->id,
                                                                'jumlah' => $history->price,
                                                                'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price,
                                                                'status' => 'minus'
                                                            ]);
                                                            return redirect('order/'.$cat->slug)->with('success', 'Pemesanan Berhasil Ditunggu Pesanan Selanjutnya..');
                                                        } else {
                                                            return redirect('order/'.$cat->slug)->with('error', 'Server Error!');    
                                                        }
                                                    } else {
                                                        return redirect('order/'.$cat->slug)->with('error', 'Server Error!');
                                                    }
                                                } else {
                                                    return redirect('order/'.$cat->slug)->with('error', 'Server Error!');
                                                }
                                    } else {
                                        $body = [
                                            'key' => $operan->api_key,
                                            'method' => "order",
                                            'service' => $service->code_operan,
                                            'link' => $request->target,
                                            'quantity' => $request->quantity
                                        ];
                                        $client = new Client();
                                        $r = $client->request('POST', $operan->link.'?type=sosmed', [
                                            'form_params' => $body
                                        ]);
                                        $stream = $r->getBody();
                                        $contents = json_decode($stream->getContents()); // returns all the     contents
                                        if(!empty($contents->success)){
                                        if($contents->success === "true"){
                                                $history = History::create([
                                                    'status' => 'pending',
                                                    'quantity' => $request->quantity,
                                                    'price' => $service->price,
                                                    'date' => $now,
                                                    'target' => $request->target,
                                                    'service_id' => $service->id,
                                                    'sn' => 0,
                                                    'start_count' => 0,
                                                    'remains' => 0,
                                                    'trx_id' => $contents->order_id,
                                                    'user_id' => Auth::user()->id,
                                                    'price' => $service->price * $request->quantity / 1000
                                                ]);
                                                    if($history){
                                                        $user = User::where('id', Auth::user()->id);
                                                        $update_user = $user->update([
                                                            'balance' => Auth::user()->balance - $history->price
                                                        ]);
                                                        if($update_user){
                                                            $saldo = History_saldo::create([
                                                                'user_id' => $user->first()->id,
                                                                'jumlah' => $history->price,
                                                                'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price,
                                                                'status' => 'minus'
                                                            ]);
                                                            return redirect('order/'.$cat->slug)->with('success', 'Pemesanan Berhasil Ditunggu Pesanan Selanjutnya..');
                                                        } else {
                                                            return redirect('order/'.$cat->slug)->with('error', 'Server Error!');    
                                                        }
                                                    } else {
                                                        return redirect('order/'.$cat->slug)->with('error', 'Server Error!');
                                                    }
                                        } else {
                                            return redirect('order/'.$cat->slug)->with('error', 'Server error!');
                                        }
                                        } else {
                                           return redirect('order/'.$cat->slug)->with('error', 'Server error!');
                                        }
                                    }
                    } else {
                        return redirect('order/'.$cat->slug)->with('error', 'Saldo Tidak Cukup!');
                    }
                    break;
                case 'pln':
                    $validator = Validator::make($request->all(), [
                        'target' => ['required', 'digits_between:8,20','string'],
                    ]);

                    if($validator->fails()){
                        return redirect('order/'.$cat->slug)->withErrors($validator);
                    }
                    $last_history = History::where([
                        ['date', '=', $now],
                        ['target','=',  $request->target]
                    ])->get();
                    if($last_history->count() !== 0){
                        $count = $last_history->count() + 1;
                        $target = $count.$request->target;
                    } else {
                        $target = $request->target;
                    }
                    $random = Str::random(30);
                    
                    if($service->price <= Auth::user()->balance && $service->operan->code === 'DIGIFLAZZ') {
                        $digiflazz = Operan::where('code','DIGIFLAZZ')->first();
                        $api = [
                                'username' => $digiflazz->api_id,
                                'api' => $digiflazz->api_key,
                                'ref_id' => $random
                        ];
                                    $body = [
                                        'username' => $api['username'], 
                                        'buyer_sku_code' => $service->code_operan,
                                        'customer_no' => $target,
                                        'ref_id' => $api['ref_id'],
                                        'sign' => md5($api['username'].$api['api'].$api['ref_id']),
                                    ];
                                    $client = new Client(['headers' => ['Content-Type' => 'application/json']]);
                                      try{
                                    $r = $client->request('POST', 'https://api.digiflazz.com/v1/transaction', [
                                        'json' => $body
                                    ]);
                                    $stream = $r->getBody();
                                    $contents = json_decode($stream->getContents());
                                    if($contents)
                                    if($contents->data->rc == 00 || $contents->data->rc == 03) {
                                        $history = History::create([
                                            'status' => 'pending',
                                            'quantity' => 1,
                                            'price' => $service->price,
                                            'date' => $now,
                                            'target' => $request->target,
                                            'service_id' => $service->id,
                                            'sn' => '0',
                                            'trx_id' => $api['ref_id'],
                                            'user_id' => Auth::user()->id,                            
                                        ]);
                                        if($history){    
                                            $user = User::where('id', Auth::user()->id);
                                            $saldo = History_saldo::create([
                                                'user_id' => $user->first()->id,
                                                'jumlah' => $history->price,
                                                'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price,
                                                'status' => 'minus'
                                            ]);
                                            if($saldo){
                                                $update = $user->update([
                                                    'balance' => Auth::user()->balance - $history->price,
                                                ]);
                                                if($update){
                                                    return redirect('order/'.$cat->slug)->with('success', 'Pemesanan Berhasil Ditunggu Pesanan Selanjutnya..');
                                                } else {
                                                    return redirect('order/'.$cat->slug)->with('error', 'Server Error 1!');
                                                }
                                            } else {
                                                return redirect('order/'.$cat->slug)->with('error', 'Server Error !');
                                            }
                                        } else {
                                            return redirect('order/'.$cat->slug)->with('error', 'Server Error !');
                                        }
                                    } else if($contents->data->rc == 02) {
                                        return redirect('order/'.$cat->slug)->with('error', 'Harap isi form dengan benar!');
                                    } else {
                                        return redirect('order/'.$cat->slug)->with('error', 'Server Error 1!');
                                    }
                                    } catch (RequestException $e) {
                                        if ($e->getResponse()->getStatusCode() == '400') {
                                            return redirect('order/'.$cat->slug)->with('error', 'Server Error!');
                                        }
                                    }
                } else {
                    return redirect('order/'.$cat->slug)->with('error', 'Saldo Tidak Cukup!');
                }
                    break;
                default:
                return abort(404);
                    break;
            }
    }
}