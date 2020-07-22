<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class Developer
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
        if(Auth::user()->level === "developer") {
            return $next($request);
        }
        return redirect('home')->with('error', 'Upgrade akun anda untuk mengakses halaman ini..');
    }
}
