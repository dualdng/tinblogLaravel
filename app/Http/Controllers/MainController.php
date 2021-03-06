<?php namespace App\Http\Controllers;

use App\Model\Post;
use App\Model\Link;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;
class MainController extends Controller {
		// 前台页面展示控制器
		private $pageNum;
		private $post;
		private $link;
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
				if (Cache::has('link')) //如果有Cache则直接取出来并反序列化
				{
						$this->link=unserialize(Cache::get('link'));
				}else{ //读取post数据序列化存入缓存
						$link=Link::all();
						Cache::put('link', serialize($link), 24*60);
						$this->link=unserialize(Cache::get('link'));
				}

		}
		public function getIndex()
		{
				//首页文章列表
				$line=MyBaseController::getLine();
				$music=1;
				$page=1;
				$data=array();
				$data['post']=array_slice($this->post,$this->pageNum*($page-1),$this->pageNum);
				foreach($data['post'] as $values) {//替换文章浏览量为实时数据
						$values->view=Post::getView($values->id); 
				}
				$postNum=count($this->post);
				$data['pageNum']=$this->pageNum;
				$data['link']=$this->link;
				$data['line']=$line;
				$data['music']=$music;
				$data['page']=$page;
				$data['postNum']=ceil($postNum/$this->pageNum);
				return view('index',$data);
		}

		public function index(Request $request,$page)
		{
				//首页文章列表
				$line=MyBaseController::getLine();
				$music=$request->input('music');
				$music=isset($music)?$music:1;
				$page=isset($page)?$page:1;
				$data=array();
				$data['post']=array_slice($this->post,$this->pageNum*($page-1),$this->pageNum);
				foreach($data['post'] as $values) {//替换文章浏览量为实时数据
						$values->view=Post::getView($values->id);
				}
				$postNum=count($this->post);
				$data['pageNum']=$this->pageNum;
				$data['link']=$this->link;
				$data['line']=$line;
				$data['music']=$music;
				$data['page']=$page;
				$data['postNum']=ceil($postNum/$this->pageNum);
				return view('index',$data);
		}
		public function getPost(Request $request,$id)
		{
				//文章页
				//id为文章id
				$data=array();
				$data['id']=$id;
				$data['link']=$this->link;
				$music=$request->input('music');
				$music=isset($music)?$music:1;
				$data['music']=$music;
				foreach($this->post as $values) {
						if($values->id==$id){
								$values->view=Post::getView($id);//替换文章浏览量为实时数据
								$data['post']=$values;
						}
				}
				return view('single',$data);
		}
		public function getCategory(Request $request,$category,$page)
		{
				//分类页面
				//
				$music=$request->input('music');
				$music=isset($music)?$music:1;
				$page=isset($page)?$page:1;
				$data=array();
				$url='/category/'.$category;
				$data['pageNum']=$this->pageNum;
				$data['link']=$this->link;
				$data['page']=$page;
				$data['url']=$url;
				$data['category']=$category;
				$data['music']=$music;
				$temp=array();
				foreach($this->post as $values) {
						if($values->name==$category) {
								$temp[]=$values;
						}
				}
				$postNum=count($temp);
				$data['post']=array_slice($temp,$this->pageNum*($page-1),$this->pageNum);
				foreach($data['post'] as $values) {//替换文章浏览量为实时数据
						$values->view=Post::getView($values->id);
				}
				$data['postNum']=ceil($postNum/$this->pageNum);
				return view('category',$data);
		}

		public function getTag(Request $request,$tag,$page)
		{
				//标签页面
				$music=$request->input('music');
				$music=isset($music)?$music:1;
				$page=isset($page)?$page:1;
				$data=array();
				$url='/tag/'.$tag;
				$data['pageNum']=$this->pageNum;
				$data['link']=$this->link;
				$data['page']=$page;
				$data['url']=$url;
				$data['tag']=$tag;
				$data['music']=$music;
				$temp=array();
				foreach($this->post as $values) {
						if(stripos($values->tag,$tag)) {
								$temp[]=$values;
						}
				}
				$postNum=count($temp);
				$data['post']=array_slice($temp,$this->pageNum*($page-1),$this->pageNum);
				foreach($data['post'] as $values) {//替换文章浏览量为实时数据
						$values->view=Post::getView($values->id);
				}
				$data['postNum']=ceil($postNum/$this->pageNum);
				return view('tag',$data);
		}
		public function getArchive()
		{
				//归档页面
				$data=array();
				$data['music']=0;
				$data['link']=$this->link;
				$month=array('12','11','10','09','08','07','06','05','04','03','02','01');
				$year=array('16','15','14');
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
														$temp.='<a id=\'title\' class=\'archiveTitle\' href=\'/single/'.$values->id.'\'>'.$values->title.'</a><br />'; 
														$temp.='<span>on <a class=\'archiveCate\' href=\'/category/'.$values->name.'/page/1\'>'.$values->name.'</a>';
														$temp.=' in '.date('m-d',strtotime($values->createDate)).'<br /></span>';
														$temp.='</div>';
														$archive[]=$temp;
												}
										}
								}
						}
				}
				$data['archive']=$archive;
				return view('archive',$data);

		}
		public function getSide()
		{
				$post=Post::getPopPost();
				$content='';
				$content.='<div class=\'pop list-group\'>';
				$content.='<a class=\'list-group-item disabled\'>随机文章</a>';
				foreach($post as $value){
						$content.='<a id=\'title\'class=\'list-group-item\'  href=\'/single/'.$value->id.'\'>'.$value->title.'</a>';
				}
				$content.='</div>';
				$content.='<div class=\'list-group\'>';
				$content.='<a href=\'#\' class=\'list-group-item disabled\'>背景音乐</a>';
				$content.='<a id=\'music\' href=\'javascript:void(0)\' value=\'0\' class=\'list-group-item\' >bgm_colhen_inn_serehua</a>';
				$content.='<a id=\'music\' href=\'javascript:void(0)\' value=\'1\' class=\'list-group-item\' >Scabs</a>';
				$content.='</div>';

				return $content;
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
										$temp[]='<a class=\'archiveTitle\' href=\'/single/'.$values->id.'\'>'.$values->title.'</a><br />'; 
										$temp[].='<span>on <a class=\'archiveCate\' href=\'/category/'.$values->name.'\'>'.$values->name.'</a>';
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
