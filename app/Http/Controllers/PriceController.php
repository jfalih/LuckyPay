<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Category,Site,Subject,Provider,Service};
use DataTables;
class PriceController extends Controller
{
    public function index($slug)
    {
        $template = Category::where('slug', $slug)->first();
        $site = Site::first();
        $provider = Provider::where('category_id', $template->id)->get();
            foreach($provider as $prov){
                $service = Service::where('provider_id', $prov->id)->get();
                if($service->count() > 0) {
                    switch ($template->template) {
                                case 'pulsa':
                                    return view('price.pulsa', [
                                        'template' => $template,
                                        'service' => $service,
                                        'provider' => $provider,
                                        'site' => Site::first(),
                                        'category' => Category::where('status','active')->get(),
                                        'ticket' => Subject::where('status','waiting')->get()
                                        ]);
                                    break;
                                case 'sosmed':
                                    return view('price.sosmed', [
                                        'template' => $template,
                                        'service' => $service,
                                        'provider' => $provider,
                                        'site' => Site::first(),
                                        'category' => Category::where('status','active')->get(),
                                        'ticket' => Subject::where('status','waiting')->get()
                                        ]);
                                    break;
                                case 'pln':
                                    return view('price.pln', [
                                        'template' => $template,
                                        'service' => $service,
                                        'provider' => $provider,
                                        'site' => Site::first(),
                                        'category' => Category::where('status','active')->get(),
                                        'ticket' => Subject::where('status','waiting')->get()
                                        ]);
                                    break;
                                default:
                                    return abort(404);
                                    break;
                        }
                } else {
                    switch ($template->template) {
                                case 'pulsa':
                                    return view('price.pulsa', [
                                        'template' => $template,
                                        'service' => $service,
                                        'provider' => $provider,
                                        'site' => Site::first(),
                                        'category' => Category::where('status','active')->get(),
                                        'ticket' => Subject::where('status','waiting')->get()
                                        ]);
                                    break;
                                case 'sosmed':
                                    return view('price.sosmed', [
                                        'template' => $template,
                                        'service' => $service,
                                        'provider' => $provider,
                                        'site' => Site::first(),
                                        'category' => Category::where('status','active')->get(),
                                        'ticket' => Subject::where('status','waiting')->get()
                                        ]);
                                    break;
                                case 'pln':
                                    return view('price.pln', [
                                        'template' => $template,
                                        'service' => $service,
                                        'provider' => $provider,
                                        'site' => Site::first(),
                                        'category' => Category::where('status','active')->get(),
                                        'ticket' => Subject::where('status','waiting')->get()
                                        ]);
                                    break;
                                default:
                                    return abort(404);
                                    break;
                    }
                } 
            }
    }
    
    public function json($slug)
    {
        $category = Category::where('slug', $slug)->first();
        if($category !== null){
            foreach($category->provider as $provider){
                $service = Service::where('provider_id', $provider->id)->with('provider')->get();
                foreach($service as $layanan){
                    $a[] = $layanan;
                }
            }
            $site = Site::first();
            $data = DataTables::of($a)
                ->addIndexColumn()
                ->addColumn('slug', $slug)
                ->addColumn('site', $site)
                ->addColumn('status', 'price.status')
                ->rawColumns(['slug','status','site'])
                ->make(true);
            return $data;
        } else {
            $a = [];
            $site = Site::first();
            $data = DataTables::of($a)
                ->addIndexColumn()
                ->addColumn('slug', $slug)
                ->addColumn('site', $site)
                ->addColumn('status', 'price.status')
                ->rawColumns(['slug','status','site'])
                ->make(true);
            return $data;
        }
    }
}
