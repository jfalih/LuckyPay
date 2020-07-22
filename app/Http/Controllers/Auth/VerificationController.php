<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\VerifiesEmails;
use App\{Site,Category, User, Subject};
use Auth;
class VerificationController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Email Verification Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling email verification for any
    | user that recently registered with the application. Emails may also
    | be re-sent if the user didn't receive the original email message.
    |
    */

    use VerifiesEmails;
    public function show(){
        $user = User::where('id', Auth::user()->id)->first();
        $site = Site::first();
        if($user->email_verified_at === null){
            $ticket =Subject::where('status','waiting')->get();
            $category = Category::where('status','active')->get();
            return view('auth.verify',[
                'site' => $site,
                'category' => $category,
                'ticket' => $ticket
            ]);
        } else {
            return redirect('home');
        }
      
    }
    /**
     * Where to redirect users after verification.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('signed')->only('verify');
        $this->middleware('throttle:6,1')->only('verify', 'resend');
    }
}
