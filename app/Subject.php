<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    protected $fillable = [
        'title','status','user_id'
    ];
    
    
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    public function ticket()
    {
        return $this->hasMany('App\Ticket');
    }
}
