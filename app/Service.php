<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $table = "services";

    protected $fillable = [
        'name', 'code', 'code_operan',
        'price', 'price_operan', 'price_reseller','point','note'
    ];

    protected $guard = [
        'status'
    ];
    
    public function provider()
    {
        return $this->belongsTo('App\Provider');   
    }
    public function operan()
    {
        return $this->belongsTo('App\Operan');
    }
    public function history()
    {
        return $this->hasMany('App\History');
    }
}
