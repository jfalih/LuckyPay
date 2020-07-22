<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

use App\Category;
use App\Site;
use App\Operan;
use App\Service;
use App\Provider;
use DataTables;

class ServiceController extends Controller
{
    public function index()
    {
        $site = Site::first();
        $category = Category::where('status','active')->get();
        $provider = Provider::where('status','active')->get();
        $operan = Operan::where('status','active')->get();
        return view('admin.service',[
            'site' => $site,
            'category' => $category,
            'provider' => $provider,
            'operan' => $operan
        ]);
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string','min:5'],
            'min' => ['required', 'integer'],
            'max' => ['required', 'integer'],
            'code' => ['required', 'string', 'unique:services'],
            'code_operan' => ['required', 'string'],
            'price' => ['required', 'integer'],
            'price_api' => ['required','integer'],
            'price_operan' => ['required','integer'],
            'operan' => ['required'],
            'category' => ['required'],
            'provider' => ['required'],
            'status' => ['required'],
            'note' => ['required', 'string'],
            'point'=> ['required', 'integer'],
        ]);

        if($validator->fails()){
            return redirect('dashboard/admin/service')->withErrors($validator);
        }

        $service = new Service;
        $provider = Provider::find($request->provider);
        $operan = Operan::find($request->operan);
        $service->name = $request->name;
        $service->min = $request->min;
        $service->max = $request->max;
        $service->code = $request->code;
        $service->code_operan = $request->code_operan;
        $service->price = $request->price;
        $service->price_api = $request->price_api;
        $service->price_operan = $request->price_operan;
        $service->status = $request->status;
        $service->operan_id = $request->operan;
        $service->provider_id = $request->provider;
        $service->point = $request->point;
        $service->note = $request->note;
        $service->save();
        return redirect('dashboard/admin/service')->with('success', 'Berhasil menambahkan service..!');
    }

    public function json()
    {
        $service = Service::all();
        $site = Site::first();
        return DataTables::of($service)
        ->addIndexColumn()
        ->addColumn('status',function(Service $service){
            if($service->status === 'active'){
                return '<div class="btn btn-primary">Active</div>';
            } else {
                return '<div class="btn btn-danger">Not Active</div>';
            }
        })
        ->addColumn('action', 'admin.service.datatables')->rawColumns(['action','status'])
        ->make(true);
    }

    public function getJson(Service $service)
    {
        return $service->select('id','name','price','min','max')->get();
    }

    
    public function show(Request $request)
    {
        $service = Service::where('id',$request->id)->get();
        $site = Site::first();
        return redirect('dashboard/admin/service')->with('service', $service);
    }

    public function delete($id)
    {
        $delete = Service::where('id', $id)->delete();
        if($delete) {
            return redirect('dashboard/admin/service')->with('success','Delete service '.$id.' success');
        } else {
            return redirect('dashboard/admin/service')->with('error', 'Server error!');
        }
    }
    public function edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string','min:5'],
            'min' => ['required', 'integer'],
            'max' => ['required', 'integer'],
            'code' => ['required', 'string', 'max:6'],
            'code_operan' => ['required', 'string', 'max:6'],
            'price' => ['required', 'integer'],
            'price_api' => ['required','integer'],
            'price_operan' => ['required','integer'],
            'operan' => ['required'],
            'category' => ['required'],
            'provider' => ['required'],
            'status' => ['required'],
            'note' => ['required', 'string'],
            'point'=> ['required', 'integer'],
        ]);
        if($validator->fails()) {
            $service = Service::where('id',$request->id)->get();
            return redirect('dashboard/admin/service')->with('service', $service)->withErrors($validator);
        }
        $service = Service::where('id',$request->id)->update([
            'name' => $request->name,
            'min' => $request->min,
            'max' => $request->max,
            'code' => $request->code,
            'code_operan' => $request->code_operan,
            'price' => $request->price,
            'price_api' => $request->price_api,
            'price_operan' => $request->price_operan,
            'operan_id' => $request->operan,
            'provider_id' => $request->provider,
            'status' => $request->status,
            'note' => $request->note,
            'point' => $request->point
        ]);
        $service = Service::where('id',$request->id)->get();
        return redirect('dashboard/admin/service')->with('success', 'Berhasil mengubah service..!');

    }
}
