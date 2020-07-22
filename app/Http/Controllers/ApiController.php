<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Category, Site, Subject};
class ApiController extends Controller
{
    public function index(){
        $category = Category::where('status', 'active')->get();
        $site = Site::first();

        return view('api', [
        'category' => $category ,
        'site' => $site,
        'ticket' => Subject::where('status','waiting')
        ]);
    }
    
    public function example(){
        $category = Category::where('status', 'active')->get();
        $site = Site::first();

        return view('api.example', [
        'category' => $category ,
        'site' => $site,
        'ticket' => Subject::where('status','waiting')
        ]);
    }
}
