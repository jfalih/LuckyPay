<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\{Category, Site, Ticket, Subject};
use DataTables;
class TicketController extends Controller
{
    public function index()
    { $site = Site::first();
        $category = Category::where('status', 'active')->get();
        return view('admin.ticket', [
            "category" => $category,
            "site" => $site
        ]);
    }
    public function json()
    {
        $subject = Subject::get();
        $data = DataTables::of($subject)
        ->addIndexColumn()
        ->addColumn('title', function(Subject $subject){
            return '<a href="">'.$subject->title.'</a>';
        })
        ->addColumn('status', function(Subject $subject){
            if($subject->status === 'waiting'){
                return '<div class="badge badge-warning">'.$subject->status.'</div>';
            } else if($subject->status === 'success'){
                return '<div class="badge badge-success">'.$subject->status.'</div>';
            } else if($subject->status === 'closed'){
                return '<div class="badge badge-danger">'.$subject->status.'</div>';
            }
        })        
        ->addColumn('date', function(Subject $subject){
            return $subject->created_at;
        })
        ->addColumn('action', function(Subject $subject){
            $site = Site::first();
            return '<a href='.$site->url.'/dashboard/admin/ticket/'.$subject->id.' class="btn btn-primary mr-1 text-white">Edit</a><a href='.$site->url.'/ticket/'.$subject->id.'/detail class="btn btn-primary text-white">View</a>';
        })
        ->rawColumns(['title','status','date','action'])
        ->make(true);
        return $data;
    }
    
    public function show($id){
        $subject = Subject::where('id', $id)->first();
        $site = Site::first();
        return redirect($site->url.'/dashboard/admin/ticket')->with('subject', $subject);
    }

    
    public function edit($id, Request $request){
        $subject = Subject::where('id', $id);
        $site = Site::first();
        $validator = Validator::make($request->all(), [
            'status' => ['required']
        ]);
        if($validator->fails()){
            return redirect($site->url.'/dashboard/admin/ticket')->with('subject', $subject->first())->withErrors($validator);
        }
        $subject->update([
            'status' => $request->status
        ]);
        if($subject){
            return redirect($site->url.'/dashboard/admin/ticket')->with('success', 'Berhasil mengubah ticket');
        }
    }
}
