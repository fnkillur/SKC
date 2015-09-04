<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			<li class="pure-menu-item"><a href="modify" class="pure-menu-link"><i class='fa fa-link'></i>    정보 수정</a></li>
			<li class="pure-menu-item"><a href="review" class="pure-menu-link"><i class='fa fa-link'></i>    리뷰 목록</a></li>
			<li class="pure-menu-item"><a href="coupon" class="pure-menu-link"><i class='fa fa-link'></i>    쿠폰 목록</a></li>
		</ul>
	</div>
</div>
</div>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(".pure-menu-link").on("click", function(event){
		event.preventDefault();
		
		var target = $(this).attr("href");
		
		if(target == "modify"){
			modifyForm();
			$(".coupon").css("display", "none");
			$(".review").css("display", "none");
		}else if(target == "review"){
			$("#jobForm").find("input[name='page']").val(1);
			reviewList();
			setTimeout(listPaging("/skc/myPage/ajaxPaging",".review"), 400);
		}else if(target == "coupon"){
			$("#jobForm").find("input[name='page']").val(1);
			couponList();
			setTimeout(listPaging("/skc/myPage/ajaxPagingCoupon", ".coupon"), 400);
		}
	});
	
	var modifyForm = function(){
		
		var data = $("#jobForm").serialize();
		$.get("/skc/myPage/modifyForm", data, function(data){
			
			var str = '';
			
			str += '<form id="modifyForm" class="modi-form">';
			str += '<table>'
			str += '<tr><td><label>아이디</label>	</td>';
			str += '<td><input type="text" name="id" value="'+data.id+'" readonly="readonly"></td><td></td></tr>';
			str += '<tr><td><label>이름</label></td>';
			str += '<td><input type="text" name="name" value="'+data.name+'" readonly="readonly"></td><td></td></tr>';
			str += '<tr><td><label>닉네임</label></td>	';	
			str += '<td><input type="text" name="nick" id="nick" value="'+data.nick+'"></td>';
			str += '<td><span class="nick-check"></span></td></tr>';
			str += '<tr><td><label>비밀번호</label></td>';
			str += '<td><input type="password" name="pw" id="pw"></td>';
			str += '<td><span class="pw-check"></span></td></tr>';
			str += '<tr><td><label>비밀번호 재입력</label></td>';
			str += '<td><input type="password" name="repw" id="repw"></td>';
			str += '<td><span class="repw-check"></span></td></tr>';
			str += '<tr><td><button type="button" class="btn">수정하기</button></td>'
			str += '<td colspan="2"><span class="last-check"></span></td></tr>';
			str += '</table>';
			str += '</form>';

			$(".content").html(str);
		});
	}
	
	var reviewList = function(){
		
		var data = $("#jobForm").serialize();
		$.get("/skc/myPage/reviewList", data, function(data){
			
			var str = '';

			str += '<div class="box" style="margin: 5% 0 0 -5%; width:130%;">';
			str += '<form id="modifyForm">'
			str += '<table class="table table-bordered table-hover">';
			str += '<tr>';
			str += '<th style="width:100px;">가게이름</th>';
			str += '<th colspan="2">메뉴</th>';
			str += '<th style="width:350px;">내용</th>';
			str += '<th style="width:60px;">점수</th>';
			str += '<th style="width:60px;">상태</th>';
			str += '<th style="width:140px;">기능</th>';
			str += '</tr>';
			
			
			$(data).each(function(){
				
				str += '<tr>';
				str += '<td><input type="hidden" name="'+this.re_seq+'" value="'+this.re_seq+'">'+this.st_name+'</td>';
				str += '<td><img src="'+this.me_img+'" style="width:100px; height:100px;"></td>';
				str += '<td>'+this.me_name+'</td>';
				str += '<td><textarea id="text-'+this.re_seq+'" readonly>'+this.re_content+'</textarea></td>';
				str += '<td>';
				str += '<select id="grade-'+this.re_seq+'" disabled>';
				
				for(var i = 5; i>0; i--){
					if(i == this.re_grade)
						str += '<option value="'+i+'" selected>'+i+'</option>';
					else
						str += '<option value="'+i+'">'+i+'</option>';	
				}
				str += '</select></td>';
				
				if(this.re_state == 0)
					str += '<td><span>일반</span></td>';
				else if(this.re_state == 1) 
					str += '<td><span style="background-color:#FAED7D;">베스트</span></td>';
					
				str += '<td><button type="button" class="clickbtn btn" id="'+this.re_seq+'-modi">수정</button>';
				str += '		<button type="button" class="clickbtn btn" id="'+this.re_seq+'-del">삭제</button></td>';
				str += '</tr>';
			
			});
			
			str += '</table>';
			str += '</form>';
			str += '</div>';
			
			$(".content").html(str);
		});
	}
	
	var couponList = function(){
		
		var data = $("#jobForm").serialize();
		$.get("/skc/myPage/couponList", data, function(data){
			
			var str = '';

			str += '<div class="box" style="margin: 10% 0 0 -5%; width:130%;">';
			str += '<table class="table table-bordered table-hover">';
			str += '<tr>';
			str += '<th>가게이름</th>';
			str += '<th>쿠폰번호</th>';
			str += '<th>등록일</th>';
			str += '<th>만료일</th>';
			str += '<th>쿠폰상태</th>';
			str += '</tr>';
			
			
			$(data).each(function(){
				
				str += '<tr>';
				str += '<td>'+this.st_name+'</td>';
				str += '<td>'+this.cp_num+'</td>';
				str += '<td>'+this.cp_startdate+'</td>';
				str += '<td>'+this.cp_enddate+'</td>';
				
				if(this.cp_state == 0)
					str += '<td><span style="background-color:#47C83E;">사용가능</span></td>';
				else if(this.cp_state == 1) 
					str += '<td><span style="background-color:#A81919;">만료</span></td>';
					
				str += '</tr>';
			
			});
			
			str += '</table>'
			str += '</div>';
			
			$(".content").html(str);
		});
	}
	
	var listPaging = function(addr, htmlclass){
		
		var data = $("#jobForm").serialize();
		$.get(addr, data, function(data){
			
			var str = '';
			$(data).each(function(){
				if(this.prev !=0)
					str += '<li><a href="'+this.prev+'">&laquo;</a></li>';
				for(var i=this.first; i<=this.last; i++){
					if(i==$("#jobForm").find("[name='page']").val())
						str += '<li class="active"><a href="'+i+'">'+i+'</a></li>';
					else
						str += '<li><a href="'+i+'">'+i+'</a></li>';
				}
				if(this.next !=0)
					str += '<li><a href="'+this.next+'">&raquo;</a></li>';
			});
			$(htmlclass).html(str);
			
			if(htmlclass == ".review"){
				$(htmlclass).css("display", "block");
				$(".coupon").css("display", "none");
			}else if(htmlclass == ".coupon"){
				$(htmlclass).css("display", "block");
				$(".review").css("display", "none");
			}
		});
	}
	
</script>
</body>
</html>