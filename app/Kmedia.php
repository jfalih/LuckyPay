<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kmedia extends Model
{
    protected $table = 'kmedia';
    protected $fillable = [
        'api_key','link','status'
    ];
    
    public function service()
    {
        return $this->hasMany('App\Service');
    }
}
