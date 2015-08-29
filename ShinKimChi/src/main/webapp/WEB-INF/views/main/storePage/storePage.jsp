<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/BookPreview/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/resources/BookPreview/css/bookblock.css" />
<link rel="stylesheet" type="text/css" href="/resources/BookPreview/css/component.css" />
<script src="/resources/BookPreview/js/modernizr.custom.js"></script>
</head>
<body>

<div id="scroll-wrap" class="container">
	<div class="main">
		<div id="bookshelf" class="bookshelf">
			<figure>
				<div class="book" data-book="book-1"></div>
				<div class="buttons"><a href="#">펼쳐보기</a></div>

				<div class="details">
				</div>
			</figure>
		</div>
	</div><!-- /main -->

	</div><!-- /container -->

<!-- Fullscreen BookBlock -->
<!-- for demo purpose we repeat each bookblock -->
<div class="bb-custom-wrapper" id="book-1">
	<div class="bb-bookblock">
		<div class="bb-item">
			<div class="bb-custom-side page-layout-1">
				<div>
					<h3>메뉴</h3>
					<p>치킨</p>
				</div>
			</div>
			<div class="bb-custom-side page-layout-1">
				<p>치킨 치킨 피자 치킨</p>
			</div>
		</div>
		<div class="bb-item">
			<div class="bb-custom-side page-layout-1">
				<h3>리뷰</h3>
				<p>솔직한 후기</p>
			</div>
			<div class="bb-custom-side page-layout-1">
				<p>존나맛없네진짜 여기오지마라</p>
			</div>
		</div>
		<div class="bb-item">
			<div class="bb-custom-side page-layout-1">
				<div>
					<h3>가게정보</h3>
					<p>홍대돈부리</p>
				</div>
			</div>
			<div class="bb-custom-side page-layout-1">
				<p>
				홍대에서 가장 맛있는 돈부리집!<br>
				운영시간 : 08:00 ~ 22:00<br>
				위치 : 서울특별시 마포구 서교동<br>
				전화번호 : 02-122-2322
			</p>
			</div>
		</div>
	</div><!-- /bb-bookblock -->
	<nav>
		<a href="#" class="bb-nav-prev">Previous</a>
		<a href="#" class="bb-nav-next">Next</a>
		<a href="#" class="bb-nav-close">Close</a>
	</nav>
</div><!-- /bb-custom-wrapper -->

<script src="/resources/BookPreview/js/bookblock.min.js"></script>
<script src="/resources/BookPreview/js/classie.js"></script>
<script src="/resources/BookPreview/js/bookshelf.js"></script>
</body>
</html>