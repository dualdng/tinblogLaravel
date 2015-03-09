<?php namespace App\Http\Controllers;

use App\Model\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller {
		public function getComment($id)
		{
				//获取文章评论
				//id为文章id
				$pageNum=5;
				$page=1;
				$comment=Comment::where('postId',$id)->where('parentId',0)->get()->sortByDesc('id')->slice($pageNum*($page-1),$pageNum);
				if (empty($comment)) {
						echo '<div class=\'nocomment\'>';
						echo 'No comment!';
						echo '</div>';
				}
				foreach($comment as $values)
				{
						$avatar=MyBaseController::cacheAvatar($values->email);
						echo '<div class=\'comment\'>';
	/** 关于第三方认证的头像显示							if(strpos($values->userId,'qq')!==false)
								{
										$query='select avatar from b_third where userId=\''.$values->userId.'\'';
										$res=$db->fetch_assoc($query);
										echo '<div class=\'author_avatar\'><img src=\''.$res['avatar'].'\'/></div>';
								}
								else
								{
	**/
						echo '<div class=\'authorAvatar\'><img src=\''.$avatar.'\'/></div>';
						//							}
						echo '<div class=\'commentContents\'>';
						echo '<div class=\'commentPak\'>';
						echo '<div class=\'commentAuthor\'><a href=\''.$values->url.'\'>'.$values->name.'</a></div>';
						echo '<div class=\'commentDate\'>'.date('d M,y',strtotime($values->time)).'</div>';
						echo '</div>';
						echo '<div class=\'commentText\'>'.$values->text.'</div>';
						echo '<div class=\'commentReply\'><a class=\'reply-'.$values->id.' reply\' href=\'javascript:void(0);\'onclick=\'getCommentArea('.$id.','.$values->id.')\'>reply</a><a href=\'javascript:void(0)\' class=\'cancelReply-'.$values->id.' cancelReply\' onclick=\'cancelReply('.$id.','.$values->id.')\'>cancel</a></div>';
						echo '<div class=\'commentArea-'.$values->id.' commentArea\'></div>';
						echo '</div>';
						self::getCommentChild($values->id);
						echo '</div>';
				}
		}
		public function getCommentChild($postId)
		{
				$comment=Comment::where('parentId',$postId)->get()->sortByDesc('id');
				if(!empty($comment))
				{
						foreach ($comment as $values)
						{
								$avatar=MyBaseController::cacheAvatar($values->email);
								echo '<div class=\'commentChildren\'>';
/** 第三方头像 								if(strpos($result[$i][3],'qq')!==false)
								{
										$query='select avatar from b_third where user_id=\''.$result[$i][3].'\'';
										$res=$db->fetch_assoc($query);
										echo '<div class=\'author_avatar\'><img src=\''.$res['avatar'].'\'/></div>';
								}
								else
								{
**/
								echo '<div class=\'authorAvatar\'><img src=\''.$avatar.'\'/></div>';
								//	}

								echo '<div class=\'commentContents\'>';
								echo '<div class=\'commentPak\'>';
								echo '<div class=\'commentAuthor\'><a href=\''.$values->url.'\'>'.$values->name.'</a></div>';
								echo '<div class=\'commentDate\'>'.date('d M,y',strtotime($values->time)).'</div>';
								echo '</div>';
								echo '<div class=\'commentText\'>'.$values->text.'</div>';
								echo '<div class=\'commentReply\'><a class=\'reply-'.$values->id.' reply\' href=\'javascript:void(0);\'onclick=\'getCommentArea('.$values->postId.','.$values->id.')\'>reply</a><a href=\'javascript:void(0)\' class=\'cancelReply-'.$values->id.' cancelReply\' onclick=\'cancelReply('.$values->postId.','.$values->id.')\'>cancel</a></div>';
								echo '<div class=\'commentArea-'.$values->id.'\'></div>';
								echo '</div>';
								self::getCommentChild($values->id);
								echo '</div>';
						}
				}
		}
		function getCommentArea(Request $request,$id)
		{
				//获取评论表单
				//id为文章id
				$parentId=$request->input('parentId');
				echo '<form class=\'commentField\' method=\'post\'onSubmit=\'return postComment()\'>';
				echo '<input type=\'hidden\' name=\'postId\' class=\'name\' value=\''.$id.'\'></input>';
				echo '<input type=\'hidden\' name=\'parentId\' class=\'name\' value=\''.$parentId.'\'></input>';
				echo '<input type=\'hidden\' name=\'userIp\' class=\'name\' value=\''.$_SERVER['REMOTE_ADDR'].'\'></input>';
				echo '<input type=\'hidden\' name=\'useragent\' class=\'name\' value=\''.$_SERVER['HTTP_USER_AGENT'].'\'></input>';

				if(isset($_COOKIE['name']))
				{

						$name=$_COOKIE['name'];
						if(isset($_COOKIE['openid']))
						{
								$userId='qq'.$_COOKIE['openid'];
								$email=isset($_COOKIE['email'])?$_COOKIE['email']:'';
								$url=isset($_COOKIE['url'])?$_COOKIE['url']:'';
								if(strlen($name)>12)
								{
										$name=substr($name,0,6).'...';
								}
								echo '<p class=\'qqName\'>欢迎:<a href=\'qq/index.php\'>'.$name.'</a></p>';
								echo '<p class=\'qqName\'><a id=\'log_out\' href=\'include/functions.php?action=log_out\' >Log_out</a></p>';
								echo '<input type=\'hidden\' name=\'userId\' class=\'name\' value=\''.$userId.'\'></input>';
								echo '<input type=\'hidden\' name=\'name\' class=\'name\' value=\''.$name.'\'></input>';
								echo '<input type=\'hidden\' name=\'email\' class=\'email\' value=\''.$email.'\' required=\'required\'></input>';
								echo '<input type=\'hidden\' name=\'url\' class=\'url\' value=\''.$url.'\'></input>';

						}
						else
						{
								$userId=0;
								$email=isset($_COOKIE['email'])?$_COOKIE['email']:'';
								$url=isset($_COOKIE['url'])?$_COOKIE['url']:'';
								echo '<input type=\'hidden\' name=\'userId\' class=\'name\' value=\''.$userId.'\'></input>';
								echo '<input type=\'text\' name=\'name\' class=\'name\' value=\''.$name.'\'></input><br />';
								echo '<input type=\'text\' name=\'email\' class=\'email\' value=\''.$email.'\' required=\'required\'></input><br />';
								echo '<input type=\'text\' name=\'url\' class=\'url\' value=\''.$url.'\'></input><br />';

						}
				}
				else
				{
						$userId=0;
						echo '<input type=\'hidden\' name=\'userId\' class=\'name\' value=\''.$userId.'\'></input>';
						echo '<input type=\'text\' name=\'name\' class=\'name\' placeholder=\'Your Name*\' required=\'required\'></input><br />';
						echo '<input type=\'text\' name=\'email\' class=\'email\' placeholder=\'Your Email*\' required=\'required\'></input><br />';
						echo '<input type=\'text\' name=\'url\' class=\'url\' placeholder=\'Your Website\'></input><br />';
				}
				echo '<textarea type=\'text\' rows=\'6\' name=\'text\' class=\'textarea\' placeholder=\'Something Here\' required=\'required\'></textarea><br />';
				echo '<input type=\'submit\' name=\'submit\' class=\'submit\' value=\'提交\'></input>';
				echo '</form>';
				echo '<div class=\'qq_login\'><a href=\'javascript:void(0);\'>QQ登录</a></div>';
		}
		public function postComment(Request $request)
		{
				//发表评论
				$msg=array();
				$commentOff=0;
				if($commentOff!=0){
						$msg['error']=5;
						return json_encode($msg);
						exit;
				}
				if(isset($_COOKIE['time']))
				{
						$msg['error']=3;
						return json_encode($msg);
						exit;
				}
				date_default_timezone_set('Asia/Shanghai');    //把时区设置为中国的上海，避免时间误差，)
				$postId=$request->postId;
				$parentId=$request->input('parentId');
				$userId=$request->userId;
				$userIp=$request->userIp;
				$userAgent=$request->userAgent;
				$name=$request->name;
				$email=$request->email;
				$url=$request->url;
				$text=$request->text;
				$time=date('Y-m-d H:i:s');
				$res=MyBaseController::akismetCheck($userIp,$userAgent,$name,$email,$url,$text);
/**				if ($res=='true') {
						$msg['error']='4';
						return json_encode($msg);
						exit;
				}
				**/
				if (strpos(' ',$name)) {
						$msg['error']='6';
						return json_encode($msg);
						exit;
				}
				$pattern='/[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+\.[a-zA-Z]+/';
				if(!empty($email))
				{
						if(!preg_match($pattern,$email,$matches))
						{
								$msg['error']='0';
								return json_encode($msg);
								exit;
						}
						$pattern='/[^x00-x80]+/';
						if(!preg_match($pattern,$text,$matches))
						{
								$msg['error']='1';
								return json_encode($msg);
								exit;
						}
						if(strstr($url,'http://')===false)
						{
								$url='http://'.$url;
						}
				}
				$text=MyBaseController::removeHtmlTags($text);
				$result=Comment::create(array('postId'=>$postId,'parentId'=>$parentId,'userId'=>$userId,'name'=>$name,'email'=>$email,'url'=>$url,'text'=>$text,'time'=>$time));
				setcookie('name',$name,time()+3600*24*30,'/');
				setcookie('email',$email,time()+3600*24*30,'/');
				setcookie('url',$url,time()+3600*24*30,'/');
				setcookie('time','1',time()+60,'/');
				$msg['success']=-1;
				return json_encode($msg);
		}


}

