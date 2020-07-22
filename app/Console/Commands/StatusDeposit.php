<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\History_deposit;
class StatusDeposit extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'deposit:status';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Cek Status Deposit';

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
        $history = History_deposit::where('status','pending')->get();
        foreach($history as $deposit){
            
        }
    }
}
