<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Site, History_deposit, History, User, Service};
class WelcomeController extends Controller
{
    public function index()
    {
        $history = History::count();
        $user = User::count();
        $deposit = History_deposit::count();
        $layanan = Service::count();
        return view('landing', [
            'site' => Site::first(),
            'total_pemesanan' => $history,
            'total_user' => $user,
            'total_deposit' => $deposit,
            'total_layanan' => $layanan
        ]);
    }
}
