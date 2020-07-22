<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\{History, Service, Provider, Category, Operan, User};

use GuzzleHttp\Client;
class StatusPulsa extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'pulsa:status';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Cek Status Pulsa';

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
        $history = History::where('status','pending')->get();
        $now = date('Y-m-d');
        if($history->count() > 0){
        foreach ($history as $his) {    
        $service = Service::where('id', $his->service_id)->get();
        if($service->count() > 0){
        foreach($service as $layanan){
            $provider = Provider::where('id', $layanan->provider_id)->get();
            if($provider->count() > 0){
            foreach($provider as $prov){
                $category = Category::where('id', $prov->category_id)->get();  
                if($category->count() > 0){
                foreach($category as $cat){
                    if($cat->template === 'pulsa' || $cat->template === 'pln'){
                        $last_history = History::where([
                            ['date', '=', $now],
                            ['target','=', $his->target]
                        ])->get();
                        if($last_history->count() !== 0){
                            $count = $last_history->count() + 1;
                            $target = $count.$his->target;
                        } else {
                            $target = $his->target;
                        }
                            $digiflazz = Operan::where('code','DIGIFLAZZ')->first();
                            $api = [
                            'username' => $digiflazz->api_id,
                            'api' => $digiflazz->api_key,
                            'ref_id' => $his->trx_id
                            ];
                             $body = [
                                'username' => $api['username'], 
                                'buyer_sku_code' => $layanan->code_operan,
                                'customer_no' => $his->target,
                                'ref_id' => $api['ref_id'],
                                'sign' => md5($api['username'].$api['api'].$api['ref_id']),
                            ];
                            $client = new Client(['headers' => ['Content-Type' => 'application/json']]);
                            $r = $client->request('POST', 'https://api.digiflazz.com/v1/transaction', [
                                'json' => $body
                            ]);
                            $stream = $r->getBody();
                            $contents = json_decode($stream->getContents());
                            $history = History::where([
                                ['trx_id', '=', $his->trx_id],
                                ['status','=','pending']
                            ])->first();
                        if($contents->data->status == 'Sukses') {
                            $status = 'success';
                            $sn = $contents->data->sn;
                        } else if($contents->data->status == 'Gagal') {
                            $status = 'canceled';
                            $sn = $contents->data->message;
                        } else if($contents->data->status == 'Pending'){
                            $status = 'pending';
                            $sn = $contents->data->message;
                        } else {
                            $status = 'error';
                            $sn = $contents->data->message;
                        }
                        $update_his = $history->update([
                            'status' => $status,
                            'sn' => $sn
                        ]);
                            if($update_his){
                                $user = User::where('id', $history->user_id);
                                if($status === 'success'){
                                    $update_user = $user->update([
                                        'total_pulsa' => $user->first()->total_pulsa + $history->price,
                                        'point' => $user->first()->point + $history->service->point
                                    ]);
                                }
                            }
                        }
                }
                } else {
                    print_r("Tidak Ada Category");
                }
            }
            } else {
                print_r("Tidak Ada Category");
            }
        }
        } else {
            print_r("Tidak Ada Category");
        }
        }
        } else {
            print_r("Tidak Ada History");
        }
    }
}
