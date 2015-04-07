<?php namespace App\Http\Controllers\Dashboard;

use App\Model\Category;
use App\Model\Post;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MyBaseController;
use Auth;//用户认证模块用
use Illuminate\Http\Request;
use Illuminate\Hashing\BcryptHasher; //调用hash加密类
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Cache; //调用laravel缓存
class MainController extends Controller {
		private $pageNum;
		private $post;
		function __construct()
		{
				$this->pageNum=20;
						$this->post=Post::getPostDb();
		}
		public function getIndex(Request $request)
		{
				//后台首页
				$user=Auth::user();
				$page=$request->input('page');
				$page=isset($page)?$page:1;
				$data=array();
				$data['post']=array_slice($this->post,$this->pageNum*($page-1),$this->pageNum);
				$postNum=count($this->post);
				$url='/dashboard';
				$data['pageNum']=$this->pageNum;
				$data['page']=$page;
				$data['postNum']=ceil($postNum/$this->pageNum);
				$data['url']=$url;
				$data['user']=$user;
				return view('dashboard.index',$data);
		}
		public function getLogin()
		{
				//登录页面
				return view('dashboard.login');
		}
		public function auth(Request $request)
		{
				//登录认证
				$email=$request->input('email');
				$password=$request->input('password');
				$result=MyBaseController::auth($email,$password);
				if ($result) {
						return redirect('dashboard');
				}else{
						return redirect('login');
				}
		}
		public function getRegister() //
		{
				//注册页面
			//	return view('dashboard.register');
				return view('dashboard.login');
		}
		public function register(MyRegister $request) //
		{
				//用户注册
				$name=$request->input('name');
				$email=$request->input('email');
				$password=$request->input('password');
				$hash=new BcryptHasher;
				$password=$hash->make($password);
				$result=User::create(array('name'=>$name,'email'=>$email,'password'=>$password));
				return 'seccess';
		}
		public function logout()
		{
				//注销
				Auth::logout();
				return redirect('login');
		}
		public function getPostArea($id)
		{
				//文章发布页面
				//id为用户id
				$category=Category::all();
				$data=array();
				$data['category']=$category;
				$data['userId']=$id;
				return view('dashboard.post',$data);

		}
		public function postPost(Request $request)
		{
				//文章发布
				$title=$request->input('title');
				$content=$request->input('content');
				if (get_magic_quotes_gpc()) {
						$content = $content;
				} else {
						$content = addslashes($content);
				}
				$excerpt=$request->input('excerpt');
				$categoryId=$request->input('categoryId');
				$tag=$request->input('tag');
				$type=$request->input('type');
				$userId=$request->input('userId');
				$state=$request->input('state');
				date_default_timezone_set('Asia/Shanghai');    //把时区设置为中国的上海，避免时间误差，)
				$time=date('Y-m-d H:i:s');

				$result=Post::create(array('title'=>$title,'content'=>$content,'excerpt'=>$excerpt,'categoryId'=>$categoryId,'tag'=>$tag,'type'=>$type,'userId'=>$userId,'status'=>$state,'createDate'=>$time));
				if($result){
						return '<p>发布成功</p>';
				}
		}
		public function editPost($id)
		{
				//文章编辑页面
				//id为文章id
				$data=array();
				$category=Category::all();
				$data['category']=$category;
				$data['id']=$id;
				foreach($this->post as $values) {
						if($values->id==$id){
								$data['post']=$values;
						}
				}
				return view('dashboard.editPost',$data);
		}
		public function updatePost(Request $request,$id)
		{
				//文章编辑更新
				//id为文章id
				$title=$request->input('title');
				$content=$request->input('content');
				if (get_magic_quotes_gpc()) {
						$content = $content;
				} else {
						$content = addslashes($content);
				}
				$excerpt=$request->input('excerpt');
				$categoryId=$request->input('categoryId');
				$tag=$request->input('tag');
				$type=$request->input('type');
				$userId=$request->input('userId');
				$state=$request->input('state');
				date_default_timezone_set('Asia/Shanghai');    //把时区设置为中国的上海，避免时间误差，)
				$time=date('Y-m-d H:i:s');

				$result=Post::where('id','=',$id)->update(array('title'=>$title,'content'=>$content,'excerpt'=>$excerpt,'categoryId'=>$categoryId,'tag'=>$tag,'type'=>$type,'userId'=>$userId,'status'=>$state,'createDate'=>$time));
				if($result){
						return '<p>更新成功</p>';
				}
		}
		public function clearCache()
		{
			//	清除缓存
				Cache::forget('post');
				return redirect('dashboard');
		}



}
