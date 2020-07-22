<?php

use Illuminate\Support\Facades\Route;
use App\{Category, Site, Subject};
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','WelcomeController@index');
Route::get('/cron',function(){
   Artisan::call('schedule:run');
   return response('Hello',200);
});
Route::post('/callback','CallbackController@index');
Auth::routes(['verify' => true]);
Route::group(['middleware' => ['auth','verified']], function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::post('/more', 'HomeController@more')->name('more_order');
    Route::post('/harga/more', 'ServiceController@more_harga')->name('more_harga');
    Route::post('/deposit/batalkan/{id}','DepositController@cancel_depo')->name('cancel_depo');
    Route::get('/service/{id}/json', 'ServiceController@service_json');
    Route::get('/history/deposit','SaldoController@index');
    Route::get('/history/deposit/json','SaldoController@json');
    Route::get('/point', 'PointController@index');
    
    Route::post('/point/change','PointController@change_point')->name('change_point');
    
    Route::get('/history', function(){
        return view('riwayat',[
            'category' => Category::where('status','active')->get(),
            'site' => Site::first(),
            'ticket' => Subject::where('status','waiting')->get()
        ]);
    });
        
    Route::get('/harga', function(){
        return view('harga',[
            'category' => Category::where('status','active')->get(),
            'site' => Site::first(),
            'ticket' => Subject::where('status','waiting')->get()
        ]);
    });
    
    //Api
    Route::get('/api', 'ApiController@index');
    Route::get('/api/example','ApiController@example');
    
    //Berita
    Route::get('/berita/json','BeritaController@json');
    Route::post('/berita/{id}','BeritaController@show')->name('berita.show');
    
    //Top
    Route::get('/top','TopController@index')->name('top');
    
    //Transfer
    Route::get('/transfer','TransferController@index')->name('transfer');
    Route::post('/transfer',['uses'=>'TransferController@transfer_saldo','as' => 'transfer_saldo']);
    
    //Profile
    Route::get('/profile', 'ProfileController@index');
    Route::post('/profile/name', 'ProfileController@change_name')->name('change_name');
    Route::post('/profile/password', 'ProfileController@change_password')->name('change_password');
    Route::get('/profile/api', 'ProfileController@new_api');
    Route::get('/setting/profile', 'ProfileController@setting');
    Route::post('/profile/ip', 'ProfileController@change_ip')->name('change_ip');;
    //Order
    Route::get('/order/{slug}','OrderController@index');
    Route::post('/order/{slug}/add','OrderController@add')->name('order');
    Route::get('/service/{category}/{provider}/json','ServiceController@json');
    
    //Harga
    Route::get('/harga/{slug}','PriceController@index');
    Route::get('/harga/{slug}/json','PriceController@json');
    
    //History
    Route::get('/history/{slug}','HistoryController@index');
    Route::get('/history/{slug}/json','HistoryController@json')->name('history.json');
    Route::get('/history/{slug}/{id}','HistoryController@show');

    //Reseller
    Route::group(['middleware' => ['reseller']], function () {
        Route::get('/dashboard','DashboardController@index')->name('dashboard');
    });
    //Deposit
    Route::get('/deposit', 'DepositController@index')->name('deposit');
    Route::get('/deposit/json','DepositController@json');
    Route::get('/deposit/{id}/history', 'DepositController@history');
    Route::post('/deposit/add','DepositController@add')->name('tambah_deposit');
    Route::get('/deposit/{method}/getdeposit', 'DepositController@getDeposit');
    Route::post('/deposit/{id}/konfirmasi','DepositController@konfirmasi')->name('konfirmasi_deposit');
    //Ticket
    Route::get('/ticket', 'TicketController@index')->name('ticket');
    Route::get('/ticket/json', 'TicketController@json');
    Route::post('/ticket/add', 'TicketController@add')->name('ticket.show');
    Route::get('/ticket/{id}/detail','TicketController@detail');
    Route::post('/ticket/{id}/update',['uses'=>'TicketController@update', 'as'=>'ticket.update']);
    Route::post('/ticket/create',['uses'=>'TicketController@create', 'as'=>'ticket.create']);
    //Admin
    Route::get('/provider/{provider}/service','ProviderController@json');
        Route::group(['middleware' => 'developer'], function () {
            //Category   
            Route::get('/dashboard/admin/category',['uses'=>'Admin\CategoryController@index', 'as'=>'cat.admin.index']);
            Route::post('/dashboard/admin/category/edit',['uses'=>'Admin\CategoryController@edit', 'as'=>'cat.admin.edit']);
            Route::get('/dashboard/admin/category/json',['uses'=>'Admin\CategoryController@json', 'as'=>'cat.admin.json']);
            Route::post('/dashboard/admin/category/add',['uses'=>'Admin\CategoryController@create', 'as'=>'cat.admin.add']);
            Route::get('/dashboard/admin/category/delete/{id}','Admin\CategoryController@delete');
            Route::get('/dashboard/admin/category/{category}/provider','Admin\CategoryController@getProvider');
            Route::post('/dashboard/admin/category/show',['uses'=>'Admin\CategoryController@show', 'as'=>'cat.admin.show']);
        
            //Berita
            Route::get('/dashboard/admin/berita', ['uses' => 'Admin\BeritaController@index', 'as' => 'berita.admin.index']);
            Route::put('/dashboard/admin/berita/{id}/update',['uses' => 'Admin\BeritaController@update', 'as' => 'berita.admin.update']);
            Route::get('/dashboard/admin/berita/json', ['uses' => 'Admin\BeritaController@json', 'as' => 'berita.admin.json']);
            Route::post('/dashboard/admin/berita/add',['uses'=>'Admin\BeritaController@create', 'as'=>'berita.admin.add']);
            Route::get('/dashboard/admin/berita/{id}', ['uses' => 'Admin\BeritaController@show', 'as' => 'berita.admin.show']);
            Route::delete('/dashboard/admin/berita/{id}/delete', ['uses' => 'Admin\BeritaController@destroy', 'as'=> 'berita.admin.destroy']);
            //Provider
            Route::get('/dashboard/admin/provider',['uses'=>'Admin\ProviderController@index', 'as'=>'provider.admin.index']);
            Route::post('/dashboard/admin/provider/edit',['uses'=>'Admin\ProviderController@edit', 'as'=>'provider.admin.edit']);
            Route::post('/dashboard/admin/provider/show',['uses'=>'Admin\ProviderController@show', 'as'=>'provider.admin.show']);
            Route::post('/dashboard/admin/provider/add',['uses'=>'Admin\ProviderController@create', 'as'=>'provider.admin.add']);
            Route::get('/dashboard/admin/provider/json',['uses'=>'Admin\ProviderController@json', 'as'=>'provider.admin.json']);
            Route::get('/dashboard/admin/provider/delete/{id}','Admin\ProviderController@delete');

            //Service
            Route::get('/dashboard/admin/service',['uses'=>'Admin\ServiceController@index', 'as'=>'service.admin.index']);
            Route::get('/dashboard/admin/service/json',['uses'=>'Admin\ServiceController@json', 'as'=>'service.admin.json']);
            Route::post('/dashboard/admin/service/add',['uses'=>'Admin\ServiceController@create', 'as'=>'service.admin.add']);
            Route::post('/dashboard/admin/service/show',['uses'=>'Admin\ServiceController@show', 'as'=>'service.admin.show']);
            Route::get('/dashboard/admin/service/delete/{id}','Admin\ServiceController@delete');
            Route::post('/dashboard/admin/service/edit',['uses'=>'Admin\ServiceController@edit', 'as'=>'service.admin.edit']);
            
            //Operan
            Route::get('/dashboard/admin/operan', 'Admin\OperanController@index')->name('operan');
            Route::post('/dashboard/admin/operan', ['uses' => 'Admin\OperanController@create', 'as' => 'operan.admin.add']);
            Route::put('/dashboard/admin/operan/{id}/update',['uses' => 'Admin\OperanController@update', 'as' => 'operan.admin.edit']);
            Route::get('/dashboard/admin/operan/{id}/show', 'Admin\OperanController@show');
            Route::delete('/dashboard/admin/operan/{id}/delete',['uses' => 'Admin\OperanController@delete', 'as' => 'operan.admin.delete']);
            Route::get('/dashboard/admin/operan/json',['uses'=>'Admin\OperanController@json', 'as'=>'operan.admin.json']);
            //Ticket
            Route::get('/dashboard/admin/ticket',['uses'=>'Admin\TicketController@index', 'as'=>'ticket.admin.index']);
            Route::get('/dashboard/admin/ticket/json','Admin\TicketController@json');
            Route::get('/dashboard/admin/ticket/{id}','Admin\TicketController@show');
            Route::post('/dashboard/admin/ticket/{id}/edit',['uses'=>'Admin\TicketController@edit', 'as'=>'ticket.edit']);

            //Website
            Route::get('/dashboard/admin/website', 'Admin\SiteController@index');
            Route::post('/dashboard/admin/website/update', ['uses' => 'Admin\SiteController@update', 'as' => 'website.admin.update']);
            
            //Deposit
            Route::get('/dashboard/admin/deposit',['uses' => 'Admin\DepositController@index', 'as' => 'deposit.admin.index']);
            Route::post('/dashboard/admin/deposit/add', ['uses' => 'Admin\DepositController@add', 'as' => 'deposit.admin.add']);
            Route::get('/dashboard/admin/deposit/json', ['uses' => 'Admin\DepositController@json', 'as' => 'deposit.admin.json']);
            Route::post('/dashboard/admin/deposit/{id}/update', 'Admin\DepositController@update');
            Route::get('/dashboard/admin/deposit/{id}', 'Admin\DepositController@show');
            Route::get('/dashboard/admin/deposit/{id}/delete','Admin\DepositController@delete');
            Route::get('/dashboard/admin/history/deposit', 'Admin\DepositController@history');
            Route::get('/dashboard/admin/history/deposit/json','Admin\DepositController@history_json');
            Route::delete('/dashboard/admin/history/deposit/{id}/delete', ['uses' => 'Admin\DepositController@history_delete', 'as' => 'deposit.delete']);
            Route::get('dashboard/admin/history/deposit/{id}/show','Admin\DepositController@history_show');
            Route::put('dsahboard/admin/history/deposit/{id}/update',['uses'=> 'Admin\DepositController@history_update','as' => 'hisdepo.admin.edit']);
            //Order
            Route::get('/dashboard/admin/order/{slug}','Admin\HistoryController@index');
            Route::post('/dashboard/admin/order/{slug}/show/{id}', ['uses' => 'Admin\HistoryController@show', 'as'=> 'order.admin.show']);
            Route::get('/dashboard/admin/history/{slug}/json','Admin\HistoryController@json');
            Route::put('/dashboard/admin/order/{slug}/update/{id}', ['uses' => 'Admin\HistoryController@update', 'as'=> 'order.admin.edit']);
            Route::delete('/dashboard/admin/order/{slug}/delete/{id}', ['uses' => 'Admin\HistoryController@destroy', 'as'=> 'order.admin.destroy']);

            Route::get('/dashboard/admin/user','Admin\UserController@index');
            Route::get('/dashboard/admin/user/{id}/show','Admin\UserController@show')->name('user_show');
            Route::put('/dashboard/admin/user/{id}/update',['uses'=> 'Admin\UserController@update','as'=>'user.admin.update']);
            Route::delete('/dashboard/admin/user/{id}/delete',['uses' => 'Admin\UserController@delete', 'as' => 'user.admin.delete']);
            Route::get('/dashboard/admin/user/json',['uses'=>'Admin\UserController@json', 'as'=>'user.admin.json']);
        });
});
