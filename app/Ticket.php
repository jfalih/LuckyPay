<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $table = 'tickets';
    protected $fillable = [
        'pesan'
    ];
    public function subject()
    {
        return $this->belongsTo('App\Subject');
    }
    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
