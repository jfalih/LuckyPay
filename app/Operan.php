<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Operan extends Model
{
    protected $table = "operans";
    protected $fillable = [
        'name','link','api_key','api_id','code','status'
        ];
    public function service()
    {
        return $this->hasMany('App\Service');
    }
}
