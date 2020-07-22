<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use App\{User,History,Service,History_saldo, Operan, Category};

class SosmedController extends Controller
{
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => ['required'],
            'action' => ['required'],
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        } else {
            $user = User::where('api_key', $request->key);
            $now = date('Y-m-d');
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
                    $valid_service = Validator::make($request->all(), [
                        'service' => ['required']
                    ]);
                    if($valid_service->fails()){
                        return response()->json($valid_service->errors(), 400);
                    } else {
                        $service = Service::where('id', $request->service);
                        if($service->count() > 0){
                        $validator = Validator::make($request->all(), [
                            'quantity' => ['required','integer', 'min:'.$service->first()->min, 'max:'.$service->first()->max],
                            'target' => ['required']
                        ]);
                
                        if($validator->fails()){
                            return response()->json($validator->errors(), 400);
                        }
                        $operan = Operan::where('id', $service->first()->operan_id)->first();
                        if($service->first()->price_api * $request->quantity / 1000 <= $user->first()->balance) {
                                        if($service->first()->operan->code !== 'KMEDIA'){
                                            $body = [
                                                'api_id' => $operan->api_id, 
                                                'api_key' => $operan->api_key,
                                                'service' => $service->first()->code_operan,
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
                                                        'price' => $service->first()->price_api,
                                                        'date' => $now,
                                                        'target' => $request->target,
                                                        'via' => 'api',
                                                        'service_id' => $service->first()->id,
                                                        'sn' => 0,
                                                        'start_count' => 0,
                                                        'remains' => 0,
                                                        'trx_id' => $contents->data->id,
                                                        'user_id' => $user->first()->id,
                                                        'price' => $service->first()->price * $request->quantity / 1000
                                                    ]);
                                                        if($history){
                                                            $update_user = $user->update([
                                                                'balance' => $user->first()->balance - $history->price,
                                                            ]);
                                                            if($update_user){
                                                                $saldo = History_saldo::create([
                                                                    'user_id' => $user->first()->id,
                                                                    'jumlah' => $history->price,
                                                                    'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price,
                                                                    'status' => 'minus'
                                                                ]);
                                                                 return response()->json([
                                                                    'result' => true,
                                                                    'data' => [
                                                                        'trx_id' => $history->trx_id,
                                                                        'price' => $history->price,
                                                                        'message' => 'Pesanan berhasil! Pesanan akan diproses'
                                                                    ]
                                                                ], 200);
                                                            } else {
                                                                 return response()->json([
                                                                    'result' => false,
                                                                        'data' => [
                                                                            'message' => 'Server Error!'
                                                                         ]
                                                                ], 400);
                                                            }
                                                        } else {
                                                                 return response()->json([
                                                                    'result' => false,
                                                                        'data' => [
                                                                            'message' => 'Server Error!'
                                                                         ]
                                                                ], 400);
                                                        }
                                                    } else {
                                                                 return response()->json([
                                                                    'result' => false,
                                                                        'data' => [
                                                                            'message' => 'Server Error!'
                                                                         ]
                                                                ], 400);
                                                    }
                                        } else {
                                            $body = [
                                                'key' => $operan->api_key,
                                                'method' => "order",
                                                'service' => $service->first()->code_operan,
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
                                                        'price' => $service->first()->price_api,
                                                        'date' => $now,
                                                        'target' => $request->target,
                                                        'service_id' => $service->first()->id,
                                                        'sn' => 0,
                                                        'via' => 'api',
                                                        'start_count' => 0,
                                                        'remains' => 0,
                                                        'trx_id' => $contents->order_id,
                                                        'user_id' => $user->first()->id,
                                                        'price' => $service->first()->price_api * $request->quantity / 1000
                                                    ]);
                                                        if($history){
                                                            $update_user = $user->update([
                                                                'balance' => $user->first()->balance - $history->price
                                                            ]);
                                                            if($update_user){
                                                                $saldo = History_saldo::create([
                                                                    'user_id' => $user->first()->id,
                                                                    'jumlah' => $history->price,
                                                                    'keterangan' => 'Pembelian '.$history->service->name.' Dengan Jumlah '.$history->price,
                                                                    'status' => 'minus'
                                                                ]);
                                                                 return response()->json([
                                                                    'result' => true,
                                                                    'data' => [
                                                                        'trx_id' => $history->trx_id,
                                                                        'price' => $history->price,
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
                                                                    'message' => 'Server Error Update!'
                                                                ]
                                                            ], 400);
                                                        }
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
                                                            'message' => 'Server Error Update!'
                                                        ]
                                                    ], 400);
                                            }
                                        }
                        } else {
                            return response()->json([
                                'result' => false,
                                    'data' => [
                                        'message' => 'Saldo Tidak Cukup!'
                                     ]
                            ], 400);
                        }
                        } else {
                            return response()->json([
                                    'result' => false,
                                    'data' => [
                                        'message' => 'Services Tidak Ditemukan'
                                    ]
                                ], 400); 
                        } 
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
                            'start_count' => $history->first()->start_count,
                            'remains' => $history->first()->remains
                        ]
                    ], 200);
                    break;
                case 'services':
                    $service = Service::where('status','active')->get();
                    $arr = array();
                        foreach($service as $layanan){
                            $cat = Category::where('id',$layanan->provider->category_id)->first();
                            if($cat->template === 'sosmed'){
                                array_push($arr, [
                                    'id' => $layanan->id,
                                    'category' => $layanan->provider->name,
                                    'name' => $layanan->name,
                                    'price' => $layanan->price,
                                    'min' => $layanan->min,
                                    'max' => $layanan->max,
                                ]);
                            }
                        }
                        return response()->json([
                            'status' => true,
                            'data' => $arr
                        ], 200);
                    break;
                    
                default:
                    return response()->json('Action Tidak Ditemukan', 400);
                    break;
            }
            }
        }
    }
}
