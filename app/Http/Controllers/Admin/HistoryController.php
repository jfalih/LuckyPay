<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Validator;
use App\{Site, Category, Provider, User, History, Operan, Service};
class HistoryController extends Controller
{
    public function index($slug){
        $template = Category::where('slug', $slug)->first();
        $category = Category::where('status', 'active')->get();
        $site = Site::first();
        $provider = Provider::where('category_id', $template->id)->get();
        foreach($provider as $prov){
                $service = Service::where('provider_id', $prov->id)->get();
                if($service->count() > 0) {
                    foreach($service as $layanan){
                        $history = History::where('service_id',$layanan->id)->get();
                            switch ($template->template) {
                                case 'pulsa':
                                    return view('admin.history.pulsa', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                    ]);
                                    break;
                                case 'sosmed':
                                    return view('admin.history.sosmed', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                    ]);
                                    break;
                               case 'pln':
                                    return view('admin.history.pln', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                    ]);
                                    break;
                                default:
                                    return abort(404);
                                    break;
                        }
                    }
                } else {
                    $his = [];
                    switch ($template->template) {
                                case 'pulsa':
                                    return view('admin.history.pulsa', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => 0,
                                        "history" => $his,
                                    ]);
                                    break;
                                case 'sosmed':
                                    return view('admin.history.sosmed', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => 0,
                                        "history" => $his,
                                    ]);
                                    break;
                                case 'pln':
                                    return view('admin.history.pln', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                    ]);
                                    break;
                                default:
                                    return abort(404);
                                    break;
                }
                } 
            }
            return abort(404);
    }

    public function show($slug, $id){
        $detail = History::where('id',  $id)->get();
        $service = Service::where('id', $detail->first()->service_id)->first();
        $site = Site::first();
        $category = Category::where('status', 'active')->get();
        $template = Category::where('slug', $slug)->get();
        if($detail->count() > 0) {
        return redirect('dashboard/admin/order/'.$slug)->with('order', $detail);
        } else {
            return abort(404);
        }
    }
    public function destroy($slug, $id){
      $history = History::where('id', $id)->delete();
      if($history){
          return redirect('dashboard/admin/order/'.$slug)->with('success', 'Berhasil menghapus order!');
      } else {
        return redirect('dashboard/admin/order/'.$slug)->with('error', 'Server Error!');
      }
    }
    public function update($slug, $id, Request $request) {
        $validator = Validator::make($request->all(), [
            'status' => $request->status,
            'refund' => $request->refund,
            ]);
        $detail = History::where('id',  $id); 
        if($validator->fails()){
            return redirect('dashboard/admin/order/'.$slug)->with('order', $detail->get())->withErrors($validator);
        }
        
        $update = $detail->update([
            'status' => $request->status,
            'refund' => $request->refund
            ]);
        if($update){
            return redirect('dashboard/admin/order/'.$slug)->with('success','Berhasil Update History '.$id);
        } else {
            return redirect('dashboard/admin/order/'.$slug)->with('error', 'Server Error!');
        }
    }
    public function json($slug){
        $template = Category::where('slug', $slug )->first();
        $provider = Provider::where('category_id', $template->id)->get();
        $a = [];
        foreach($provider as $prov_value){
            $service = Service::where('provider_id', $prov_value->id)->get();
              foreach($service as $val){
               $history = History::where('service_id', $val->id)->with(['service','user'])->get();
               foreach($history as $his){
                   $a[] = $his;
               }
           }
        }
        if($template->template === "sosmed"){
        $site = Site::first();
         $data = DataTables::of($a)
                            ->addIndexColumn()
                            ->addColumn('slug', $slug)
                            ->addColumn('via', 'history.web')
                            ->addColumn('site', $site)
                            ->addColumn('refund', 'history.refund')
                            ->addColumn('keuntungan', function(History $history){
                                $count = $history->service->price * $history->quantity / 1000 - $history->service->price_operan  * $history->quantity / 1000;
                                return '<button type="button" class="btn btn-outline-primary round mr-1 mb-1 waves-effect waves-light">'.$count.'</button>';
                            })
                            ->addColumn('provider', function(History $history){
                                $provider = $history->service->provider->name;
                                return $provider;
                            })
                            ->addColumn('operan', function(History $history){
                                $name = $history->service->operan->name;
                                return $name;
                            })
                            ->addColumn('status', 'history.status')
                            ->addColumn('action', 'admin.history.action')
                            ->rawColumns(['slug','status','via','refund','keuntungan','site','action'])
                            ->make(true);
                        return $data;
        } else {
            $site = Site::first();
         $data = DataTables::of($a)
                            ->addIndexColumn()
                            ->addColumn('slug', $slug)
                            ->addColumn('via', 'history.web')
                            ->addColumn('site', $site)
                            ->addColumn('refund', 'history.refund')
                            ->addColumn('keuntungan', function(History $history){
                                $count = $history->service->price - $history->service->price_operan;
                                return '<button type="button" class="btn btn-outline-primary round mr-1 mb-1 waves-effect waves-light">'.$count.'</button>';
                            })
                            ->addColumn('provider', function(History $history){
                                $provider = $history->service->provider->name;
                                return $provider;
                            })
                            ->addColumn('operan', function(History $history){
                                $name = $history->service->operan->name;
                                return $name;
                            })
                            ->addColumn('status', 'history.status')
                            ->addColumn('action', 'admin.history.action')
                            ->rawColumns(['slug','status','via','refund','keuntungan','site','action'])
                            ->make(true);
                        return $data;
        }
    }


}
