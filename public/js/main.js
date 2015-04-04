$(document).ready(function($){
		$.ajaxSetup({
				headers: {
						'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
				}
		});

		$(window).scroll(function(){
				var h=$(this).scrollTop();
				if (h>=0) {
						$('.bgImg').css({'height':'0'});
						$('.mainTitle').css({'display':'none'});
						$('#navTop').css({'visibility':'visible','position':'fixed','top':'0','background':'#fff'});
				}
		})
});
window.addEventListener('popstate',function(e){
		$('#body').empty();
		$('#body').prepend(e.state.content);
})
window.onload=function(){
		$('#progress').stop(true,true);
}
function music()
{
		var i=$('#music').attr('value');
		if (i==0) {
				document.getElementById('backMusic').pause();
				$('#music').attr('title','点击打开音乐');
				$('#music').attr('value','1');
		}else {
				document.getElementById('backMusic').play();
				$('#music').attr('title','点击关闭音乐');
				$('#music').attr('value','0');
		}
		return false;
}
		
function double(){
		$('#article').css({'width':'70%'});
		$('button:first-child').css({'display':'none'});
		$('button:last-child').css({'display':'block'});
		$('#side').css({'display':'block'});
}
function one(){
		$('#article').css({'width':'100%'});
		$('button:first-child').css({'display':'block'});
		$('button:last-child').css({'display':'none'});
		$('#side').css({'display':'none'});
}

function show_pop_post()
{
		$.ajax({
				url:'include/show_pop_post.php',
		type:'POST',
		success:function(data){
				$('#most_pop').empty();
				$('#most_pop').append(data);
		}
		})
		return false;
}
function show_rand_post()
{
		$.ajax({
				url:'include/show_rand_post.php',
		type:'POST',
		success:function(data) {
				$('#most_pop').empty();
				$('#most_pop').append(data);
		}
		})
		return false;
}



$(document).on('click','#pageNav a',function()
				{
						var	url=$(this).attr('href');
						$('#progress').animate({'width':'100%'},3000);
						$('.spinner').css({'display':'block'});
						$('#body').fadeOut();
						$.ajax({
								url:url,
								type:'POST',
								data:{"music":0},
								success:function(data) {
										$('#progress').stop(true,true);
										$('#progress').css({'width':'0'});
										$('.spinner').css({'display':'none'});
										$('#banner').remove();
										$('article').remove();
										$('#body').prepend(data);
										$('#body').fadeIn();
										var state={
												url:url,
								title:$(document).attr('title'),
								content:$('#body').html()
										};
										window.history.pushState(state,'',url);
								}
						})
						return false;
				})
$(document).on('click','#commentPageNav a',function()
				{
						$('#progress').animate({'width':'100%'},3000);
						$('.spinner').css({'display':'block'});
						$('#comment').fadeOut();
						var	url=$(this).attr('href');
						$.ajax ({
								url:url,
								type:'GET',
								success:function(data) {
										$('#progress').stop(true,true);
										$('#progress').css({'width':'0'});
										$('.spinner').css({'display':'none'});
										$('#comment').empty();
										$('#comment').append(data);
										$('#comment').fadeIn();
								}
						})
						return false;
				})

$(window).scroll(function(){
		var h=$(this).scrollTop();
		if(h>1000){
				$('#scrollUp').css({'display':'block'});
		}else {
				$('#scrollUp').css({'display':'none'});
		}
})
function scrollUp ()
{
		var h=$('#navTop').height();
		$('body').animate({scrollTop:h-50},1000);
		return false;
}


$(document).on('click','a#title',function()
				{
						$('#progress').animate({'width':'100%'},3000);
						$('.spinner').css({'display':'block'});
						var	url=$(this).attr('href');
						$.ajax ({
								url:url,
								type:'POST',
								data:{"music":0},
								success:function(data) {
										$('#progress').stop(true,true);
										$('#progress').css({'width':'0'});
										$('.spinner').css({'display':'none'});
										var result3=$(data).attr('title');
										$('#banner').remove();
										$('article').remove();
										$('#body').prepend(data);
										var result=$(data).find('.title').attr('value');
										$(document).attr('title',result);
										var state={
												url:url,
								title:$(document).attr('title'),
								content:$('#body').html()
										};

										window.history.pushState('state','xxxxx',url);
								}
						})
						return false;
				})

$(document).on('click','a#category',function()
				{
						$('#progress').animate({'width':'100%'},3000);
						$('.spinner').css({'display':'block'});
						var	url=$(this).attr('href');
						$.ajax ({
								url:url,
								type:'POST',
								data:{"music":0},
								success:function(data) {
										$('#progress').stop(true,true);
										$('#progress').css({'width':'0'});
										$('.spinner').css({'display':'none'});
										$('#banner').remove();
										$('article').remove();
										$('#body').prepend(data);
										var result=$(data).find('h2').attr('value');
										$(document).attr('title',result);
										var state={
												url:url,
								title:$(document).attr('title'),
								content:$('#body').html()
										};

										window.history.pushState('state','',url);
								}
						})
						return false;
				})

$(document).on('click','a#tag',function()
				{
						$('#progress').animate({'width':'100%'},3000);
						$('.spinner').css({'display':'block'});
						var	url=$(this).attr('href');
						$.ajax ({
								url:url,
								type:'POST',
								data:{"music":0},
								success:function(data) {
										$('#progress').stop(true,true);
										$('#progress').css({'width':'0'});
										$('.spinner').css({'display':'none'});
										var result3=$(data).attr('title');
										$('#banner').remove();
										$('article').remove();
										$('#body').prepend(data);
										var result=$(data).find('h2').attr('value');
										$(document).attr('title',result);
										var state={
												url:url,
								title:$(document).attr('title'),
								content:$('#body').html()
										};
										window.history.pushState('state','',url);
								}
						})
						return false;
				})
function getArchive()
{
		$('#progress').animate({'width':'100%'},3000);
		$('.spinner').css({'display':'block'});
		var	url='/archive';
		$.ajax ({
				url:url,
				type:'POST',
				success:function(data) {
						$('#progress').stop(true,true);
						$('#progress').css({'width':'0'});
						$('.spinner').css({'display':'none'});
						$('#banner').remove();
						$('article').remove();
						$('#body').prepend(data);
						$(document).attr('title','归档 | Brague');
						var state={
								url:url,
				title:$(document).attr('title'),
				content:$('#body').html()
						};
						window.history.pushState('state','',url);
				}
		})
		return false;
}

function updateView(id)
{
		var url='/view/'+id;
		$.ajax({
				url:url,
				type:'GET',
				success:function(data){
				}
		})
}

function getComment(postId)
{
		$('#progress').animate({'width':'100%'},3000);
		var url='/getComment/'+postId;
		$.ajax({
				url:url,
				type:'POST',
				success:function(data) {
						$('#progress').stop(true,true);
						$('#progress').css({'width':'0'});
						$('#comment').append(data);
				}
		})
}
function getCommentArea (postId,parentId)
{
		$('#progress').animate({'width':'100%'},3000);
		var url='/getCommentArea/'+postId;
		var parastr={"parentId":parentId};
		$.ajax({
				url:url,
				type:'POST',
				data:parastr,
				success:function(data) {
						$('#progress').stop(true,true);
						$('#progress').css({'width':'0'});
						if(parentId==0){
								$('#commentArea').append(data);
						}else {
								$('a.reply-'+parentId).css({'display':'none'});
								$('a.cancelReply-'+parentId).css({'display':'block'});
								$('#commentArea').empty();
								$('.commentArea').empty();
								$('.commentArea-'+parentId).append(data);
						}

				}
		})
		return false;
}

function cancelReply(postId,parentId)
{
		$('.commentArea-'+parentId).empty();
		$('a.cancelReply-'+parentId).css({'display':'none'});
		$('a.reply-'+parentId).css({'display':'block'});
		getCommentArea(postId,0);
}
function postComment()
{
		$('#progress').animate({'width':'100%'},3000);
		$('input.submit').attr('value','发送中!');
		$('input.submit').attr('disabled','disabled');
		var postId=$(':input[name=\'postId\']').val();
		var parentId=$(':input[name=\'parentId\']').val();
		var userId=$(':input[name=\'userId\']').val();
		var userIp=$(':input[name=\'userIp\']').val();
		var userAgent=$(':input[name=\'userAgent\']').val();
		var name=$(':input[name=\'name\']').val();
		var email=$(':input[name=\'email\']').val();
		var url=$(':input[name=\'url\']').val();
		var text=$(':input[name=\'text\']').val();
		var parastr={"postId":postId,"parentId":parentId,"userId":userId,"userIp":userIp,"userAgent":userAgent,"name":name,"email":email,"url":url,"text":text};
		//		var parastr='id='+id+'&pre_post_id='+pre_post_id+'&user_id='+user_id+'&name='+name+'&email='+email+'&url='+url+'&text='+text;
		$.ajax({
				url:'/postComment',
				type:'POST',
				data:parastr,
				dataType:'json',
				success:function(data){
						$('#progress').stop(true,true);
						$('#progress').css({'width':'0'});

						$('input.submit').attr('value','提交');
						if(data.error==0) {
								alert('邮箱格式错误');
								return;
						}
						else if (data.error==1) {
								alert('请输入中文');
								return;
						}
						else if (data.error==3) {
								alert('评论过快');
								return;
						}
						else if (data.error==4) {
								alert('SPAM!!!');
								return;
						}
						else if (data.error==5) {
								alert('评论关闭');
								return;
						}
						else if (data.error==6) {
								alert('禁止空格');
								return;
						}
						else if (data.success==-1) {
								$('.commentField').css({'display':'none'});
								$('.commentArea').css({'display':'none'});
								$('.commentTitle').css({'display':'none'});
								$('#commentArea').html('<p class=\'icon-cool\'>&nbspYour comments here:</p><div style=\'color:#61a64b;margin-top:10px;font-size:26px;\'>'+text+'</div>').css({'border-bottom':'1px solid #ccc','padding':'5px 0'});
								$("html,body").animate({scrollTop:$("#commentArea").offset().top-100},1000);
						}

				}
		})
		return false;
}
function register()
{
		var name=$('#name').val();
		var email=$('#email').val();
		var password=$('#password').val();
		var url='/register';
		var parastr={"name":name,"email":email,"password":password};
		$.ajax({
				url:url,
				type:'POST',
				data:parastr,
				dataType:'JSON',
				success:function(data){
						alert(data);

				}
		});
		return false;
}
function getPostArea(id)
{
		var url='/dashboard/post/'+id;
		$.ajax({
				url:url,
				type:'GET',
				success:function(data){
						var result=$(data).find('#postArea');
						$('#editPostArea').fadeOut();
						$('#postArea').remove();
						$('#right').append(result);
						KindEditor.ready(function(K){
								window.editor=K.create('#editor_id');
						})
				}

		})
}
function editPostArea()
{
		$('#editPostArea').fadeIn();
		$('#postArea').remove();
}
function editPost(id)
{
		var url='/dashboard/edit/'+id;
		$.ajax({
				url:url,
				type:'GET',
				success:function(data){
						var result=$(data).find('#postArea');
						$('#editPostArea').fadeOut();
						$('#postArea').remove();
						$('#right').append(result);
						KindEditor.ready(function(K){
								window.editor=K.create('#editor_id');
						})

				}

		})
}
function postPost()
{
		editor.sync();//kindeditor 中的说明
		var content=$('#editor_id').val();
		var title=$('#title').val();
		var excerpt=$('#excerpt').val();
		var categoryId=$('#categoryId').val();
		var tag=$('#tag').val();
		var type=$('#type').val();
		var userId=$('#userId').val();
		var state=$('#state').val();
		var url='/dashboard/post/'+userId;
		var parastr={"content":content,"title":title,"excerpt":excerpt,"categoryId":categoryId,"tag":tag,"type":type,"userId":userId,"state":state};
		$.ajax({
				url:url,
				type:'POST',
				data:parastr,
				success:function(data){
						$('#postArea').empty();
						$('#postArea').append(data);
				}
		})
		return false;
}

function updatePost(id)
{
		editor.sync();//kindeditor 中的说明
		var content=$('#editor_id').val();
		var title=$('#title').val();
		var excerpt=$('#excerpt').val();
		var categoryId=$('#categoryId').val();
		var tag=$('#tag').val();
		var type=$('#type').val();
		var userId=$('#userId').val();
		var state=$('#state').val();
		var url='/dashboard/edit/'+id;
		var parastr={"content":content,"title":title,"excerpt":excerpt,"categoryId":categoryId,"tag":tag,"type":type,"userId":userId,"state":state};
		$.ajax({
				url:url,
				type:'POST',
				data:parastr,
				success:function(data){
						$('#postArea').empty();
						$('#postArea').append(data);
				}
		})
		return false;
}



/** ajax ep **/
/**
  $.ajax({ 
  url: "Service.php", 
  type: "POST", 
  contentType: "application/json;utf-8", 
  dataType: 'json', 
  cache: false, 
  beforeSend:function(){ 
  $("#showloading").html("<img src=\"images/loading.gif\" />正在请求数据,请稍后..."); 
  }, 
  success: function(data) { 
  var d = eval(data); 
//处理json,方法略 
}, 
error: function(data) { 
alert(data); 
} 
});
 **/

$(document).on('click','#pagenavi_comments a',function()
				{
						$('.spinner').css({'display':'block'});
						var	url=$(this).attr('href');
						$.ajax
		(
		 {
				 url:url,
				type:'POST',
				success:function(data)
		{

				$('.spinner').css({'display':'none'});
				$('#comments').empty();
				$('#comments').append(data);
				$('#comments').fadeIn();
		}
		 })
return false;
				})


