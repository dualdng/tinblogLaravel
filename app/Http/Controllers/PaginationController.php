<?php namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaginationController extends Controller {
		public static function getPageNav ($num,$pageNum=5,$page=0,$url)
		{
				if($num!=0) {
						$maxNum=ceil($num/$pageNum);
						echo '<nav id=\'pageNav\'>';
						echo '<ul class=\'pagination\'>';
						echo '<li>';
						echo '<a href=\'#\' aria-label=\'Previous\'>';
						echo '<span aria-hidden=\'true\'>&laquo;</span>';
						echo '</a>';
						echo '</li>';
						for ($i=0;$i<$maxNum;$i++) {
								if ($page==$i) {
										echo '<li class=\'active\'><a href=\'#\'>'.$page.'</a></li>';
								} else {
										echo '<li><a href=\''.$url.'?page='.$i.'\'>'.$i.'</a></li>';
								}
						}
						echo '<li>';
						echo '<a href=\'#\' aria-label=\'Next\'>';
						echo '<span aria-hidden=\'true\'>&raquo;</span>';
						echo '</a>';
						echo '</li>';
						echo '</ul>';
						echo '</nav>';
				}
		}
}
