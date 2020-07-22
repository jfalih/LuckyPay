<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Site, Category, Subject};
use Auth;
class CallbackController extends Controller
{
    public function index(Request $request)
    {
        print_r(json_encode($request->content));
    }
}
