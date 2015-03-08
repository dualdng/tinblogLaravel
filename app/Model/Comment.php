<?php namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model {

	//
	protected $table='b_comment';
	protected $fillable=['postId','parentId','userId','name','url','email','text','time'];
	public  $timestamps=false;
	public function hasOneUser()
	{
			$this->hasOne('app\Model\User','id','userId');
	}
}
