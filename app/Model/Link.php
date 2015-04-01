<?php namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Link extends Model {

	//
	protected $table='b_links';
	protected $fillable=['title','link','name'];
	public $timestamps=false;

}
