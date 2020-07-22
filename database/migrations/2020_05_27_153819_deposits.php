<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Deposits extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('deposits', function (Blueprint $table) {
            $table->id();
            $table->double('rate',1,1);
            $table->string('image');
            $table->string('rekening');
            $table->string('code',6);
            $table->integer('min');
            $table->string('name');
            $table->enum('status',['active', 'not_active']);
            $table->enum('jenis',['otomatis', 'manual']);
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
        //
    }
}
