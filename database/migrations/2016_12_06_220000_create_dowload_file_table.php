<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDowloadFileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dowloads', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('frame_id');
            $table->string('username');
            $table->string('job');
            $table->string('email');
            $table->integer('phone');
            $table->text('content');
            $table->text('add_1');
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
        Schema::drop('dowloads');
    }
}
