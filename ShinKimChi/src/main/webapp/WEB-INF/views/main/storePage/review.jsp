<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/bootstrap/js/npm.js" type="text/javascript"></script>
<script src="/resources/bootstrap/js/jquery-1.11.3.js" type="text/javascript"></script>
</head>

<body>

	<div class="box">
		<form id="jobForm">
			<input type="hidden" name="st_tel" value="${st_tel }">
			<input type="hidden" name="page" value="${cri.page }">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
			<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
		</form>
	</div>
	
	<div class="box-body">
	
	<div class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="upForm">
					<input type="hidden" name="id" value="aaa123">
					<input type="hidden" name="st_tel" value="${st_tel }">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">리뷰쓰기</h4>
					</div>
					<div class="modal-body">
						<p>
							<textarea name="re_content" class="form-control" col="15" row="10"></textarea>
							<br> <span class="menu_option"> </span>
							<button type="button" id="plus_menu" class="btn btn-theme">+</button>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
						<button type="button" id="saveBtn" class="btn btn-primary">리뷰 등록하기</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->	
	
		<h3>베스트 리뷰</h3>
			<table class="table table-bordered">
				<tbody class="review-best">
	
				</tbody>
			</table>
	
		<h3>일반 리뷰</h3>
			<table class="table table-bordered">
				<tbody class="review-norm">
	
				</tbody>
			</table>
			
	</div>
		
	<div class="box-footer clearfix">
		<button class="btn btn-primary" id="writeReview" data-target=".modal" class="pull-left">내 리뷰 쓰기</button>
		<ul class="pagination pagination-sm pull-right">

		</ul>
	</div>

</body>

<script type="text/javascript">
	
	var jobForm = $("#jobForm");

	var getReview = function(con_addr, view_addr) {

		var data = jobForm.serialize();
		$.get(con_addr, data, function(data) {

			var str = '';

			$(data).each(function() {

				if (this.re_state == 2)
					str += '<tr class="best_review">';
				else
					str += '<tr class="norm_review">';

				str += '<td>' + this.id + '</td>';
				str += '<td>' + this.re_grade + '</td>';
				str += '</tr>';

				if (this.re_state == 2)
					str += '<tr class="best_review">';
				else
					str += '<tr class="norm_review">';

				str += '<td colspan="2">' + this.re_content + '</td>';
				str += '</tr>';

			});

			$("." + view_addr).html(str);
		});
	}

	var listPaging = function(){
		
		var data = jobForm.serialize();
		$.get("/skc/storePage/ajaxPaging", data, function(data){
			
			var str = '';
			
			$(data).each(function(){
				
				if(this.prev !=0)
					str += '<li><a href="'+this.prev+'">&laquo;</a></li>';
				for(var i=this.first; i<=this.last; i++){
					if(i==jobForm.find("[name='page']").val())
						str += '<li class="active"><a href="'+i+'">'+i+'</a></li>';
					else
						str += '<li><a href="'+i+'">'+i+'</a></li>';
				}
				if(this.next !=0)
					str += '<li><a href="'+this.next+'">&raquo;</a></li>';
			});
			
			$(".pagination").html(str);
		});
	}

	var getMenuOption = function(view_addr) {

		var data = jobForm.serialize();
		$.get("/skc/storePage/ajaxMenu", data, function(data) {

			var op = '';

			op += '<select name="menu_name">';

			$(data).each(function() {
				
				op += '<option value="'+this.menu_name+'">'+ this.menu_name + '</option>';

			});

			op += '</select>';
			op += '<input type="text" name="re_grade">';

			$("." + view_addr).html(op);
			
		});
	}

	$(document).ready(function() {

		getReview("/skc/storePage/ajaxBestReview", "review-best");
		getReview("/skc/storePage/ajaxReview", "review-norm");
		listPaging();

		getMenuOption("menu_option");
	});

	$(".box-footer").on("click", "li a", function(event) {

		event.preventDefault();
		
		var targetPageNum = $(this).attr("href");

		jobForm.find("[name='page']").val(targetPageNum);

		getReview("/skc/storePage/ajaxBestReview", "review-best");
		getReview("/skc/storePage/ajaxReview", "review-norm");
		listPaging();
	});

	$("#writeReview").click(function() {

		$('.modal').modal("show");
	});

	$("#plus_menu").click(function() {

		getMenuOption("menu_option");
	});

	$("#saveBtn").click(function() {

		var data = $("#upForm").serialize();

		$.post("/skc/storePage/insertReview", data, function(data) {

			console.log(data);
		});

	});
</script>

</html>