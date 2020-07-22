<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Site, Category, History_deposit, Subject, User};
class TopController extends Controller
{
    public function index()
    {
        $site = Site::first();
        $deposit = User::where([
            ['total_deposit','!=', '0'],
        ]);
        $pulsa = User::where([
            ['total_pulsa', '!=', '0']
        ]);
        $sosmed = User::where([
            ['total_sosmed', '!=','0']
        ]);
        $category = Category::where('status','active')->get();
        return view('top', [
            'site' => $site,
            'category' => $category,
            'deposits' => $deposit->get(),
            'pulsa' => $pulsa->get(),
            'sosmed' => $sosmed->get(),
            'ticket' => Subject::where('status','waiting')
        ]);
    }
}
