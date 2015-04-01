@extends('layout')
@section('title')
<?php echo $post->title;?>&nbsp|&nbspBrague
@endsection
@section('navTop')
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
<?php 
				echo '<a  id=\'a\' href=\'http://'.$_SERVER['HTTP_HOST'].'\'>HOME</a>&nbsp>&nbsp<a id=\'b\' href=\'/category/'.$post->name.'\'>'.$post->name.'</a>&nbsp>&nbsp'.$post->title;
 ?>
@endsection
@section('content')
<?php 
				$post->content=stripslashes($post->content);
		$tag=explode(',',$post->tag);
		$num=count($tag);
			echo '<div class=\'article\'>';
				while($post->type==1)//image
				{
						echo '<div id=\'single\'><div class=\'title\'>'.$post->title.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>
								<div class=\'content\'>'.$post->content.'</div>';
						echo '<div class=\'user\'><span>Post on <a href=\'/category/'.$post->name.'\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>
								<div class=\'date\'></div>
								</div>';
						break;
				}
				while($post->type==2)//music
				{
						echo '<div id=\'single\'><div class=\'title\'>'.$post->title.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>
								<div class=\'content\'>'.$post->content.'</div>';
						echo '<div class=\'user\'><span>Post on <a href=\'/category/'.$post->name.'\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>
								<div class=\'date\'></div>
								</div>'; 
						break;
				}
				while($post->type==3)//status
				{
						echo '<div id=\'single\'><div class=\'content\'>'.$post->content.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>';
						echo '<div class=\'user\'><span>Post on <a href=\'/category/'.$post->name.'\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>

								<div class=\'date\'></div>
								</div>';
						break;

				}
				while($post->type==4)//standard
				{
						echo '<div id=\'single\'><div class=\'title\'>'.$post->title.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>';
						echo '<div class=\'content\'>'.$post->content.'</div>';
						echo '<div class=\'user\'><span>Post on <a href=\'/category/'.$post->name.'\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>
								<div class=\'date\'></div>
								</div>';
						break;
				}
				echo '<div style=\'clear:both;border-bottom:1px solid #ebeaea;margin-top:20px;\'></div>';
				echo '</div>';
?>

<div class='commentTitle'><span class='icon-pencil'>&nbsp&nbspPost your comments here:</span></div>
<div id='commentArea'>
</div>
<div id='comment'>
</div>
<!--comments end-->
<script>
$(function(){
		getComment(<?php echo $id;?>);
		getCommentArea(<?php echo $id;?>,0);
		updateView(<?php echo $id;?>);
})

</script>
@endsection

@section('link')
<?php foreach($link as $links){
		echo '<a href=\''.$links->link.'\' title=\''.$links->title.'\'>'.$links->name.'</a>&nbsp|&nbsp';
}
?>
@endsection
