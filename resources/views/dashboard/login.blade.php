@extends('dashboard.layout')
@section('title')
登录&nbsp|&nbspBrague
@endsection
@section('menu')

@endsection
@section('content')
<div class='login'>
<h2><a href='<?php echo 'http://'.$_SERVER['HTTP_HOST'];?>'>Brague</a></h2>
<form action='/login' method='post'>
<div class='form-group'>
<label for='email'>邮箱</label>
<input id='email' class='form-control' type='text' name='email'></input>
<label for='password'>密码</label>
<input id='password' class='form-control' type='password' name='password'></input>
<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>"/>
<input class='btn btn-success'  type='submit' value='登录'></input>
<a class='btn btn-success'  href='/register'>注册</a>
</div>
</form>
</div>
@endsection
