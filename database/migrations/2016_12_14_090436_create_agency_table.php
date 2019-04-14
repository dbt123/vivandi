<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAgencyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agencys', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name_agency');
            $table->string('representative');
            $table->string('subdomain');
            $table->string('phone');
            $table->string('email');
            $table->string('address_agency');
            $table->string('location');
            $table->string('username');
            $table->string('password');
            $table->integer('status');
            $table->integer('level');
            $table->string('add_1');
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
        Schema::drop('agencys');
    }
}
