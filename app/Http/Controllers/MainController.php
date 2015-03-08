<?php namespace App\Http\Controllers;

use App\Model\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;
class MainController extends Controller {
		// 前台页面展示控制器
		private $pageNum;
		private $post;
		function __construct()//初始化
		{
				$this->pageNum=5;
				if (Cache::has('post')) //如果有Cache则直接取出来并反序列化
				{
						$this->post=unserialize(Cache::get('post'));
				}else{ //读取post数据序列化存入缓存
						$post=Post::getPostDb();
						Cache::put('post', serialize($post), 24*60);
						$this->post=unserialize(Cache::get('post'));
				}
		}
		public function index(Request $request)
		{
				//首页文章列表
				$page=$request->input('page');
				$page=isset($page)?$page:1;
				$data=array();
				$data['post']=array_slice($this->post,$this->pageNum*($page-1),$this->pageNum);
				$postNum=count($this->post);
				$url='/tinblog/public/home';
				$data['pageNum']=$this->pageNum;
				$data['page']=$page;
				$data['postNum']=ceil($postNum/$this->pageNum);
				$data['url']=$url;
				return view('index',$data);
		}
		public function getPost($id)
		{
				//文章页
				//id为文章id
				$data=array();
				$data['id']=$id;
				foreach($this->post as $values) {
						if($values->id==$id){
								$data['post']=$values;
						}
				}
				return view('single',$data);
		}
		public function getCategory(Request $request,$category)
		{
				//分类页面
				//
				$page=$request->input('page');
				$page=isset($page)?$page:1;
				$data=array();
				$url='/tinblog/public/category/'.$category;
				$data['pageNum']=$this->pageNum;
				$data['page']=$page;
				$data['url']=$url;
				$data['category']=$category;
				$temp=array();
				foreach($this->post as $values) {
						if($values->name==$category) {
								$temp[]=$values;
						}
				}
				$postNum=count($temp);
				$data['post']=array_slice($temp,$this->pageNum*($page-1),$this->pageNum);
				$data['postNum']=ceil($postNum/$this->pageNum);
				return view('category',$data);
		}
		public function getTag(Request $request,$tag)
		{
				//标签页面
				$page=$request->input('page');
				$page=isset($page)?$page:1;
				$data=array();
				$url='/tinblog/public/tag/'.$tag;
				$data['pageNum']=$this->pageNum;
				$data['page']=$page;
				$data['url']=$url;
				$data['tag']=$tag;
				$temp=array();
				foreach($this->post as $values) {
						if(stripos($values->tag,$tag)) {
								$temp[]=$values;
						}
				}
				$postNum=count($temp);
				$data['post']=array_slice($temp,$this->pageNum*($page-1),$this->pageNum);
				$data['postNum']=ceil($postNum/$this->pageNum);
				return view('tag',$data);
		}
		public function getArchive()
		{
				//归档页面
				$month=array('12','11','10','09','08','07','06','05','04','03','02','01');
				$year=array('14','15','16');
				$archive=array();
				foreach($year as $years) {
						foreach($month as $months) {
								foreach($this->post as $values)
								{
										if($years==substr($values->createDate,2,2))
										{
												//判断年
												if($months==substr($values->createDate,5,2))
												{
														//判断月
														$time='20'.$years.'-'.$months;
														$archive[]=$time;
														$archive[]='<div class=\'archiveDate\'><span class=\'icon-paragraph-justify\'>&nbsp&nbsp'.$time.'</span></div>';
														$temp='<div class=\'archiveContent\'>';
														$temp.='<a class=\'archiveTitle\' href=\'/tinblog/public/single/'.$values->id.'\'>'.$values->title.'</a><br />'; 
														$temp.='<span>on <a class=\'archiveCate\' href=\'/tinblog/public/category/'.$values->name.'\'>'.$values->name.'</a>';
														$temp.=' in '.date('m-d',strtotime($values->createDate)).'<br /></span>';
														$temp.='</div>';
														$archive[]=$temp;
												}
										}
								}
						}
				}
				return view('archive')->with('archive',$archive);

		}
		public function getaaaArchive()
		{
				//未使用
				$month=array('12','11','10','09','08','07','06','05','04','03','02','01');
				$year=array('14','15','16');
				$archive=array();
				echo '<div class=\'article\'>';
				foreach($year as $years) {
						foreach($month as $months) {
								$temp=self::archive($years,$months);
								if(!empty($temp)) {
										$time='20'.$years.'-'.$months;
										echo '<div class=\'archiveDate\'><span class=\'icon-paragraph-justify\'>&nbsp&nbsp'.$time.'</span></div>';
										echo '<div class=\'archiveContent\'>';
										foreach($temp as $values)
										{
												echo $values;
										}
										echo '</div>';
								}
						}
				}
		}
		public function archive($year,$month)
		{
				//未使用
				$temp=array();
				foreach($this->post as $values)
				{
						if($year==substr($values->createDate,2,2))
						{
								if($month==substr($values->createDate,5,2))
								{
										$temp[]='<a class=\'archiveTitle\' href=\'/tinblog/public/single/'.$values->id.'\'>'.$values->title.'</a><br />'; 
										$temp[].='<span>on <a class=\'archiveCate\' href=\'/tinblog/public/category/'.$values->name.'\'>'.$values->name.'</a>';
										$temp[].=' in '.date('m-d',strtotime($values->createDate)).'<br /></span>';
								}
								else
								{
								}

						}
						else
						{
						}
				}
				return $temp;
		}
		public function updateView($id)
		{
				//更新浏览数
				//前天页面展示需要更新缓存
				$post=Post::find($id);
				$view=$post->view;
				$view=$view+1;
				$post->view=$view;
				$post->save();

		}


		public function test ()
		{
				$redis=Redis::connection();
				$page=1;
				$post=Post::getPostDb();
				foreach ($post as $values) {
						$redis->lPush('a',serialize($values));
				}
		}
		public function getTest()
		{
				$redis=Redis::connection();
				return $redis->lRange('a',0,4);
		}

}
