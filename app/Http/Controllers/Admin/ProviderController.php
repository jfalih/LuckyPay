<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use DataTables;

use App\Category;
use App\Provider;
use App\Service;
use App\Site;
class ProviderController extends Controller
{
    public function index()
    {
        $site = Site::first();
        $category = Category::all();
        $provider = Provider::all();
        return view('admin.provider',[
            'site' => $site,
            'category' => $category,
            'provider' => $provider,
            'category' => Category::where('status','active')->get(),
        ]);
    }
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category' => ['required'],
            'name' => ['required', 'string'],
            'code' => ['required', 'string', 'min:2', 'max:6'],
            'slug' => ['required', 'string', 'max:255'],
            'status' => ['required']
        ]);

        if($validator->fails()) {
            return redirect('dashboard/admin/provider')->withErrors($validator);
        }
        $slug = Str::of($request->slug)->slug('-');
        $check_slug = Provider::where('slug', $slug)->first();
        $category = Category::find($request->category);
        $provider = new Provider;
        $provider->name = $request->name;
        $provider->code = $request->code;
        $provider->slug = $slug;
        $provider->status = $request->status;
        $category->provider()->save($provider);
        return redirect('dashboard/admin/provider')->with('success', 'Berhasil menambahkan provider..!');
    }
    public function delete($id)
    {
        $delete = Provider::where('id', $id)->delete();
        if($delete) {
            return redirect('dashboard/admin/provider')->with('success','Delete category '.$id.' success');
        } else {
            return redirect('dashboard/admin/provider')->with('error', 'Server error!');
        }
    }
    public function show(Request $request)
    {
        $provider = Provider::where('id',$request->id)->get();
        $site = Site::first();
        return redirect('dashboard/admin/provider')->with('provider', $provider);
    }  
    public function json()
    {
        $provider = Provider::all();
        $site = Site::first();
        return DataTables::of($provider)
        ->addIndexColumn()
        ->addColumn('action', 'admin.provider.datatables')->rawColumns(['action'])
        ->make(true);
    }
    public function edit(Request $request)
    {
        $slug = Str::of($request->slug)->slug('-');
        $validator = Validator::make($request->all(), [
            'category' => ['required'],
            'name' => ['required', 'string'],
            'code' => ['required', 'string', 'min:2', 'max:6'],
            'slug' => ['required', 'string', 'max:255','unique:providers'],
            'status' => ['required']
        ]);
        if($validator->fails()) {
            $provider = Provider::where('id',$request->id)->get();
            return redirect('dashboard/admin/provider')->with('provider', $provider)->withErrors($validator);
        }
        $provider = Provider::where('id',$request->id)->update([
            'name' => $request->name,
            'code' => $request->code,
            'slug' => $slug,
            'status' => $request->status,
            'category_id' => $request->category
        ]);
        $category = Category::where('id',$request->category);
        $provider = Provider::where('id',$request->id)->get();
        return redirect('dashboard/admin/provider')->with('provider', $provider);

    }
    public function getService(Provider $provider)
    {
        return $provider->service()->select('id','name')->get();
    }
}
