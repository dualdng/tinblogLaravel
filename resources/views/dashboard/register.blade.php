@extends('dashboard.layout')
@section('title')
注册&nbsp|&nbspBrague
@endsection
@section('menu')
<menu class='menu'>
<ul class='list-group'>
		<li class='list-group-item list-group-item-success'>使用微博登录</li>
		<li class='list-group-item list-group-item-info'>使用QQ登录</li>
</ul>
</div>
@endsection
@section('content')
<div class='register'>
						<form method='post' onSubmit='return register();'>
								<div class='form-group'>
								<label for='name'>用户名</label>
								<div class='input-group'>
										<span class='input-group-addon'>*</span>
								<input id='name' class='form-control'  name='name' type='text' placeholder=''/>
						</div>
						</div>
						<div class='form-group'>
								<label for='email'>邮箱</label>
								<div class='input-group'>
										<span class='input-group-addon'>*</span>

								<input id='email' class='form-control' name='email' type='text' placeholder=''/>
						</div>
						</div>
						<div class='form-group'>
								<label for='password'>密码</label>
								<div class='input-group'>
										<span class='input-group-addon'>*</span>

								<input id='password' class='form-control' name='password' type='password' placeholder=''/>
						</div>
						</div>
						<div class='form-group'>

								<label for='passwordConfirm'>确认密码</label>
								<div class='input-group'>
										<span class='input-group-addon'>*</span>

								<input id='passwordConfirm' class='form-control' name='passwordConfirm' type='password' placeholder=''/>
						</div>
						</div>
								<input class='btn btn-success btn-lg' type='submit' value='提交'/>
						</form>
				</menu>
@endsection

