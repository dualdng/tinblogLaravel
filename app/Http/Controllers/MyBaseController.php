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
}

