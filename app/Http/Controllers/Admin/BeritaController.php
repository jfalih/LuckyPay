<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Site;
use App\Berita;
use App\Category;
use DataTables;

class BeritaController extends Controller
{
    public function index()
    {
        $site = Site::first();
        return view('admin.berita',[
            'site' => $site,
            'category' => Category::where('status','active')->get(),
        ]);
    }

    public function create(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'keterangan' => ['required','min:6','string'],
            'status' => ['required'],
            'title' => ['required', 'min:6', 'max:25']
        ]);

        if($validation->fails()) {
            return redirect('dashboard/admin/berita')->withErrors($validation);
        }

        $insert = Berita::create([
            'keterangan' => $request->keterangan,
            'status' => $request->status,
            'title' => $request->title
        ]);

        if($insert) {
            return redirect('dashboard/admin/berita')->with('success', 'Berita berhasil dibuat!');
        } else {
            return redirect('dashboard/admin/berita')->with('error', 'Error Server!');
        }
    }

    public function update($id, Request $request)
    {
        $berita = Berita::where('id', $id)->first();
        $validator = Validator::make($request->all(),[
            'keterangan' => ['required','string','min:6'],
            'status' => ['required'],
            'title' => ['required', 'min:6', 'max:25']
        ]);

        $update = $berita->update([
            'keterangan' => $request->keterangan,
            'status' => $request->status,
            'title' => $request->title
        ]);

        if($update){
            return redirect('dashboad/admin/berita')->with('success', 'Berhasil update berita!');
        } else {
            return redirect('dashboard/admin/berita')->with('error', 'Error Server!');
        }
    }

    public function destroy($id)
    {
        $berita = Berita::where('id', $id)->delete();
        if($berita) {
            return redirect('dashboard/admin/berita')->with('success', 'Berhasil menghapus berita');
        } else {
            return redirect('dashboard/admin/berita')->with('error', 'Error server!');
        }
    }
    public function show($id)
    {
        $berita = Berita::where('id', $id)->get();
        return redirect('dashboard/admin/berita')->with('berita', $berita);
    }
    public function json()
    {
        $berita = Berita::all();
        return DataTables::of($berita)
        ->addIndexColumn()
        ->addColumn('action', 'admin.berita.datatables')->rawColumns(['action'])
        ->make(true);
    }
}
