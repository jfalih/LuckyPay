<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Provider, Service, Category};
class ServiceController extends Controller
{
    public function json($category, $provider)
    {
        $category = Category::where('slug', $category)->first();
        $provider = Provider::where([['slug',"=", $provider] , ['category_id','=',$category->id],['status','=','active']]);
        $service = Service::where([['provider_id', "=",$provider->first()->id], ['status', '=','active']])->with('provider');
        return $service->select('id','code','note','name','price','provider_id')->get();
    }
    
    public function service_json($id)
    {
        $service = Service::where('id',$id)->get();
        return $service;
    }
    
    public function more_harga()
    {
        $category = Category::where('status','active')->get();
        return redirect('harga')->with('more', $category);
    }
}
