<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\{Category, Site, History_saldo, User, Subject};
use Auth;
class PointController extends Controller
{
    public function index()
    {
        return view('point', [
            'category' => Category::where('status','active')->get(),
            'site' => Site::first(),
            'ticket' => Subject::where('status','waiting')->get(),
        ]);
    }

    public function change_point(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'point' => ['required', 'integer','min:100']
        ]);
        if($validator->fails()){
                return redirect('point')->withErrors($validator);
            }
        $site = Site::first();
        if(Auth::user()->point > 0){
            $user = User::where('id', Auth::user()->id);
            $update = $user->update([
                'point' => Auth::user()->point - $request->point,
                'balance' => Auth::user()->balance + $request->point
            ]);
                if($update) {
                    $create = History_saldo::create([
                        'user_id' => Auth::user()->id,
                        'jumlah' => $request->point,
                        'keterangan' => 'Penambahan Saldo Dari Poin Sebesar '.$request->jumlah,
                        'status' => 'plus'
                    ]);
                    if($create){
                        return redirect('/point')->with('success', 'Berhasil mengkonversi point!');
                    } else {
                        return redirect('/point')->with('error', 'Error Server!');
                    }
                } else {
                    return redirect('/point')->with('error', 'Error Server!');
                }
        } else {
            return redirect('/point')->with('error', 'Point kurang untuk ditukarkan');
        }
    }
}
