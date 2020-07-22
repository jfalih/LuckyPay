<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Site, Category, History_saldo, Subject};
use Auth;
use DataTables;

class SaldoController extends Controller
{
    public function index()
    {
        $site = Site::first();
        $category = Category::where('status','active')->get();
        $history_saldo = History_saldo::where('user_id', Auth::user()->id)->get();

        return view('history.saldo', [
            'site' => $site,
            'category' => $category,
            'saldo' => $history_saldo,
            'ticket' => Subject::where('status','waiting'),
        ]);
    }

    public function json()
    {
        $history_saldo = History_saldo::where('user_id', Auth::user()->id)->orderBy('created_at','desc')->get();
        $data = DataTables::of($history_saldo)
        ->addIndexColumn()
        ->addColumn('jumlah',function(History_saldo $history){
            if($history->status === 'minus'){
                return '<button type="button" class="btn btn-outline-danger round mr-1 mb-1 waves-effect waves-light">-&nbsp;Rp'.number_format($history->jumlah,2,',','.').'</button>';
            } else {
                return '<button type="button" class="btn btn-outline-success round mr-1 mb-1 waves-effect waves-light">+&nbsp;Rp'.number_format($history->jumlah,2,',','.').'</button>';
            }
        })
        ->addColumn('status', function(History_saldo $history){
            if($history->status === 'minus'){
                return '<button type="button" class="btn btn-outline-danger round mr-1 mb-1 waves-effect waves-light">-&nbsp;Minus</button>';
            } else {
                return '<button type="button" class="btn btn-outline-success round mr-1 mb-1 waves-effect waves-light">+&nbsp;Plus</button>';
            }
        })
        ->rawColumns(['jumlah','status'])
        ->make(true);
        return $data;
    }
}
