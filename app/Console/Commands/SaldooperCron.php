<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use GuzzleHttp\Client;
use App\Operan;
class SaldooperCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'oper:saldo';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
        $operan = Operan::where('status','active')->get();
        $arr = [];
        foreach($operan as $value){
        $body = [
            'api_id' => $value->api_id, 
            'api_key' => $value->api_key
        ];
        $client = new Client();
        $r = $client->request('POST', $value->link.'profile', [
            'form_params' => $body
        ]);
        $stream = $r->getBody();
        $contents = json_decode($stream->getContents()); // returns all the contents
        $update = Operan::where('api_id', $value->api_id)->update([
            'saldo' => $contents->data->balance
        ]);   
            if($update ){
                $this->info('Update Saldo Sukses!');
            }
        }

    }
}
