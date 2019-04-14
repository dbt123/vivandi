<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFeedbackImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('feedback_images', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('feedback_id')->unsigned();
            $table->foreign('feedback_id')->references('id')->on('feedbacks')->onDelete('cascade');
            $table->string('img');
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
        Schema::drop('feedback_images');
    }
}
