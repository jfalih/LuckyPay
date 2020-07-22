<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    protected $fillable = [
        'name', 'code','slug'
    ];

    protected $guard = [
        'status'
    ];
    public function category()
    {
            return $this->belongsTo('App\Category');
    }

    public function service()
    {
        return $this->hasMany('App\Service');
    }
}
