<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Validator;
class ProfileController extends Controller
{
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => ['required'],
            'action' => ['required']
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }
        $user = User::where('api_key', $request->key);
        if($user->count() > 0){
            if($request->action === 'profile'){
                return response()->json([
                    'result' => true,
                    'data' => [
                       'username' => $user->first()->email,
                       'full_name' => $user->first()->name,
                       'balance' => $user->first()->balance
                    ]
                ], 200);
            } else {
                return response()->json('Failed', 400);
            }
        } else {
            return response()->json('Api key not match', 400);
        }
    }
}
