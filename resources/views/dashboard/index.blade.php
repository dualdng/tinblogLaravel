@extends('dashboard.layout')
@section('banner')
@endsection
@section('menu')
<menu class='left'>
<div class='list-group'>
<a class='list-group-item disable'>网站管理</a>
<a class='list-group-item' href='javascript:getPostArea(<?php echo $user->id;?>)' >发表文章</a>
<a class='list-group-item' href='javascript:editPostArea()'>编辑文章</a>
<a class='list-group-item' href='javascript:void(0)'>编辑用户</a>
<a class='list-group-item' href='javascript:void(0)'>编辑分类</a>
<a class='list-group-item' href='javascript:void(0)'>网站选项</a>
<a class='list-group-item' href='javascript:editLink()'>友情链接</a>
<a class='list-group-item disable'>其他</a>
<a class='list-group-item' href='/tinblog/public/logout' >登出</a>
<a class='list-group-item' href='/tinblog/public/dashboard/clearCache'>缓存</a>
</div>

@endsection
@section('content')
<div id='editPostArea' class='panel panel-default'>
<div class='panel-heading'>
<h2 class='panel-title'>欢迎：<?php echo $user->name;?></h2>
</div>
<table class='table table-striped table-bordered'>
<tr>
<td>序号</td>
<td>标题</td>
<td>操作</td>
</tr>
<?php
foreach($post as $values) {
echo '<tr>';
echo '<td>'.$values->id.'</td>';
echo '<td>'.$values->title.'</td>';
echo '<td><a class=\'btn btn-success\' href=\'javascript:editPost('.$values->id.')\'>编辑</a><a class=\'btn btn-danger\' href=\'javascript:deletePost('.$values->id.')\'>删除</a></td>';
echo '</tr>';
};
?>
</table>
</div>

@endsection

