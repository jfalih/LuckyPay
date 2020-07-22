<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\{Category, Site, Ticket, Subject, User};
use Auth;
use DataTables;
class TicketController extends Controller
{
    public function index(){
        $site = Site::first();
        $category = Category::where('status', 'active')->get();
        return view('ticket.ticket', [
            "category" => $category,
            "site" => $site,
            "ticket" => Subject::where('status','waiting')
        ]);
    }
    public function detail($id){
        $subject = Subject::where('id', $id)->first();
        $ticket = Ticket::where('subject_id', $id)->get();
        $site = Site::first();
        $category = Category::where('status', 'active')->get();
        return view('ticket.detail', [
            'subject' => $subject,
            'ticket' => $ticket,
            "category" => $category,
            "site" => $site
        ]);
    }
    public function json()
    {   
        $subject = Subject::where('user_id', Auth::user()->id)->get();
        $data = DataTables::of($subject)
        ->addIndexColumn()
        ->addColumn('title', function(Subject $subject){
            $site = Site::first();
            return '<a href='.$site->url.'/ticket/'.$subject->id.'/detail>'.$subject->title.'</a>';
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
        ->rawColumns(['title','status','date'])
        ->make(true);
        return $data;
    }

    public function add()
    {
        return redirect('ticket')->with('ticket', 'Berhasil Redirect');
    }
    public function update($id, Request $request)
    {
        $site = Site::first();
        $validator = Validator::make($request->all(), [
            'pesan' => ['required','min:6','max:150','string']
        ]);
        if($validator->fails()){
            return redirect('/ticket/'.$id.'/detail')->withErrors($validator);
        }
        $subject = Subject::where('id', $id);
        if($subject->count() > 0) {
        $ticket = new Ticket();
        $ticket->subject_id = $id;
        $ticket->user_id = Auth::user()->id;
        $ticket->pesan = $request->pesan;
        if(Auth::user()->level === 'developer'){
        $subject->update([
            'status' => 'success']);
        } else {
        $subject->update([
            'status' => 'waiting'
            ]);
        }
        $ticket->save();
        return redirect($site->url.'/ticket/'.$id.'/detail');
        } else {
            return abort(404);
        }
    }
    public function create(Request $request){
        $site = Site::first();
        $validator = Validator::make($request->all(), [
            'title' => ['required','min:6','max:50','string'],
            'pesan' => ['required','min:6','max:150','string']
        ]);

        if($validator->fails()){
            return redirect($site->url.'/ticket')->with('ticket', Auth::user()->id)->withErrors($validator);
        }
        $subject = new Subject();
        $subject->title = $request->title;
        $subject->status = 'waiting';
        $subject->user_id = Auth::user()->id;
        $subject->save();
        $ticket = new Ticket();
        $ticket->pesan = $request->pesan;
        $ticket->user_id = Auth::user()->id;
        $ticket->subject_id = $subject->id;
        $ticket->save();
        if($subject){
            return redirect($site->url.'/ticket/'.$subject->id.'/detail');
        }
    }
    
    public function show($id){
        $subject = Subject::where('id', $id)->first();
        $site = Site::first();
        return redirect($site->url.'/ticket/'.$id.'/detail');
    }
}
