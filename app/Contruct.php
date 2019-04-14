<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contruct extends Model
{
    //
    protected $table ="contructs";

    public function imageContruct(){
    	return $this->hasMany('App\Image_contruct');
    }
}
