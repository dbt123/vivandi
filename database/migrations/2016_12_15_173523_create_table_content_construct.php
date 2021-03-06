<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableContentConstruct extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('content_constructs', function (Blueprint $table) {
            //
            $table->increments('id');
            $table->integer('contruct_id');
            $table->text('description');
            $table->text('content');
            $table->text('name');
            $table->integer('rank');
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
       Schema::drop('content_contructs');
    }
}
