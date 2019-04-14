<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agency extends Model
{	
	protected $table = "agencys";
    protected $guarded = [];

     public function getFrame(){

        return $this->hasMany('App\Agency_frame');
    }

    public function OrderAgency(){

        return $this->hasMany('App\Order_agency');
    }

}
