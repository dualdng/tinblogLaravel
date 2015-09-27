<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class WechatController extends Controller {
		/**
		 * Wechat token
		 * @param varchar token
		 * @access private
		 */
		private $token='willcfabcdefg';
		/**
		 * checkSignature
		 * 微信接口认证
		 */
		public function checkSignature(){
				$signature=$request->input('signature');
				$timestamp=$request->input('timestamp');
				$nonce=$request->input('nonce');
				$echostr=$request->input('echostr');
				$token=$this->token;
				$temp=array($token,$timestamp,$nonce);
				sort($temp,SORT_STRING);
				$temp=implode($temp);
				$temp=sha1($temp);
				if($temp==$signature) {
						return $echostr;
				} else {
						return false;
				}
		}
}
