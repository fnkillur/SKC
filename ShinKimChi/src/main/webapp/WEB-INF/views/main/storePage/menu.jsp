<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="/resources/bootstrap/js/jquery-1.11.3.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/flip/flip.css" />
</head>
<body>

<form id="jobForm">
	<input type="hidden" name="st_tel" value="${st_tel }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
</form>

<table>
	<tbody class="menu">
										
	</tbody>					
</table>

</body>

<script type="text/javascript">

var jobForm = $("#jobForm");

var getMenu = function(){

	var data = jobForm.serialize();
	$.get("/skc/storePage/ajaxMenu", data, function(data){
		
		var str = '';
		var cnt = 0;
		
		$(data).each(function(){
			
			cnt++;
			
			if(cnt%3 == 1){
				str += '<tr>';
			}
			
			str += '<td>';
			str += '<div class="flip-container" ontouchstart="this.classList.toggle(hover);">';
			str += '<div class="flipper">';
			str += '<div class="front">';
			str += this.menu_name;
			str += '</div><div class="back">';
			str += '<p>중량 : '+this.menu_weight+'<br>가격 : '+this.menu_price+'원</p>';
			str += '</div></div></div></td>';
			
			if(cnt%3 == 0){
				str += '</tr>';
			}
			
		});
		
		$(".menu").html(str);
		
	});
}

$(document).ready(function(){
	
	getMenu();
});

</script>

</html>