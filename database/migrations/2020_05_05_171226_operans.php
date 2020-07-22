<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Operans extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('operans', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('link');
            $table->string('api_key');
            $table->string('api_id');
            $table->double('saldo');
            $table->string('code', 6);
            $table->enum('status',['active','not_active']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('operans');
    }
}
