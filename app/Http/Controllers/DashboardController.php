<?php

namespace App\Http\Controllers;

use App\{ Site , History, History_deposit, Service, Category, Provider};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('reseller');
    }
    public function index()
    {
        $site = Site::first();
        $service = Service::where('status','active')->get();
        if(Auth::user()->level === "developer") {
            $history = History::orderBy('created_at','desc')->get();
            $history_deposit = History_deposit::all();
            $laba_kotor_sosmed = 0;
            $total_oper_sosmed = 0;
            $laba_kotor = 0;
            $total_oper = 0;
            foreach ($history as $key => $value) {
                $provider = Provider::where('id', $value->service->provider_id)->first();
                if($provider->category->template === 'sosmed') {
                    $laba_kotor_sosmed += $value->price * $value->quantity / 1000;
                    $total_oper_sosmed += $value->service->price_operan * $value->quantity / 1000;
                } else {
                    $laba_kotor += $value->price;
                    $total_oper += $value->service->price_operan;
                }
            }
            $total = $total_oper + $total_oper_sosmed;
            $laba = $laba_kotor + $laba_kotor_sosmed;
            $laba_bersih =  $laba - $total ;
            $now = date('Y-m-d');
            $daysbefore = date('Y-m-d',strtotime($now . "-30 days"));
            $deposits =  DB::select("SELECT DATE(created_at) as date, COUNT(jumlah) AS total FROM history_deposits WHERE DATE(created_at) >= '$daysbefore' AND DATE(created_at) <= '$now' GROUP BY DATE(created_at) ");
            $orders =  DB::select("SELECT date, COUNT(price) AS total FROM histories WHERE date >= '$daysbefore' AND date <= '$now' GROUP BY date");
            return view('dashboard', [
                'category' => Category::where('status','active')->get(),
                'history' => $history,
                'history_deposit' => $history_deposit,
                'laba_bersih' => $laba_bersih,
                'laba_kotor' => $laba,
                'service' => $service,
                'site' => $site,
                'deposit' => $deposits,
                'order' => $orders
            ]);
        } else {
            $user = Auth::user()->id;
            $orders = History::where(['status','success'], ['user_id', '=', Auth::user()->id])->get();
            $history = History::where('user_id', Auth::user()->id)->get();
            $orders =  DB::select("SELECT date, COUNT(price) AS total FROM histories WHERE user_id = '$user' AND date >= '$daysbefore' AND date <= '$now' GROUP BY date ");
            return view('dashboard', [
                'history' => $history,
                'service' => $service,
                'site' => $site,
                'order' => $orders
            ]);
        }

    }
}
