<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    protected $fillable = [
        'service_id', 
        'target',
        'user_id',
        'refund',
        'quantity', 
        'price', 
        'target', 
        'trx_id', 
        'sn', 
        'status',
        'date'
    ];
    
    public function service()
    {
        return $this->belongsTo('App\Service');
    }
    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
