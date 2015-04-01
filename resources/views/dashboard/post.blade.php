@extends('dashboard.layout')
@section('content')
<div id='postArea' class='panel panel-default'>
<div class='panel-heading'>
<h2 class='panel-title'>发表文章</h2>
</div>
<div class='panel-body'>
<form method='post' onSubmit='return postPost()'>
<div class='form-group sr-only'>
<label for='userId'>用户</label>
<input id='userId' name='userId' class='form-control' type='text' value='<?php echo $userId;?>'>
</div>
<div class='form-group'>
<label for='title'>标题</label>
<input id='title' name='title' class='form-control' type='text'>
</div>
<div class='form-group'>
<label for='content'>内容</label>
<textarea id='editor_id' class='form-control' name='content' placeholder='输入内容' rows='4'></textarea><br />
</div>
<div class='form-group'>
<label for='excerpt'>摘要</label>
<input id='excerpt' name='excerpt' class='form-control' type='text'>
</div>
<div class='form-group'>
<label for='tag'>标签</label>
<input id='tag' name='tag' class='form-control' type='text'>
</div>
<div class='form-group form-inline'>
<label for='type'>文章类型&nbsp:&nbsp</label>
<select id='type' name='type'class='form-control' >
<option value='4'>标准</option>
<option value='1'>图片</option>
<option value='2'>音乐</option>
<option value='3'>状态</option>
</select>
<label for='categoryId'>&nbsp&nbsp文章分类&nbsp:&nbsp</label>
<select id='categoryId' name='categoryId'class='form-control' >
<?php
foreach($category as $values)
{
		echo '<option value=\''.$values->id.'\'>'.$values->name.'</option>';
}
?>
</select>
<label for='state'>&nbsp&nbsp状态&nbsp:&nbsp</label>
<select id='state' name='state'class='form-control' >
<option value='0'>正常</option>
<option value='1'>草稿</option>
</select>
</div>
<input class='btn btn-success'  type='submit' value='提交'>
</form>
</div>
</div>
@endsection
