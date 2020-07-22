<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = "categories";
    protected $fillable = [
        'name', 'icon','slug','template'
    ];

    protected $guard = [
        'status'
    ];

    public function provider()
    {
        return $this->hasMany('App\Provider');
    }
}
