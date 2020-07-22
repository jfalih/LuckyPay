<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deposit extends Model
{
    protected $fillable = [
        'name','min','rekening','status', 'jenis', 'code', 'rate'
    ];

    public function history()
    {
        return $this->hasMany('App\History_deposit');
    }
}
