<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\{Site,Category, Kmedia};
class KmediaController extends Controller
{
    public function index(){
        return view('admin.kmedia', [
            'kmedia' => Kmedia::first(),
            'site' => Site::first(),
            'category' => Category::where('status','active')
        ]);
    }
    
    public function update(Request $request){
        $kmedia = Kmedia::first();
        $update = $kmedia->update([
            'link' => $request->link,
            'status' => $request->status,
            'api_key' => $request->api_key,
        ]);
        if($update){
            return redirect('/dashboard/admin/operan/kmedia')->with('success','Berhasil Update Operan Kmedia!');
        } else {
            return redirect('/dashboard/admin/operan/kmedia')->with('error','Server error!');
        }
    }
}
