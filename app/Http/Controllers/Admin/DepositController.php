<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use App\{Site, Deposit, Category, User, History_deposit};
use DataTables;
class DepositController extends Controller
{
    public function index()
    {
        $site = Site::first();
        return view('admin.deposit', [
            'site' => $site,
            'category' => Category::where('status','active')->get(),
        ]);
    }
    public function json()
    {
        $deposit = Deposit::all();
        $site = Site::first();
        return DataTables::of($deposit)
        ->addIndexColumn()
        ->addColumn('action', 'admin.deposit.datatables')->rawColumns(['action'])
        ->make(true);
    }
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'atas_nama' => ['required','string'],
            'image' => ['required','image','mimes:jpg,jpeg,png', 'max:2048'],
            'code' => ['required', 'string', 'unique:deposits','max:6'],
            'min' => ['required', 'integer'],
            'rekening' => ['required','string'],
            'jenis' => ['required'],
            'rate' => ['required'],
            'status' => ['required']
        ]);
        if($validator->fails()){
            return redirect('dashboard/admin/deposit')->withErrors($validator);
        }
        $file = $request->file('image');
        $tujuan_upload = 'storage';
        $nama_file = $file->getClientOriginalName();
        if(Storage::exists($nama_file)){
            Storage::delete($nama_file);
        } else {
            $file->move($tujuan_upload, $nama_file);
        }
        $deposit = new Deposit;
        $deposit->name = $request->name;
        $deposit->image = $nama_file;
        $deposit->code = $request->code;
        $deposit->atas_nama = $request->atas_nama;
        $deposit->min = $request->min;
        $deposit->rekening = $request->rekening;
        $deposit->jenis = $request->jenis;
        $deposit->rate = $request->rate;
        $deposit->status = $request->status;
        $deposit->save();

        if($deposit){
            return redirect('dashboard/admin/deposit')->with('success', 'Berhasil menambah jenis deposit');
        }
    }
    public function show($id)
    {
        $deposit = Deposit::where('id', $id);
        return redirect('dashboard/admin/deposit')->with('deposit', $deposit->get());
    }
    public function update($id, Request $request){
        $deposit = Deposit::where('id', $id);
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'atas_nama' => ['required','string'],
            'image' => ['image','mimes:jpg,jpeg,png', 'max:2048'],
            'code' => ['required', 'string', 'unique:deposits','max:6'],
            'min' => ['required', 'integer'],
            'rekening' => ['required','string'],
            'jenis' => ['required'],
            'rate' => ['required'],
            'status' => ['required']
        ]);
        if($validator->fails()){
            return redirect('dashboard/admin/deposit')->withErrors($validator)->with('deposit', $deposit->get());
        }
        $file = $request->file('image');
        $tujuan_upload = 'storage';
        $nama_file = $file->getClientOriginalName();
        if(Storage::exists($nama_file)){
            Storage::delete($nama_file);
        } else {
            $file->move($tujuan_upload, $nama_file);
        }
        $update = $deposit->update([
            'name' => $request->name,
            'atas_nama' => $request->atas_nama,
            'image' => $nama_file,
            'code' => $request->code,
            'min' => $request->min,
            'rekening' => $request->rekening,
            'jenis' => $request->jenis,
            'rate' => $request->rate,
            'status' => $request->status
        ]);
        if($update){
            return redirect('dashboard/admin/deposit')->with('success','Update Deposit Berhasil');
        }
    }
    public function delete($id)
    {
        $deposit = Deposit::where('id', $id)->delete();
        if($deposit){
            return redirect('dashboard/admin/deposit')->with('success','Delete Deposit Berhasil');
        }
    
    }
    public function history_delete($id){
        $deposit = History_deposit::where('id', $id)->delete();
        if($deposit){
            return redirect('dashboard/admin/history/deposit')->with('success','Delete Deposit Berhasil');
        } else {
            return redirect('dashboard/admin/history/deposit')->with('error', 'Server Error!');
        }
    }
    
    public function history_update($id, Request $request){
        $validator = Validator::make($request->all(), [
            'status' => ['required']
            ]);
        if($validator->fails()){
            return redirect('dashboard/admin/history/deposit')->withErrors($validator);
        }
        $history = History_deposit::where('id', $id);
        if($request->status === 'success'){
        $user = User::where('id', $history->first()->user_id);
        $total = $history->first()->jumlah + $history->first()->kode_unik;
        $update = $user->update([
            'balance' =>$user->first()->balance
            ]);
            if($update){
                $deposit = $history->update([
                    'status' => $request->status
                ]);
                if($deposit){
                    return redirect('dashboard/admin/history/deposit')->with('success','Transfer Deposit Berhasil Sebesar Rp'.number_format($total,2,',','.').' Ke '.$user->first()->name);
                } else {
                    return redirect('dashboard/admin/history/deposit')->with('error', 'Server Error!');
                }
            } else {
                return redirect('dashboard/admin/history/deposit')->with('error', 'Server Error!');
            }
        } else {
            $deposit = $history->update([
                    'status' => $request->status
                ]);
            if($deposit){
                return redirect('dashboard/admin/history/deposit')->with('success','Update Deposit Berhasil');
            } else {
                return redirect('dashboard/admin/history/deposit')->with('error', 'Server Error!');
            }
        }
    }
    public function history()
    {
        return view('admin.history.deposit',[
            'site' => Site::first(),
            'category' => Category::where('status','active')->get()
        ]);
    }
    public function history_json()
    {
        $history = History_deposit::with(['deposit','user']);
        $site = Site::first();
        return DataTables::of($history)
        ->addIndexColumn()
        ->addColumn('status', function(History_deposit $history){
            if($history->status === 'pending'){
                return '<div class="badge badge-warning">Pending</div>';
            } else if($history->status === 'canceled'){
                return '<div class="badge badge-danger">Canceled</div>';
            } else if($history->status === 'success'){
                return '<div class="badge badge-success">Success</div>';
            }
        })
        ->addColumn('site',$site->url)
        ->addColumn('jumlah', function(History_deposit $history){
            return 'Rp'.number_format($history->jumlah,2,',','.');
        })
        ->addColumn('action', 'admin.history.deposit_action')
        ->rawColumns(['status','site','action'])
        ->make(true);
    }
    
    public function history_show($id)
    {
        $deposit = History_deposit::where('id', $id);
        return redirect('dashboard/admin/history/deposit')->with('deposit', $deposit->get());
    }
}
