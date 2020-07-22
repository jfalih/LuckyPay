<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Provider, Service, Category};
class ProviderController extends Controller
{
    public function json(Provider $provider)
    {
        return $provider->service()->select('id','name')->get();
    }
}
