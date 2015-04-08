@extends('layout')
@section('title')
<?php echo $post->title;?>&nbsp|&nbspBrague
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
						echo '<div id=\'single\'><div class=\'title\' value=\''.$post->title.' | Brague\'>'.$post->title.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>
								<div class=\'content\'>'.$post->content.'</div>';
						echo '<div class=\'user\'><span>Post on <a id=\'category\' href=\'/category/'.$post->name.'/page/1\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a id=\'tag\'  class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'/page/1\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>
								<div class=\'date\'></div>
								</div>';
						break;
				}
				while($post->type==2)//music
				{
						echo '<div id=\'single\'><div class=\'title\' value=\''.$post->title.' | Brague\'>'.$post->title.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>
								<div class=\'content\'>'.$post->content.'</div>';
						echo '<div class=\'user\'><span>Post on <a id=\'category\'  href=\'/category/'.$post->name.'/page/1\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a id=\'tag\'  class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'/page/1\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>
								<div class=\'date\'></div>
								</div>'; 
						break;
				}
				while($post->type==3)//status
				{
						echo '<div id=\'single\'><div class=\'title\' value=\''.$post->title.' | Brague\'></div><div class=\'content\'>'.$post->content.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>';
						echo '<div class=\'user\'><span>Post on <a id=\'category\' href=\'/category/'.$post->name.'/page/1\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a id=\'tag\'  class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'/page/1\'>'.$tag[$a].'</a>&nbsp';
						}
						echo '</div>

								<div class=\'date\'></div>
								</div>';
						break;

				}
				while($post->type==4)//standard
				{
						echo '<div id=\'single\'><div class=\'title\' value=\''.$post->title.' | Brague\'>'.$post->title.'<span class=\'views\'>'.$post->view.' Views<br />'.date('d M,y',strtotime($post->createDate)).'</span></div>';
						echo '<div class=\'content\'>'.$post->content.'</div>';
						echo '<div class=\'user\'><span>Post on <a id=\'category\'  href=\'/category/'.$post->name.'/page/1\'>'.$post->name.'</a> with tags:</span>';
						for($a=0;$a<$num;$a++)
						{
								echo'<a id=\'tag\'  class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'/page/1\'>'.$tag[$a].'</a>&nbsp';
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
