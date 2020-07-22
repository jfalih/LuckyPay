<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Berita;
use DataTables;
class BeritaController extends Controller
{
    public function json()
    {
        $berita = Berita::where('status','active')->get();
        return DataTables::of($berita)
        ->addIndexColumn()
        ->addColumn('date', function(Berita $berita){
            return $berita->created_at;
        })
        ->addColumn('action', 'berita.datatables')->rawColumns(['action','date'])
        ->make(true);
    }

    public function show($id)
    {
        $berita = Berita::where('id', $id)->get();
        return redirect('home')->with('berita', $berita);
    }
}
