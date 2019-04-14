<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_sale', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('share');
            $table->string('type');
            $table->string('percent');
            $table->string('money_sale');
            $table->string('money_min');
            $table->string('start_day');
            $table->string('end_day');
            $table->integer('status')->default(0);
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
        Schema::drop('event_sale');
    }
}
