<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

.modi-form{
	margin: 15% auto auto 15%;
}

.modi-form input{
	margin: 10px auto 10px 10px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	color: #333;
	background:url(/resources/mypage/img/bginput.jpg) repeat-x bottom #fff;
	width: 180px;
	height: 30px;
	position:relative;
	font-size:17px;
	font-family:Arial, Helvetica, sans-serif;
	border-radius: 4px;
}

.modi-form span{
	display:inline-block; .display:inline; *zoom:3;
	margin-left: 10px;
	width: 120px;
	height: 30px;
	color: black;
	border-radius: 4px;	
	font-style: bold;
	text-align: center;
}

.modi-form .last-check{
	width: 180px;
}

.check-ok{
	background-color: #47C83E;
}

.check-no{
	background-color: #A81919;
}

.box span {
	display:inline-block; .display:inline; *zoom:3;
	margin-left: 10px;
	width: 60px;
	height: 30px;
	color: black;
	border-radius: 4px;	
	font-style: bold;
	text-align: center;
	background-color: gray;
}

.box textarea {
	width: 100%;
	height: 100%;
	border: 0;
	resize: none;
}

.del-modal{
	position:absolute;
	z-index:10000; 
	background-color:#F6F6F6; 
	width:200px; 
	height:100px;
	text-align: center;
	padding: 20px;
	border-radius: 8px;	
	border: 1px solid black;
	line-height: 30px;
	margin: 10% auto auto 20%;
}
</style>
</head>
<body>

	<%@include file="sideMenu.jsp"%>
	
	<form id="jobForm">
		<input type="hidden" name="id" value="abc123">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
	</form>
	
	<div class="content">

	</div>
	<div class="review pagination pull-right"></div>
	<div class="coupon pagination pull-right"></div>

</body>

<script type="text/javascript" src="/resources/bootstrap/js/jquery-1.11.3.js"></script>
<script type="text/javascript">

$(".content").on("blur", "#nick", function(){
	
	var data = $("#modifyForm").serialize();
	$.get("/skc/myPage/nickCheck", data, function(data){
		
		if(data == "ok")
			$(".nick-check").removeClass("check-no").addClass("check-ok").text("사용가능");
		else
			$(".nick-check").removeClass("check-ok").addClass("check-no").text("중복된 닉네임");
	});
});


$(".content").on("blur", "#pw", function(){
	
	var pw = $("#pw").val();
	
	if(pw == "")
		$(".pw-check").removeClass("check-ok").addClass("check-no").text("입력하세요");
	else
		$(".pw-check").removeClass("check-no").addClass("check-ok").text("입력완료");
});

$(".content").on("blur", "#repw", function(){
	
	var pw = $("#pw").val();
	var repw = $(this).val();
	
	if( pw != ""){
		if(repw == "")
			$(".repw-check").removeClass("check-ok").addClass("check-no").text("입력하세요");
		else if(pw == repw)
			$(".repw-check").removeClass("check-no").addClass("check-ok").text("비빌번호 일치");
		else if(pw != repw)
			$(".repw-check").removeClass("check-ok").addClass("check-no").text("비밀번호 불일치");
	}
});

$(".content").on("click", "button", function(){
	
	if($(".nick-check").hasClass("check-ok") == false)
		
		$(".last-check").removeClass("check-ok").addClass("check-no").text("닉네임을 확인해주세요");
	
	else if($(".pw-check").hasClass("check-ok") == false)
		
		$(".last-check").removeClass("check-ok").addClass("check-no").text("비밀번호를 확인해주세요");
	
	else if($(".repw-check").hasClass("check-ok") == false)
		
		$(".last-check").removeClass("check-ok").addClass("check-no").text("아래비밀번호를 확인해주세요");
	
	else{
		
		$(".last-check").removeClass("check-no").addClass("check-ok").text("완료");
		
		var data = $("#modifyForm").serialize();
		$.post("/skc/myPage/modifyMember", data, function(data){
			console.log("결과 : "+data);
		});
		
		setTimeout(modifyForm, 400);
	}
		
});

$(".review").on("click", "li a", function(event) {
	
	event.preventDefault();
	
	var targetPageNum = $(this).attr("href");
	
	$("#jobForm").find("[name='page']").val(targetPageNum);
	
	reviewList();
	listPaging("/skc/myPage/ajaxPaging",".review");
});

$(".coupon").on("click", "li a", function(event) {
	
	event.preventDefault();
	
	var targetPageNum = $(this).attr("href");
	
	$("#jobForm").find("[name='page']").val(targetPageNum);
	
	couponList();
	listPaging("/skc/myPage/ajaxPagingCoupon", ".coupon");
});

$(".content").on("click", "#modifyForm .clickbtn", function(event) {

	var btn_name = $(this).attr("id");
	var name = btn_name.split("-");
	
	$("input[name='"+name[0]+"']").attr("name", "re_seq");
	
	if(name[1] == "modi"){
		
		var del_name = name[0]+"-del";
		
		$("#text-"+name[0]).removeAttr("readonly").attr("name", "re_content");
		$("#grade-"+name[0]).removeAttr("disabled").attr("name", "re_grade");
		$("#"+btn_name).text("확인").removeClass("clickbtn");;
		$("#"+btn_name).attr("id", "modi-ok");
		$("#"+del_name).text("취소").removeClass("clickbtn");;
		$("#"+del_name).attr("id", "modi-no");
		
		
	} else if(name[1] == "del"){
		
		
		var $modal = $( '<div class="del-modal">삭제하시겠습니까?<br><button type="button" class="btn" id="del-ok">삭제</button>   <button type="button" class="btn" id="del-no">취소</button></div>' );
		
		$modal.prependTo( $(".content") );
		
	}
	
});

var modi = function(re_seq){
	
	$("input[name='re_seq'").attr("name", re_seq);
	$("#text-"+re_seq).attr("readonly", "readonly").removeAttr("name");
	$("#grade-"+re_seq).attr("disabled", "disabled").removeAttr("name");
	$("#modi-no").text("삭제").attr("class","clickbtn");
	$("#modi-no").attr("id", "del-btn");
	$("#modi-ok").text("수정").attr("class","clickbtn");;
	$("#modi-ok").attr("id", "modi-btn");
	
	setTimeout(reviewList, 400);
}

$(".content").on("click", "#modi-ok", function(event) {
	
	var data = $("#modifyForm").serialize();
	$.post("/skc/myPage/modiReview", data, function(data){
		console.log("결과 : "+data)
	});
	
	modi( $("#modifyForm").find("input[name='re_seq']").val() );
	
});

$(".content").on("click", "#modi-no", function(event) {
	
	modi( $("#modifyForm").find("input[name='re_seq']").val() );
});

$(".content").on("click", "#del-ok", function(event) {
	
	var data = $("#modifyForm").serialize();
	$.post("/skc/myPage/deleteReivew", data, function(data){
		console.log("결과 : "+data)
	});
	
	$(".del-modal").remove();
	var re_seq = $("input[name='re_seq'").val();
	$("input[name='re_seq'").attr("name", re_seq);
	setTimeout(reviewList, 400);	
});

$(".content").on("click", "#del-no", function(event) {
	
	$(".del-modal").remove();
});


</script>
</html>