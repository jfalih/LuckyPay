<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\{Site, Category};
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class SiteController extends Controller
{
    public function index(){
        $site = Site::first();
        return view('admin.website',[
            'site' => $site,
            'category' => Category::where('status','active')->get(),
        ]);
    }

    public function update(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => ['required','string'],
            'alamat' => ['required','string'],
            'link' => ['required','string'],
            'telp' => ['required','string'],
            'title' => ['required','string','min:3'],
            'email' => ['required','email'],
            'file' => ['image','mimes:jpg,jpeg,png', 'max:2048'],
            'status' => ['required'],
            'description' => ['required']
        ]);
        if($validator->fails()){
            return redirect('/dashboard/admin/website')->withErrors($validator);
        }
        
        $file = $request->file('file');
        if($file !== null){
            $tujuan_upload = 'storage';
            if(Storage::exists($nama_file)){
                Storage::delete($nama_file);
            }
        $file->move($tujuan_upload, $nama_file);
        $nama_file = $file->getClientOriginalName();
        $site = Site::where('id', 1)->update([
            'name' => $request->name,
            'alamat'=> $request->alamat,
            'url' => $request->link,
            'email' => $request->email,
            'title' => $request->title,
            'telp' => $request->telp,
            'image' => $nama_file,
            'description' => $request->description,
            'status' => $request->status
        ]);
        } else {
        $site = Site::where('id',1)->update([
            'name' => $request->name,
            'alamat'=> $request->alamat,
            'url' => $request->link,
            'email' => $request->email,
            'title' => $request->title,
            'telp' => $request->telp,
            'description' => $request->description,
            'status' => $request->status
        ]);
        }
        if($site){
            return redirect('/dashboard/admin/website')->with('success', 'Berhasil Update Website');
        } else {
            return redirect('/dashboard/admin/website')->with('error', 'Error Server!');
        }
    }
}
