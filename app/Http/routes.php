<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', 'MainController@getIndex');//首页

Route::get('page/{page}', 'MainController@index');//首页分页

Route::post('page/{page}', 'MainController@index');//首页分页

Route::get('single/{id}', 'MainController@getPost');//文章页

Route::post('single/{id}', 'MainController@getPost');//文章页

Route::get('view/{id}', 'MainController@updateView');//更新浏览量

Route::post('getComment/{id}', 'CommentController@getComment');//id为文章id
Route::get('getComment/{id}', 'CommentController@getComment');//id为文章id

Route::post('getCommentArea/{id}', 'CommentController@getCommentArea');//id

Route::post('postComment', 'CommentController@postComment');

Route::get('category/{category}/page/{page}', 'MainController@getCategory');
Route::post('category/{category}/page/{page}', 'MainController@getCategory');

Route::get('tag/{tag}/page/{page}', 'MainController@getTag');
Route::post('tag/{tag}/page/{page}', 'MainController@getTag');

Route::get('archive', 'MainController@getArchive');

Route::post('archive', 'MainController@getArchive');

Route::get('side', 'MainController@getSide');

Route::post('side', 'MainController@getSide');

Route::get('login', 'Dashboard\MainController@getLogin');

Route::post('login', 'Dashboard\MainController@auth');

Route::get('logout', 'Dashboard\MainController@logout');


Route::get('register', 'Dashboard\MainController@getRegister');
Route::post('register','Dashboard\MainController@register');

Route::group(['middleware'=>'myAuth'],function(){
		Route::get('dashboard','Dashboard\MainController@getIndex');
		Route::get('dashboard/edit/{id}','Dashboard\MainController@editPost');//获取文章编辑页面id为文章id
		Route::post('dashboard/edit/{id}','Dashboard\MainController@updatePost');//获取文章编辑页面id为文章id
		Route::get('dashboard/post/{id}','Dashboard\MainController@getPostArea');//获取文章发布页面id为用户id
		Route::post('dashboard/post/{id}','Dashboard\MainController@postPost');//ajax 发布文章id为用户id
		Route::get('dashboard/clearCache','Dashboard\MainController@clearCache');//ajax 发布文章id为用户id
});

Route::get('test/{email}', 'MyBaseController@cacheAvatar');
Route::get('getTest', 'MainController@getTest');


Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
/**
 * wechat api
 */
Route::get('wechat','WechatController@checkSignature');
