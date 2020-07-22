<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\{History, Service, Provider, Category, User};

use GuzzleHttp\Client;
class StatusSosmed extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sosmed:status';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Cek Status Sosmed';

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
       $history = History::where('status','pending')->orWhere('status','processing')->get();
       $now = date('Y-m-d');
       if($history->count() > 0){
        foreach ($history as $his) {    
        $service = Service::where('id', $his->service_id)->get();
        if($service->count() > 0) {
            foreach($service as $layanan){
                $provider = Provider::where('id', $layanan->provider_id)->get();
                if($provider->count() > 0){
                    foreach($provider as $prov){
                    $category = Category::where('id', $prov->category_id)->get();  
                    foreach($category as $cat){
                        if($cat->template === 'sosmed'){
                            if($his->service->operan->code !== 'KMEDIA'){
                                $body = [
                                    'api_id' => $his->service->operan->api_id, 
                                    'api_key' => $his->service->operan->api_key,
                                    'id' => $his->trx_id
                                            ];
                                $client = new Client();
                                $r = $client->request('POST', $his->service->operan->link.'status', ['form_params' => $body]);
                                $stream = $r->getBody();
                                $contents = json_decode($stream->getContents()); // returns all the contents
                                if($contents->status === true || $contents->status === "true"){
                                    if($contents->data->status === "Success" || $contents->data->status === "success"){
                                        $status = "success";
                                       
                                    } else if($contents->data->status === "Processing"){
                                        $status = "processing";
                                    } else if($contents->data->status === "Partial"){
                                        $status = "partial";
                                    } else if($contents->data->status === "Error"){
                                        $status = "error";
                                    } else {
                                        $status = "pending";
                                    }
                                    $baru_his = History::where('trx_id', $his->trx_id);
                                    $update = $baru_his->update([
                                        'status' => $status,
                                        'start_count' => $contents->data->start_count,
                                        'remains' => $contents->data->remains
                                        ]);
                                    if($update) {
                                        if($baru_his->first()->status === 'success'){
                                        $user = User::where('id', $baru_his->first()->user_id);
                                        $update_user = $user->update([
                                            'point' => $user->first()->point + $baru_his->first()->service->point,
                                            'total_sosmed' => $user->first()->total_sosmed + $baru_his->first()->price
                                            ]);    
                                        print_r('IRVAN BISA BOS');
                                      \Log::info("IRVAN SUCCESS Update Service!");
                                        }
                                    }
                                } else {
                                  \Log::info("Error service!");
                                }
                            } else {
                                $body = [
                                    'key' => $his->service->operan->api_key, 
                                    'method' => "view",
                                    'order_id' => $his->trx_id
                                ];
                                $client = new Client();
                                $r = $client->request('POST', $his->service->operan->link.'?type=sosmed', ['form_params' => $body]);
                                $stream = $r->getBody();
                                $contents = json_decode($stream->getContents()); // returns all the contents
                                if($contents->success === "true"){
                                  if($contents->status === "Completed"){
                                        $status = "success";
                                    } else if($contents->status === "Processing"){
                                        $status = "processing";
                                    } else if($contents->status === "Partial"){
                                        $status = "partial";
                                    } else if($contents->status === "Error"){
                                        $status = "error";
                                    } else {
                                        $status = "pending";
                                    }
                                  $baru_his = History::where('trx_id', $his->trx_id);
                                  $update = $baru_his->update([
                                      'status' => $status,
                                      'remains' => $contents->remains
                                  ]);
                                  if($update){
                                     if($baru_his->first()->status === 'success'){
                                          $user = User::where('id', $baru_his->first()->user_id);
                                          $update_user = $user->update([
                                                'point' => $user->first()->point + $baru_his->first()->service->point,
                                                'total_sosmed' => $user->first()->total_sosmed + $baru_his->first()->price
                                            ]);
                                     }
                                    print_r('KMEDIA BISA BOS '.$his->trx_id.$contents->status);
                                    \Log::info("KMEDIA SUCCESS Update Service!");
                                  } else {
                                    print_r('KMEDIA Error BOS');
                                    \Log::info("Error Update Bos!");
                                    \Log::info(print_r($contents));
                                  }
                                } else {
                                  \Log::info("Error service!");                             
                                }
                            }
                        } else {
                            \Log::info("Error Bukan Sosmed!");     
                        }
                    }
                }
                } else {
                    print_r("Provider Tidak Ada");
                }
            }
        } else {
            print_r("Provider Tidak Ada");
        }
       }
       } else {
           print_r("Tidak Ada History Pending");
       }
    }
}
