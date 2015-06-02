<?php namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Post extends Model {

	//
	public  $timestamps=false;
	protected $table = 'b_article';
	protected $fillable = ['title','content','excerpt','userId','categoryId','tag','type','createDate','status'];
	public function hasOneUser()
	{
			$this->hasOne('app\Model\User','id','userId');
	}
	public static function getPostDb() //使用db方式获得文章返回给控制器
	{
			$post=DB::table('b_article')
					->leftJoin('b_user','b_article.userId','=','b_user.id')
					->leftJoin('b_category','b_article.categoryId','=','b_category.id')
					->select('b_article.id','b_article.title','b_article.content','b_article.excerpt','b_user.name as userName','b_category.name','b_article.tag','b_article.type','b_article.createDate','b_article.view','b_article.userId')
					->orderBy('id','desc')
					->get();
			return $post;

	}
	public static function getView($id) //获取文章的浏览量 用于浏览量实时更新
	{
			$view=DB::table('b_article')
					->select('view')
					->where('id',$id)
					->get();
			$view=$view[0]->view;
			return $view;
	}
	public static function getSinglePost($id) //使用db方式获得文章返回给控制器
	{
			$post=DB::table('b_article')
					->leftJoin('b_user','b_article.userId','=','b_user.id')
					->leftJoin('b_category','b_article.categoryId','=','b_category.id')
					->select('b_article.id','b_article.title','b_article.content','b_article.excerpt','b_user.name','b_category.name','b_article.tag','b_article.type','b_article.createDate','b_article.userId')
					->where('b_article.id',$id)
					->get();

			return $post;
	}
	public static function getPopPost()
	{
			$post=DB::table('b_article')
					->select('b_article.id','b_article.title')
					->orderBy('view','desc')
					->limit(5)
					->get();
			return $post;

	}


}
