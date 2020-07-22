<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'api_key', 'balance', 'status'
    ];

    protected $guard = [
        'balance', 'status'
    ];
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
      'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    
    public function history()
    {
        return $this->hasMany('App\History');
    }
    public function history_deposit()
    {
        return $this->hasMany('App\History_deposit');
    }
    public function history_saldo()
    {
        return $this->hasMany('App\History_saldo');
    }
    public function subject()
    {
        return $this->hasMany('App\Comment', 'foreign_key', 'local_key');
    }
    public function ticket()
    {
        return $this->hasMany('App\Ticket');
    }
}
