<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class History_saldo extends Model
{
    protected $table = 'history_saldos';

    protected $fillable = [
        'user_id', 'jumlah', 'keterangan', 'status'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
