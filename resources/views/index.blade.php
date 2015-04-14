@extends('layout')
@section('title')
Brague&nbsp|&nbsp首页
@endsection
@section('header')
<div class="bgImg"></div>
<div class="mainTitle">
<span><?php echo $line;?></span>
</div>
@endsection


@section('content')
				<div id='article'>
<?php
echo '<div class=\'article\'>';
		/**	echo '<div class=\'hit_count\'>'.$res[$i][9].'</div>';**/
				foreach($post as $values) {
						$values->content=stripslashes($values->content);
						$tag=explode(',',$values->tag);
						$num=count($tag);
						while($values->type==1)//image   id w为文章唯一字段
						{
								$ruls="/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.jpeg|\.bmp|\.png]))[\'|\"].*?[\/]?>/";
								$str=$values->content;
								preg_match_all($ruls,$str,$matches);
								$c=count($matches[0]);
								echo '<div id=\'image\'><div class=\'title\'><span class=\'icon-image\'>&nbsp&nbsp</span><a id=\'title\' href=\'/single/'.$values->id.'\'>'.$values->title.'</a><span class=\'views\'>'.$values->view.' Views<br />'.date('d M,y',strtotime($values->createDate)).'</span></div>';
								echo '<div class=\'content\'>';
								if(empty($values->excerpt))
								{
										for($b=0;$b<$c;$b++)
										{
												echo '<a href=\''.$matches[1][$b].'\'>'.@$matches[0][$b].'</a>';
										}
								}
								else
								{
										echo $values->excerpt;
										for($b=0;$b<$c;$b++)
										{
												echo '<a href=\''.$matches[1][$b].'\'>'.@$matches[0][$b].'</a>';
										}
								}
								echo '</div>';
								echo '<div style=\'clear:both\'></div>';
								echo '<div class=\'user\'><span>'.$values->userName.' post on <a id=\'category\'  href=\'/category/'.$values->name.'/page/1\'>'.$values->name.'</a> with tags:</span>';
								for($a=0;$a<$num;$a++)
								{
										echo'<a id=\'tag\' class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'/page/1\'>'.$tag[$a].'</a>&nbsp';
								}
								echo '</div>

										<div class=\'date\'></div>
										</div>';
								break;
						}
						while($values->type==2)//music
						{
								$ruls='/<audio[^>]+>/iu';
								$str=$values->content;
								preg_match($ruls,$str,$matches);
								echo '<div id=\'music\'><div class=\'title\'><span class=\'icon-headphones\'></span><a id=\'title\' href=\'/single/'.$values->id.'\'>'.$values->title.'</a><span class=\'views\'>'.$values->view.' Views<br />'.date('d M,y',strtotime($values->createDate)).'</span></div>';
								if(empty($values->excerpt))
								{
										echo '<div class=\'content\'>'.@$matches[0].'</div>';
								}
								else
								{
										echo '<div class=\'content\'>'.$values->excerpt.@$matches[0].'</div>';
								}
								echo '<div class=\'user\'><span>'.$values->userName.' post on <a id=\'category\'  href=\'/category/'.$values->name.'/page/1\'>'.$values->name.'</a> with tags:</span>';
								for($a=0;$a<$num;$a++)
								{
										echo'<a id=\'tag\'  class=\'ta'.$a.'\'href=\'/tag/'.$tag[$a].'/page/1\'>'.$tag[$a].'</a>&nbsp';
								}
								echo '</div>

										<div class=\'date\'></div>
										</div>'; 
								break;
						}
						while($values->type==3)//status
						{
								echo '<div id=\'status\'><div class=\'content\'><span class=\'icon-pacman\'></span><a id=\'title\' href=\'/single/'.$values->id.'\'>'.$values->title.'</a><span class=\'views\'>'.$values->view.' Views<br />'.date('d M,y',strtotime($values->createDate)).'</span></div>';
								echo '</div>';
								break;

						}
						while($values->type==4)//standard
						{
								$ruls="/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.jpeg|\.bmp|\.png]))[\'|\"].*?[\/]?>/";
								$str=$values->content;
								preg_match($ruls,$str,$matches);
								echo '<div id=\'standard\'><div class=\'title\'><span class=\'icon-file\' >&nbsp&nbsp</span><a id=\'title\' href=\'/single/'.$values->id.'\'>'.$values->title.'</a><span class=\'views\'>'.$values->view.' Views<br />'.date('d M,y',strtotime($values->createDate)).'</span></div>';
								if(empty($values->excerpt))
								{
										echo '<div class=\'content\'>'.$values->content.'</div>';
								}
								else
								{
										echo '<div class=\'content\'>'.$values->excerpt.'<a href=\''.@$matches[1].'\'>'.@$matches[0].'</a></div>';
								}
								echo '<div style=\'clear:both\'></div>';
								echo '<div class=\'user\'><span>'.$values->userName.' post on <a id=\'category\'  href=\'/category/'.$values->name.'/page/1\'>'.$values->name.'</a> with tags:</span>';
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
				}
echo '</div>';		
?>

				</div>
				<div id='pageNav' class='pageNav'>
<?php 
if($postNum==1)
				{
				}
				else
				{
						if($page!=1)
						{
								echo '<a href=\'/page/'.($page-1).'\'>Pre</a>&nbsp';
						}
						for($i=1;$i<=$postNum;$i++)
						{
								while($i==$page)
								{
										echo '<span>'.$i.'</span>&nbsp';
										break;
								}
								while($i!=$page&$i<($page+4))
								{	
										echo '<a href=\'/page/'.$i.'\'>'.$i.'</a>&nbsp';
										break;
								}
								while($i>($page+4))
								{
										echo '...&nbsp<a href=\'/page/'.$postNum.'\'>'.$postNum.'</a>&nbsp';
										exit; //大于指定值直接退出循环，防止多个大于该值导致重复
								}
						}
						if($page!=$postNum)
						{
								echo '<a href=\'/page/'.($page+1).'\'>Next</a>';
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

