<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Site, Category, Deposit, Subject, User, History_deposit, History_saldo};
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use GuzzleHttp\Client as Client;
use Auth;
use DataTables;
class DepositController extends Controller
{
    public function index(){
        $site = Site::first();
        $history = History_deposit::where('user_id',Auth::user()->id);
        $category = Category::where('status','active')->get();
        return view('deposit', [
            'site' => $site,
            'history' => $history->where('status','success'),
            'category' => $category,
            'ticket' => Subject::where('status','waiting')

        ]);
    }
    public function cancel_depo($id){
        $history = History_deposit::where([['id','=', $id], ['user_id', '=', Auth::user()->id], ['status','=','pending']]);
        if($history->count() > 0){
            $update = $history->update([
                'status' => 'canceled'
            ]);
            if($update) {
                return redirect('deposit')->with('success', 'Deposit dibatalkan!');
            } else {
                return redirect('deposit')->with('error', 'Server Error!');
            }
        } else {
            return redirect('deposit')->with('error', 'Request failed!');
        }
    }
    public function history($id){
        $site = Site::first();
        $history = History_deposit::where([['id','=', $id], ['user_id', '=', Auth::user()->id]]);
        if($history->count() > 0){
            $deposit = Deposit::where('id', $history->first()->deposit_id)->first();
            $category = Category::where('status','active')->get();
            return view('history.deposit',[
                'site' => $site,
                'category' => $category,
                'history' => $history->first(),
                'deposit' => $deposit,
                'ticket' => Subject::where('status','waiting')
            ]);
        } else {
            return abort(404);
        }
    }
    public function add(Request $request){
        $valid_jenis = Validator::make($request->all(), [
            'jenis' => ['required'],
        ]);
        $deposit = Deposit::where('id', $request->jenis);
        $valid_jumlah = Validator::make($request->all(), [
            'jumlah' => ['required','integer','min:'.$deposit->first()->min]
        ]);
        
        if($valid_jenis->fails()){
            return redirect('deposit')->withErrors($valid_jenis);
        } else if ($valid_jumlah->fails()){
            return redirect('deposit')->withErrors($valid_jumlah);     
        }
        $cek_depo = History_deposit::where([['user_id','=',Auth::user()->id], ['status','=','pending']])->get();

        if($cek_depo->count() > 0){
            return redirect('deposit/')->with('error', 'Masih ada deposit pending, silahkan cancel terlebih dahulu!');
        } else {
            $random = Str::random(30);
            $kode_unik = rand(111,999);
            $history_deposit = History_deposit::create([
                'deposit_id' => $request->jenis,
                'trx_id' => $random,
                'jumlah' => $request->jumlah,
                'kode_unik' => $kode_unik,
                'user_id' => Auth::user()->id,
                'status' => 'pending'
            ]);    
            if($history_deposit) {
                return redirect('deposit/'.$history_deposit->id.'/history');
            }
        }
    }
    public function json(){
        $user = User::where('id', Auth::user()->id)->first();

        $deposit = History_deposit::where('user_id', $user->id)->with(['deposit'])->get();
        $data = DataTables::of($deposit)
        ->addIndexColumn()
        ->addColumn('jumlah', function(History_deposit $history){
            return 'Rp'.number_format($history->jumlah,2,',','.');
        })
        ->addColumn('status', function(History_deposit $history){
            if($history->status === 'pending'){
                return '<div class="badge badge-warning">Pending</div>';
            } else if($history->status === 'canceled'){
                return '<div class="badge badge-danger">Canceled</div>';
            } else if($history->status === 'success'){
                return '<div class="badge badge-success">Success</div>';
            }
        })
        ->addColumn('action', function(History_deposit $history){
            $site = Site::first();
            $url = $site->url."/deposit/".$history->id."/history"; 
            return '<a href="'.$url.'" class="btn text-white btn-primary"><i class="feather icon-eye"></i> Detail</a>';
        })
        ->rawColumns(['jumlah', 'status', 'action'])
        ->make(true);
        return $data;
    }
    
    public function konfirmasi($id){
        $deposit = History_deposit::where('id', $id)->first();
        if($deposit->status === 'pending'){
        $total = $deposit->jumlah + $deposit->kode_unik;
           if($deposit->deposit->code === "OVO") {
               $code = "ovo";
               $data = array(
                "search"  => array(
                        "date"            => array(
                                "from"    => date("Y-m-d")." 00:00:00",
                                "to"      => date("Y-m-d")." 23:59:59"
                                ),
                        "account_number"  => $deposit->deposit->rekening,
                        "amount"          => $total.'.00'
                    )
                );
           } else if($deposit->deposit->code === "GOPAY") {
               $code = "gopay";
               $data = array(
                "search"  => array(
                        "date"            => array(
                                "from"    => date("Y-m-d")." 00:00:00",
                                "to"      => date("Y-m-d")." 23:59:59"
                                ),
                        "account_number"  => $deposit->deposit->rekening,
                        "amount"          => $total.'.00'
                    )
                );
           } else {
               $code = "bank";
               $data = array(
                "search"  => array(
                        "date"            => array(
                                "from"    => date("Y-m-d")." 00:00:00",
                                "to"      => date("Y-m-d")." 23:59:59"
                                ),
                        "service_code"    => $deposit->deposit->code,
                        "account_number"  => $deposit->deposit->rekening,
                        "amount"          => $total.'.00'
                    )
                );
           }
                $ch = curl_init();
                curl_setopt_array($ch, array(
                    CURLOPT_URL             => "https://api.cekmutasi.co.id/v1/".$code."/search",
                    CURLOPT_POST            => true,
                    CURLOPT_POSTFIELDS      => http_build_query($data),
                    CURLOPT_HTTPHEADER      => ["Api-Key: 8f538dc1c5addf454cd1117c5daf07e05ee852ef48093", "Accept: application/json"], // tanpa tanda kurung
                    CURLOPT_RETURNTRANSFER  => true,
                    CURLOPT_HEADER          => false,
                    CURLOPT_IPRESOLVE		=> CURL_IPRESOLVE_V4,
                ));
                $result = json_decode(curl_exec($ch));
                curl_close($ch);
                
                if(!empty($result->response)){
                foreach($result->response as $response) {
                    if($response->type === "credit"){
                        if($response->amount === $total.'.00'){
                            $from = date("Y-m-d")." 00:00:00";
                            $to = date("Y-m-d")." 23:59:59";
                            $history = History_deposit::where([['id','=',$deposit->id],['kode_unik', '=', $deposit->kode_unik] , ['status','=','pending']])->whereBetween('created_at', [$from, $to])->first();
                            if($history){
                            $update = $history->update([
                                'status' => 'success'
                                ]);
                            if($update) {
                                $user = User::where('id',$history->user->id);
                                    $user_update = $user->update([
                                        'balance' => $user->first()->balance + $total,
                                        'total_deposit' => $user->first()->total_deposit + $total
                                        ]);
                                    $insert_saldo = History_saldo::create([
                                        'keterangan' => 'Penambahan Balance Dengan Jumlah Rp'.number_format($total,2,',','.'),
                                        'jumlah' => $jumlah,
                                        'status' => 'plus',
                                        'user_id' => $user->id
                                    ]); 
                                    if($user_update){
                                        return redirect('/deposit')->with('success','Berhasil Konfirmasi Deposit');
                                    } else {
                                        return redirect('/deposit')->with('error','Server Error!');
                                    }
                            } else {
                                return redirect('/deposit')->with('error','Server Error!');
                            }
                            } else {
                                return redirect('/deposit')->with('error','Kamu melewati batas transfer nih..!');
                            }
                        } else {
                            return redirect('/deposit')->with('error','Kamu belum transfer nih..1!');
                        }
                    }
                }
                } else {
                        return redirect('/deposit')->with('error','Kamu belum transfer nih..2!');
                }
        } else {
            return redirect('/deposit')->with('error', 'Deposit sudah ditutup!');
        }
    }
    
    public function getDeposit($method){
        $deposit = Deposit::where([['jenis','=', $method],['status','=','active']]);
        return $deposit->select('id','rate','name')->get();
    }
}
