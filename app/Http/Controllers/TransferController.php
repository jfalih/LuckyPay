<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\{Site, Category, User, History_saldo, Subject};
class TransferController extends Controller
{
    public function index(){
        $site = Site::first();
        $category = Category::where('status','active')->get();
        return view('transfer', [
            'site' => $site,
            'category' => $category,
            'ticket' => Subject::where('status','waiting')
        ]);
    }

    public function transfer_saldo(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'email'],
            'jumlah' => ['required', 'integer', 'min:5000']
        ]);
        
        if($validator->fails()){
            return redirect('transfer')->withErrors($validator);
        }

        $user_tf = User::where('email', $request->email);

        if($user_tf->count() > 0){
            if($user_tf->first()->id === Auth::user()->id) {
                return redirect('transfer')->with('error', 'Email tujuan tidak bisa email sendiri!');
            } else {    
                $user = User::where('id', Auth::user()->id);
                $update_user = $user->update([
                    'balance' => $user->first()->balance - $request->jumlah
                ]);
                if($update_user) {
                    $update_penerima = $user_tf->update([
                        'balance' => $user_tf->first()->balance + $request->jumlah
                    ]);
                    if($update_penerima) {         
                        $saldo = History_saldo::create(
                            [
                                'user_id' => $user->first()->id,
                                'jumlah' => $request->jumlah,
                                'keterangan' => 'Transfer Saldo Ke '.$user_tf->first()->email,
                                'status' => 'minus'
                            ]);
                        $saldo2 = History_saldo::create([
                                'user_id' => $user_tf->first()->id,
                                'jumlah' => $request->jumlah,
                                'keterangan' => 'Menerima Saldo Dari '.$user->first()->email,
                                'status' => 'plus'
                            ]);
                        if($saldo && $saldo2){ 
                            return redirect('transfer')->with('success', 'Saldo berhasil di transfer!');
                        } else {
                            return redirect('transfer')->with('error', 'Error Server!');    
                        }
                    } else {                        
                        return redirect('transfer')->with('error', 'Error Server!');
                    }
                } else {
                    return redirect('transfer')->with('error', 'Error Server!');
                }
            }
        } else {
            return redirect('transfer')->with('error', 'User tidak ditemukan');
        }
    }
}
