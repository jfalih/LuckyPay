<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class History_deposit extends Model
{
    protected $table = 'history_deposits';

    protected $fillable = [
        'jumlah','status','user_id','deposit_id','trx_id','kode_unik'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function deposit()
    {
        return $this->belongsTo('App\Deposit');
    }
}
