<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Services extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->integer('min');
            $table->integer('max');
            $table->integer('price');
            $table->integer('price_reseller');
            $table->integer('price_operan');
            $table->string('code', 6);
            $table->string('code_operan', 6);
            $table->enum('status',['active','not_active']);
            $table->foreignId('provider_id')->references('id')->on('providers')->onDelete('cascade');
            $table->foreignId('operan_id')->references('id')->on('operans')->onDelete('cascade');
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
        Schema::dropIfExists('services');
    }
}
