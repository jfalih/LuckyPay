<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use DataTables;
use App\Category;
use App\Site;
class CategoryController extends Controller
{
    public function index()
    {   
        $site = Site::first();
        $category = Category::all();
        return view('admin.category',[
            'site' => $site,
            'category' => $category
        ]);
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:20'],
            'icon' => ['required', 'string'],
            'slug' => ['required', 'string', 'max:255'],
            'template' => ['required'],
            'status' => ['required']
        ]);

        if($validator->fails()) {
            return redirect('dashboard/admin/category')->withErrors($validator);
        }
        $slug = Str::of($request->slug)->slug('-');
        $check_slug = Category::where('slug', $slug);
        if($check_slug->count() > 0) {
            $random = Str::random(30);
            $baru = Str::of($request->slug.' '.$random)->slug('-');
        } else {
            $baru = $slug;
        }
        $category = Category::create([
            'name' => $request->name,
            'icon' => $request->icon,
            'slug' => $baru,
            'template' => $request->template,
            'status' => $request->status
        ]);

        if($category) {
            return redirect('dashboard/admin/category')->with('success','Berhasil menambahkan category');
        }
    }

    public function delete($id)
    {
        $delete = Category::where('id', $id)->delete();
        if($delete) {
            return redirect('dashboard/admin/category')->with('success','Delete category '.$id.' success');
        } else {
            return redirect('dashboard/admin/category')->with('error', 'Server error!');
        }
    }

    public function edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:20'],
            'icon' => ['required', 'string'],
            'slug' => ['required', 'string', 'max:255'],
            'template' => ['required'],
            'status' => ['required']
        ]);
        if($validator->fails()) {
            $category = Category::where('id',$request->id)->get();
            return redirect('dashboard/admin/category')->with('category', $category)->withErrors($validator);
        }
        $slug = Str::of($request->slug)->slug('-');
        $category = Category::where('id',$request->id)->update([
            'name' => $request->name,
            'icon' => $request->icon,
            'slug' => $slug,
            'template' => $request->template,
            'status' => $request->status
        ]);
        $cat = Category::where('id',$request->id)->get();
        if($category){
            return redirect('dashboard/admin/category')->with('success', 'Berhasil merubah category!');
        } else {
            return redirect('dashboard/admin/category')->with('error', 'Server Error!');
        }
    }
    public function show(Request $request)
    {
        $category = Category::where('id',$request->id)->get();
        $site = Site::first();
        return redirect('/dashboard/admin/category')->with('category', $category);
    }
    
    public function json()
    {
        $category = Category::all();
        $site = Site::first();
        return DataTables::of($category)
        ->addIndexColumn()
        ->addColumn('action', 'admin.category.datatables')->rawColumns(['action'])
        ->make(true);
    }

    public function getProvider(Category $category)
    {
        return $category->provider()->select('id','name')->get();
    }
}
