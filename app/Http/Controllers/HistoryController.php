<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Category, Site, History, Service, User, Subject, Provider};
use Auth;
use DataTables;
class HistoryController extends Controller
{ 
    public function index($slug){
        $template = Category::where('slug', $slug)->first();
        $category = Category::where('status', 'active')->get();
        $site = Site::first();
        $provider = Provider::where('category_id', $template->id)->get();
        if($provider->count() > 0) {
            foreach($provider as $prov){
                $service = Service::where('provider_id', $prov->id)->get();
                if($service->count() > 0) {
                    foreach($service as $layanan){
                        $history = History::where([
                            ['user_id','=', Auth::user()->id],
                            ['service_id','=',$layanan->id]
                        ])->get();
                            switch ($template->template) {
                                case 'pulsa':
                                    return view('history.pulsa', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                        "ticket" => Subject::where('status','waiting')
                                    ]);
                                    break;
                                case 'sosmed':
                                    return view('history.sosmed', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                        "ticket" => Subject::where('status','waiting')
                                    ]);
                                    break;
                                case 'pln':
                                     return view('history.pln', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => $history->count(),
                                        "history" => $history,
                                        "ticket" => Subject::where('status','waiting')
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
                                    return view('history.pulsa', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => 0,
                                        "history" => $his,
                                        "ticket" => Subject::where('status','waiting')
                                    ]);
                                    break;
                                case 'sosmed':
                                    return view('history.sosmed', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => 0,
                                        "history" => $his,
                                        "ticket" => Subject::where('status','waiting')
                                    ]);
                                    break;
                                case 'pln':
                                    return view('history.pln', [
                                        "provider" => $provider,
                                        "category" => $category,
                                        "template" => $template,
                                        "site" => $site,
                                        "count_history" => 0,
                                        "history" => $his,
                                        "ticket" => Subject::where('status','waiting')
                                    ]);
                                    break;
                                default:
                                    return abort(404);
                                    break;
                }
                } 
            }
        } else {
            return abort(404);   
        }
    }

    public function json($slug){
        $template = Category::where('slug', $slug )->first();
        $provider = Provider::where('category_id', $template->id)->get();
        $a = [];
        foreach($provider as $prov_value){
            $service = Service::where('provider_id', $prov_value->id)->get();
              foreach($service as $val){
               $history = History::where([['service_id', '=',$val->id],['user_id','=', Auth::user()->id]])->with(['service','user'])->get();
               foreach($history as $his){
                   $a[] = $his;
               }
               }
        }
        $site = Site::first();
         $data = DataTables::of($a)
                            ->addIndexColumn()
                            ->addColumn('slug', $slug)
                            ->addColumn('site', $site)
                            ->addColumn('refund', 'history.refund')
                            ->addColumn('via','history.web')
                            ->addColumn('keuntungan', function(History $history){
                                $count = $history->service->price - $history->service->price_operan;
                                return '<button type="button" class="btn btn-outline-primary round mr-1 mb-1 waves-effect waves-light">'.$count.'</button>';
                            })
                            ->addColumn('status', 'history.status')
                            ->addColumn('action', 'history.action')
                            ->rawColumns(['slug','status','via','refund','keuntungan','site','action'])
                            ->make(true);
                        return $data;
    }

    public function show($slug, $id){
    if(Auth::user()->level !== "developer") {
        $detail = History::where([
            ['user_id', '=', Auth::user()->id],
            ['id', '=', $id]
        ]);
        
        if($detail->first()->user_id === Auth::user()->id) {
            $service = Service::where('id', $detail->first()->service_id)->first();
            $site = Site::first();
            $category = Category::where('status', 'active')->get();
            $template = Category::where('slug', $slug)->get();
            if($detail->count() > 0) {
            return view('invoice',[
                "detail" => $detail->get(),
                "service" => $service,
                "category" => $category,
                "site" => $site,
                "ticket" => Subject::where('status','waiting')->get()
            ]);
            } else {
                return abort(404);
            }
        } else {
            return redirect('history')->with('error', 'History ini bukan milikmu kawan..');
        }
    } else {
        $detail = History::where('id', $id);
           $service = Service::where('id', $detail->first()->service_id)->first();
            $site = Site::first();
            $category = Category::where('status', 'active')->get();
            $template = Category::where('slug', $slug)->get();
            if($detail->count() > 0) {
            return view('invoice',[
                "detail" => $detail->get(),
                "service" => $service,
                "category" => $category,
                "site" => $site,
                "ticket" => Subject::where('status','waiting')->get()
            ]);
            } else {
                return abort(404);
            }
    }
    }
}
