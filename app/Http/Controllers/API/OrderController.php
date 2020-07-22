<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use App\{User,History,Service, Operan, History_saldo, Category};
class OrderController extends Controller
{
    public function index(Request $request){
        $validator = Validator::make($request->all(), [
            'key' => ['required'],
            'action' => ['required'],
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        } else {
             $user = User::where('api_key', $request->key);
            if($user->count() === 0){  
                return response()->json([
                    'result' => false,
                    'data' => [
                        'message' => 'API KEY Salah User Tidak Ditemukan'
                    ]
                ], 401);
            } else if($user->first()->level !== 'api'){
                return response()->json([
                    'result' => false,
                    'data' => [
                        'message' => 'Bukan User API'
                    ]
                ], 400);
            } else {
            switch ($request->action) {
                case 'order':
                    $validator = Validator::make($request->all(), [
                        'service' => ['required'],
                        'target' => ['required'],
                    ]);
                    if($validator->fails()){
                        return response()->json($validator->errors(), 400);
                    }
                   $service = Service::where('code', $request->service);
                    $now = date('Y-m-d');
                    if($user->first()->balance >= $service->first()->price_api && $service->first()->operan->code === 'DIGIFLAZZ'){
                         $last_history = History::where([
                            ['date', '=', $now],
                            ['target','=',$request->target]
                         ])->get();
                        if($last_history->count() !== 0){
                                $count = $last_history->count() + 1;
                                $target = $count.$request->target;
                        } else {
                                $target = $request->target;
                        }
                        $random = Str::random(30);
                        $digiflazz = Operan::where('code','DIGIFLAZZ')->first();
                        $api = [
                                'username' => $digiflazz->api_id,
                                'api' => $digiflazz->api_key,
                                'ref_id' => $random
                        ];
                        $body = [
                                        'username' => $api['username'], 
                                        'buyer_sku_code' => $service->first()->code_operan,
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
                                            'price' => $service->first()->price_api,
                                            'date' => $now,
                                            'via' => 'api',
                                            'target' => $request->target,
                                            'service_id' => $service->first()->id,
                                            'sn' => '0',
                                            'trx_id' => $api['ref_id'],
                                            'user_id' => $user->first()->id,                            
                                        ]);
                                        if($history){
                                            $saldo = History_saldo::create([
                                                'user_id' => $user->first()->id,
                                                'jumlah' => $history->price_api,
                                                'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price_api.' Melalui API',
                                                'status' => 'minus'
                                            ]);
                                            if($saldo){
                                                $update = $user->update([
                                                    'balance' =>  $user->first()->balance - $history->price,
                                                ]);
                                                if($update){
                                                     return response()->json([
                                                        'result' => true,
                                                        'data' => [
                                                            'trx_id' => $history->trx_id,
                                                            'message' => 'Pesanan berhasil! Pesanan akan diproses'
                                                        ]
                                                    ], 200);
                                                } else {
                                                    return response()->json([
                                                        'result' => false,
                                                        'data' => [
                                                            'message' => 'Server Error Update!'
                                                        ]
                                                    ], 400);
                                                }
                                            } else {
                                                return response()->json([
                                                    'result' => false,
                                                    'data' => [
                                                        'message' => 'Bukan User API'
                                                    ]
                                                ], 400);
                                            }
                                        } else {
                                            return response()->json([
                                                    'result' => false,
                                                    'data' => [
                                                        'message' => 'Server Error Insert!'
                                                    ]
                                                ], 400);
                                        }
                                    } else if($contents->data->rc == 02) {
                                        return response()->json([
                                            'result' => false,
                                            'data' => [
                                                'message' => 'Parameter Request API Salah'
                                                    ]
                                                ], 400);
                                    } else {
                                        return response()->json([
                                            'result' => false,
                                            'data' => [
                                                'message' => $contents->data->rc
                                                    ]
                                                ], 400);
                                    }
                        } catch (RequestException $e) {
                            if ($e->getResponse()->getStatusCode() == '400') {
                                return redirect('order/'.$cat->slug)->with('error', 'Server Error!');
                            }
                        }
                    } else {
                        return response()->json([
                            'result' => false,
                            'data' => [
                                'message' => 'Saldo Tidak Mencukupi'
                            ]
                        ], 402);
                    }
                    break;
                case 'status':
                    $validator = Validator::make($request->all(), [
                        'order_id' => ['required'],
                    ]);
                    if($validator->fails()){
                        return response()->json($validator->errors(), 400);
                    }
                    $history = History::where([
                        ['trx_id', '=',$request->order_id],
                        ['user_id', '=', $user->first()->id]
                    ]);
                    return response()->json([
                        'result' => true,
                        'data' => [
                            'trx_id' => $history->first()->trx_id,
                            'status' => $history->first()->status,
                            'number' => $history->first()->target,
                            'note' => $history->first()->sn
                        ]
                    ], 200);
                    break;
                case 'services':
                    $service = Service::where('status','active')->get();
                    $arr = array();
                    foreach($service as $layanan){
                        $cat = Category::where('id',$layanan->provider->category_id)->first();
                        if($cat->template === 'pulsa' || $cat->template === 'pln'){
                            array_push($arr, [
                                'category' => $layanan->provider->name,
                                'type' => $cat->slug,
                                'code' => $layanan->code,
                                'price' => $layanan->price,
                                'name' => $layanan->name,
                                'status' => $layanan->status
                            ]);
                        }
                    }
                    return response()->json([
                        'result' => true,
                        'data' => $arr
                    ], 200);
                    break;
                default:
                    return response()->json([
                            'result' => false,
                            'data' => [
                                'message' => 'Action Salah'
                            ]
                        ], 400);
                    break;
            }
            }
        }
    }
}
