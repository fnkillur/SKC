<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>Insert title here</title>
<meta name="description" content="A responsive folded flyer-like restaurant menu with some 3D" />
<meta name="keywords" content="css3, perspective, 3d, jquery, transform3d, responsive, template, restaurant, menu, leaflet, folded, flyer, concept" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="/resources/menupan/css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Raleway:300,500|Arvo:700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="/resources/menupan/js/modernizr.custom.79639.js"></script> 
<!--[if lte IE 8]><style>.support-note .note-ie{display:block;}</style><![endif]-->
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css" />
</head>
<body>

<form id="jobForm">
	<input type="hidden" name="st_tel" value="${st_tel }">
	<input type="hidden" name="me_seq" value="${cri.me_seq }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
</form>

<div class="container">

	<header>
		<div class="support-note"><!-- let's check browser support with modernizr -->
			<span class="no-cssanimations">CSS animations are not supported in your browser</span>
			<span class="no-csstransforms">CSS transforms are not supported in your browser</span>
			<span class="no-csstransforms3d">CSS 3D transforms are not supported in your browser</span>
			<span class="no-csstransitions">CSS transitions are not supported in your browser</span>
			<span class="note-ie">Sorry, only modern browsers.</span>
		</div>
	</header>

	<section class="main">
		<div id="rm-container" class="rm-container">
			<div class="rm-wrapper">
				<div class="rm-cover">
					<div class="rm-front">
						<div class="rm-content">
							<div class="rm-logo"></div>
							<h2 class="st_name"></h2>
							<h3 class="st_type"></h3>

							<a href="#" class="rm-button-open">View the Menu</a>
							
							<div class="rm-info">
								
							</div>
						
						</div><!-- /rm-content -->
					
					</div><!-- /rm-front -->

					<div class="rm-back">
						<div class="rm-content">
							<h4>High Ranked Menu</h4>
							<dl class="menu_rank">
						
							</dl>
							<div class="rm-order">
								<p><strong>이 가게에서 가장 인기있는 음식?</strong> 고객들이 남겨주신 리뷰를 바탕으로 상위 점수를 받은 메뉴를 모았습니다.</p>
							</div>
						</div><!-- /rm-content -->
						<div class="rm-overlay"></div>

					</div><!-- /rm-back -->

				</div><!-- /rm-cover -->

				<div class="rm-middle">
					<div class="rm-inner">
						<div class="rm-content">
							<h4>All Menu</h4>
							<dl class="menu_all">
							 
							</dl>
						</div><!-- /rm-content -->
						<div class="rm-overlay"></div>
					</div><!-- /rm-inner -->
				</div><!-- /rm-middle -->

				<div class="rm-right">
					<div class="rm-front">
					</div>

					<div class="rm-back">
						<span class="rm-close">Close</span>
						<div class="rm-content">
							<dl class="menu_all2">
							
							</dl>
							<div class="rm-order">
							
							</div>
							<div id="menu_paging">
								<ul class="menupaging pagination pagination-sm pull-right"></ul>
							</div>
						</div><!-- /rm-content -->
					</div><!-- /rm-back -->

				</div><!-- /rm-right -->
			</div><!-- /rm-wrapper -->

		</div><!-- /rm-container -->

	</section>
			
</div>
<!-- jQuery if needed -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="/resources/menupan/js/menu.js"></script>
<script type="text/javascript" src="/resources/menupan/js/storePage.js"></script>
<script type="text/javascript">

$(function() {

	Menu.init();
			
});
</script>
</body>
</html>