<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\{User, Site, Category};
use Illuminate\Support\Str;

use DataTables;
class UserController extends Controller
{
    public function index()
    {
        $total_user = User::count();
        return view('admin.user',[
            'category' => Category::where('status','active')->get(),
            'site' => Site::first(),
            'total_user' => $total_user
        ]);
    }

    public function create(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'email' => ['required','unique:users','email'],
            'level' => ['required'],
            'password' => ['required','string'],
            'balance' => ['required','integer']
        ]);

        if($validator->fails()){
            return redirect('dashboard/admin/user')->withErrors($validator);
        }
        $random = Str::random(30);
        $insert = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'level' => $request->level,
            'api_key' => $random,
            'password' => Hash::make($request->password),
            'balance' => $request->balance
        ]);
        
        if($insert){
            return redirect('dashboard/admin/user')->with('success', 'Sukses menambahkan user!');
        } else {
            return redirect('dsahboard/admin/user')->with('error', 'Server error!');
        }
    }

    public function show($id){
        $user = User::where('id', $id)->first();
        return redirect('dashboard/admin/user')->with('user', $user);        
    }

    public function update($id, Request $request){
        $user = User::where('id', $id);
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'email' => ['required', 'email'],
            'level' => ['required'],
            'balance' => ['required','integer']
        ]);

        if($validator->fails()){
            return redirect('dashboard/admin/user')->with('user', $user->first())->withErrors($validator);
        }

        $update = $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'level' => $request->level,
            'balance' => $request->balance
        ]);
        if($update) {
            return redirect('dashboard/admin/user')->with('success','Berhasil menambah user!');            
        } else {
            return redirect('dashboard/admin/user')->with('error', 'Server Error!');
        }
    }

    public function delete($id){
        $delete = User::where('id', $id)->delete();
        if($delete){
            return redirect('dashboard/admin/user')->with('success','Berhasil menghapus user!');            
        } else {
            return redirect('dashboard/admin/user')->with('error', 'Server Error!');
        }
    }

    public function json(){
        $user = User::all();
        return DataTables::of($user)
        ->addColumn('status', function(User $user){
            if($user->status === 'active'){
                return '<div class="btn btn-success">Active</div>';
            } else {
                return '<div class="btn btn-danger">Not Active</div>';    
            }
        })
        ->addColumn('balance', function(User $user){
            return 'Rp'.number_format($user->balance,2,',','.');
        })
        ->addColumn('action','admin.user.action')
        ->rawColumns(['status','action'])
        ->make(true);
    }
}
