<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableConstruct extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contructs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->text('youtube_link');
            $table->string('address');
            $table->integer('phone');
            $table->string('customer');
            $table->integer('agency_id');
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
        Schema::drop('contructs');
    }
}
