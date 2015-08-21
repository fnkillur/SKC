<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->

<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="\resources\dist\css\mypage.css">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="layout">
<div id="menu">
	<div class="pure-menu">
		<a class="pure-menu-heading" href="#">MyPage</a>
		<ul class="pure-menu-list">
			<li class="pure-menu-item"><a href="mentoList" class="pure-menu-link">Mento View</a></li>
			<li class="pure-menu-item"><a href="message" class="pure-menu-link">Message</a></li>
			<li class="pure-menu-item"><a href="category" class="pure-menu-link">Category</a></li>
			<li class="pure-menu-item"><a href="modify" class="pure-menu-link">Modify</a></li>
		</ul>
	</div>
</div>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(".pure-menu-link").on("click", function(event){
		event.preventDefault();
		var targetList = $(this).attr("href");
		if(targetList == "modify"){
			location.href="/member/mypage/modify";
		}else if(targetList == "category"){
			location.href = "/member/mypage/category";
		}
	});
</script>
</html>