@extends('layout')
@section('title')
Archive&nbsp|&nbsp首页
@endsection


@section('navTopTwo')
<div id='navLogo'>
<a href='<?php echo 'http://'.$_SERVER['HTTP_HOST'];?>' title='Brague'><img src='/image/logo.png' /></a>
</div>
<div id='navRight'>
<a href='/category/Codes' title='科学分类'>Codes</a>&nbsp
<a href='/category/LifeTime' title='关于你'>LifeTime</a>&nbsp
&nbsp
<a href='http://soft.uuuuj.com' title='Soft Music'>Music</a>
</div>
@endsection
@section('banner')
<a  id='a' href='http://<?php echo $_SERVER['HTTP_HOST'];?>'>HOME</a>&nbsp>&nbspARCHIVE
@endsection

@section('content')
				<div id='article'>
<?php
$num=count($archive);
for($i=0;$i<$num;$i+=3){
		if($i>=3){
				if(@$archive[$i]==$archive[$i-3]){
						echo $archive[$i+2];
				}else {
						echo $archive[$i+1];
						echo $archive[$i+2];
				}
		}else{
				echo $archive[$i+1];
				echo $archive[$i+2];
		}
}
?>
				</div>
@endsection

@section('link')
<?php foreach($link as $links){
		echo '<a href=\''.$links->link.'\' title=\''.$links->title.'\'>'.$links->name.'</a>&nbsp|&nbsp';
}
?>
@endsection
