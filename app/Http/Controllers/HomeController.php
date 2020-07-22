<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Site, Category, Subject};
use Auth;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth','verified']);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if(\Request::is('home')){
            $active = 'active';
        } else {
            $active = '';
        }
        $category = Category::where('status', 'active')->get();
        $site = Site::first();
        return view('home', ['active' => $active,
        'category' => $category ,
        'site' => $site,
        'ticket' => Subject::where('status','waiting')]);
    }

    public function verify()
    {
        if(Auth::user()->email_verified_at === null){
        $category = Category::where('status', 'active')->get();
        $site = Site::first();
        return view('auth.verify', [
        'category' => $category ,
        'site' => $site
        ]);
        } else {
            return redirect('home');
        }
    }
    
    public function more()
    {
        $category = Category::where('status','active')->get();
        return redirect('home')->with('more', $category);
    }
}
