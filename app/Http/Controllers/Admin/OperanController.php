<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Validator;
use DataTables;
use App\{Operan, Site, Category};
class OperanController extends Controller
{
   
    public function index()
    {   
        $digiflazz = Operan::where('code','DIGIFLAZZ')->first();
        $body = [
            "cmd" => "deposit",
            "username" => $digiflazz->api_id,
            "sign" => md5($digiflazz->api_id.$digiflazz->api_key."depo")
            ];
        $client = new Client(['headers' => ['Content-Type' => 'application/json']]);
        $r = $client->request('POST', $digiflazz->link.'/cek-saldo', [ 'json' => $body ]);
        
        $stream = $r->getBody();
        $contents = json_decode($stream->getContents());
        $update = Operan::where('code','DIGIFLAZZ')->update([
            'saldo' => $contents->data->deposit
            ]);
        $site = Site::first();
        $operan = Operan::all();
        if($update){
        return view('admin.operan',[
            'site' => $site,
            'operan' => $operan,
            'category' => Category::where('status','active')->get(),
        ]);
        } else {
            return abort(404);
        }
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => ['required','string'],
            'link' => ['required'],
            'status' => ['required'],
            'api_key' => ['required','string'],
            'api_id' => ['required'],
            'code' => ['required','string']
        ]);
        
        if($validator->fails()) {
            return redirect('dashboard/admin/operan')->withErrors($validator);
        }
        if($request->api_id !== null ){
            $api_id = $request->api_id;
        } else {
            $api_id = 0;    
        }
        $create = Operan::create([
            'name' => $request->name,
            'link' => $request->link,
            'status' => $request->status,
            'api_key' => $request->api_key,
            'api_id' => $api_id,
            'code' => $request->code
        ]);
        if($create) {
            return redirect('dashboard/admin/operan')->with('success','Berhasil menambah operan');
        } else {
            return redirect('dashboard/admin/operan')->with('error','Server Error!');
        }
    }

    public function update($id, Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => ['required','string'],
            'link' => ['required'],
            'status' => ['required'],
            'api_key' => ['required','string'],
            'api_id' => ['required'],
            'code' => ['required','string']
        ]);
        if($validator->fails()) {
            return redirect('dashboard/admin/operan')->withErrors($validator);
        }
        if($request->api_id !== null ){
            $api_id = $request->api_id;
        } else {
            $api_id = 0;    
        }
        $update = Operan::where('id', $id)->update([
            'name' => $request->name,
            'link' => $request->link,
            'status' => $request->status,
            'api_key' => $request->api_key,
            'api_id' => $api_id,
            'code' => $request->code
        ]);
        if($update) {
            return redirect('dashboard/admin/operan')->with('success','Berhasil menambah operan');
        } else {
            return redirect('dashboard/admin/operan')->with('error','Server Error!');
        }
    }
    public function json()
    {
        $operan = Operan::all();
        $site = Site::first();
        return DataTables::of($operan)
        ->addIndexColumn()
        ->addColumn('action', 'admin.operan.datatables')->rawColumns(['action'])
        ->make(true);
    }
    public function show($id)
    {
        $operan = Operan::where('id',$id)->get();
        return redirect('dashboard/admin/operan')->with('operan', $operan);
    }
    
    public function delete($id)
    {
        $delete = Operan::where('id',$id)->delete();
        if($delete) {
            return redirect('dashboard/admin/operan')->with('success','Berhasil hapus operan!');
        }
    }
}
