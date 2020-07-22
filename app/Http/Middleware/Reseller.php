<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Auth;
use Closure;

class Reseller
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::user()->level === "reseller" || Auth::user()->level === "developer") {
            return $next($request);
        }
        return redirect('home')->with('error', 'Upgrade akun anda untuk mengakses halaman ini..');
    }
}
