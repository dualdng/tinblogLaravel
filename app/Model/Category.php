<?php namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model {

	//
	protected $table='b_category';
	protected $fillable=['name'];
	public  $timestamps=false;

}
