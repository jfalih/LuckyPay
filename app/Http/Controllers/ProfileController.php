<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\{Category, Site, User, Subject, History};
use Illuminate\Support\Facades\Validator;
use Auth;
use Illuminate\Support\Facades\Hash;
class ProfileController extends Controller
{
    public function index()
    {
        $category = Category::where('status','active')->get();
        $site = Site::first();
        $user = User::where('id', Auth::user()->id)->first();
        $history = History::where('user_id', Auth::user()->id)->count();
        return view('profile',[
            'category' => $category,
            'site' => $site,
            'user' => $user,
            'ticket' => Subject::where('status','waiting'),
            'total_transaksi' => $history
        ]);
    }

    public function new_api(){
        $random = Str::random(30);
        $user = User::where('id', Auth::user()->id)->first();
        $update = $user->update([
            'api_key' => $random
        ]);
        return $random;
    }
    public function change_name(Request $request)
    {
        $user = User::where('id', Auth::user()->id)->first();
        $validator = Validator::make($request->all(),[
            'name' => ['required', 'alpha']
        ]);
        $a = $user->update([
            'name' => $request->name
        ]);
        if($a){
            return redirect('profile')->with('success', 'Berhasil merubah profile!');
        } else {
            return redirect('profile')->with('error', 'Error Server!');    
        } 
    }

    public function change_password(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'password_lama' => ['required'],
            'password_baru' => ['required', 'min:6'],
            'konfirm_password_baru' => ['required', 'same:password_baru']
        ]);
        if($validator->fails()){
            return redirect('profile')->withErrors($validator);
        }

        $user = User::where('id', Auth::user()->id);

        if(Hash::check($request->password_lama, $user->first()->password)){
            $update = $user->update([
                'password' => Hash::make($request->password_baru)
            ]);
            if($update){
                return redirect('profile')->with('success', 'Berhasil update profile!');
            } else {
                return redirect('profile')->with('error', 'Error server!');
            }
        } else {
            return redirect('profile')->with('error', 'Error password lama salah!');
        }
    }
    public function change_ip(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'static_ip' => ['required'],
        ]);
        if($validator->fails()){
            return redirect('profile')->withErrors($validator);
        }
        $user = User::where('id', Auth::user()->id);
        $update = $user->update([
            'ip_static' => $request->static_ip
        ]);
        if($update){
            return redirect('profile')->with('success', 'Berhasil update profile!');
        } else {
            return redirect('profile')->with('error', 'Error server!');
        }
    }
    
    public function setting(Request $request)
    {
        $category = Category::where('status','active')->get();
        $site = Site::first();
        $user = User::where('id', Auth::user()->id)->first();
        $history = History::where('user_id', Auth::user()->id)->count();
        return view('setting.profile',[
             'category' => $category,
            'site' => $site,
            'user' => $user,
            'ticket' => Subject::where('status','waiting'),
            'total_transaksi' => $history
        ]);
    }
}
