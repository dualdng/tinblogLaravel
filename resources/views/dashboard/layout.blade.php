<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name="csrf-token" content="{{ csrf_token() }}" > <!-- laravel的放夸域请求验证 -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery-2.1.0.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src='/js/main.js' ></script>
<link rel='stylesheet' href='/style/main.css'>
	<link rel="stylesheet" href="/editor/themes/default/default.css" />
	<link rel="stylesheet" href="/editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/editor/kindeditor.js"></script>
	<script charset="utf-8" src="/editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/editor/plugins/code/prettify.js"></script>

	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '/editor/plugins/code/prettify.css',
				uploadJson : '/editor/php/upload_json.php',
				fileManagerJson : '/editor/php/file_manager_json.php',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=article]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=article]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>

<title>
@yield('title')
</title>
</head>
<body>
<article class='container'>
@yield('banner')
<div class='col-md-3'>
@yield('menu')
</div>
<div class='col-md-9'>
<div id='right'>
@yield('content')
</div>
</div>
</article>
</body>
</html>

