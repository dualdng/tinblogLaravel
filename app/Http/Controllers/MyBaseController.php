<?php namespace App\Http\Controllers;


use App\Model\User;
use Auth;//用户认证模块用
class MyBaseController extends Controller {
		//

		public static function auth($email,$password) //用户认证
		{
				
				if (Auth::attempt(['email' => $email, 'password' => $password]))
				{
						return true;
				}else{
						return false;
				}
				
		}

		//防垃圾评论验证
		public static function akismetCheck($userIp,$userAgent,$name,$email,$url,$content)
		{
				$apikey='31b6d1d9f563';
				$blog='http://blog.uuuuj.com';
				$referrer='http://www.uuuuj.com';
				$blogCharset='utf-8';
				$url=$apikey.'.rest.akismet.com/1.1/comment-check';
				$data=array(
						'blog'=>$blog,
						'user_ip'=>$userIp,
						'user_agent'=>$userAgent,
						'referrer'=>$referrer,
						'comment_author'=>$name,
						'comment_author_email'=>$email,
						'comment_author_url'=>$url,
						'comment_content'=>$content,
						'blog_charset'=>$blogCharset
				);
				$curl=curl_init();
				curl_setopt($curl,CURLOPT_URL,$url);
				curl_setopt($curl,CURLOPT_HEADER,0);
				curl_setopt($curl, CURLOPT_HTTPHEADER, array(                                                                            
						'User-Agent:Tinblog/1.0 | Akismet/2.5.9'                                                                                  
				)                                                                         
		);         
				curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
				curl_setopt($curl,CURLOPT_POST,1);
				curl_setopt($curl,CURLOPT_POSTFIELDS,$data);
				$res=curl_exec($curl);
				return $res;

		}
		public static function removeHtmlTags($content)
		{
				//去除html标签
				$value = strip_tags($content);
				return is_array($value) ? array_map('k::htmlspecialchars', $value) : preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4})|[a-zA-Z][a-z0-9]{2,5});)/', '&\\1', str_replace(array(
						'&',
						'"',
						'<',
						'>',
						'\''
				) , array(
						'&amp;',
						'&quot;',
						'&lt;',
						'&gt;',
						'’'
				) , $value));
		}
		public static function cacheAvatar($email)
		{
				//avatar头像缓存到文件
				$time=60*60*24*30;//过期时间15天
				$path=dirname(dirname(dirname(dirname(__File__)))).'/public/avatar/';
				$email=md5(strtolower(trim($email)));
				$file='/avatar/'.$email.'.jpg';
				if(!file_exists($file)||(time()-filemtime($file))>$time){
						$name=$path.$email.'.jpg';
						$url='http://www.gravatar.com/avatar/'.$email.'?s=40';
						$result=file_put_contents($name,file_get_contents($url));
				}
				$url='/avatar/'.$email.'.jpg';
				return $url;
		}
		public static function getLine()
		{
				//获取台词
				$url='http://lab.uuuuj.com/llago/include/line_api.php?type=1';
				$line=file_get_contents($url,true);
				return json_decode($line,true);
		}
}

