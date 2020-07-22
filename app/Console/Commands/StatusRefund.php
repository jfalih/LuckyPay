<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\{History, Provider, User};
class StatusRefund extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'history:refund';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Refund';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
       $history = History::where('refund','NO')->get();
       if($history->count() > 0) {
       foreach ($history as $his) {
        $provider = Provider::where('id', $his->service->provider_id)->first();
        $cek_hist = History::where([['id','=', $his->id],['refund','=','NO']]);
        $user = User::where('id', $cek_hist->first()->user_id);
                if($provider->category->template === "sosmed"){
                    if($cek_hist->first()->status === 'partial'){
                        $rumus = $cek_hist->first()->price / $cek_hist->first()->quantity * (int)$cek_hist->first()->remains;
                        $update_status = $cek_hist->update([
                           'refund' => 'YES',
                        ]);
                       if($update_status) {
                            $update_user = $user->update([
                                'balance' => $user->first()->balance + $rumus
                            ]);      
                            if($update_user) {
                                 $saldo = History_saldo::create([
                                            'user_id' => $user->first()->id,
                                            'jumlah' => $cek_hist->first()->price,
                                            'keterangan' => 'Pengembalian '.$cek_hist->first()->service->name.' Dengan Jumlah '.$rumus,
                                            'status' => 'plus'
                                ]);
                                print_r('Partial Sosmed Bisa Bos');
                            } else {
                                print_r('Gagal Bos');
                            }
                        }
                    } else if($cek_hist->first()->status === 'error' || $cek_hist->first()->status === 'canceled'){
                        $rumus = $cek_hist->first()->price;
                        $update_status = $cek_hist->update([
                           'refund' => 'YES',
                        ]);
                       if($update_status) {
                            $update_user = $user->update([
                                'balance' => $user->first()->balance + $cek_hist->first()->price
                            ]);      
                            if($update_user) {
                                         $saldo = History_saldo::create([
                                            'user_id' => $user->first()->id,
                                            'jumlah' => $cek_hist->first()->price,
                                            'keterangan' => 'Pengembalian '.$cek_hist->first()->service->name.' Dengan Jumlah '.$rumus,
                                            'status' => 'plus'
                                        ]);
                                print_r('Canceled Sosmed Bisa Bos');
                            } else {
                                print_r('Gagal Bos');
                            }
                        }
                    } else {
                        print_r('Sukses / Pending Status Nya Bos');
                    }
                } else if($provider->category->template === "pulsa" || $provider->category->template === "pln"){
                    if($cek_hist->first()->status === 'canceled' || $cek_hist->first()->status === 'error'){
                       $update_status = $cek_hist->update([
                           'refund' => 'YES',
                        ]);
                           if($update_status) {
                                $update_user = $user->update([
                                   'balance' => $user->first()->balance + $cek_hist->first()->price
                                   ]);      
                                   if($update_user) {
                                         $saldo = History_saldo::create([
                                            'user_id' => $user->first()->id,
                                            'jumlah' => $cek_hist->first()->price,
                                            'keterangan' => 'Pengembalian '.$cek_hist->first()->service->name.' Dengan Jumlah '.$cek_hist->first()->price,
                                            'status' => 'plus'
                                        ]);
                                       print_r('Pulsa Bisa Bos');
                                   } else {
                                       print_r('Gagal Bos');
                                   }
                           }
                    } else {
                        print_r('Sukses / Pending Status Nya Bos');
                    }
                } else {
                    print_r("belom bisa bos ");
                }
        }
       } else {
        print_r("Tidak Ada History Refund");   
       }
    }
}
