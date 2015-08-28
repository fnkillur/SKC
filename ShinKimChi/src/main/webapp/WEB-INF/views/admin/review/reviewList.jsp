<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../include/header.jsp"%>
<div class="content-wrapper">
	<section class="content-header">
	<h1>Review</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Review</li>
	</ol>
	</section>
	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Hover Data Table</h3>
				</div>
				<div class="pull-right">
				<h5>
					<i class="fa fa-tasks"></i> Review List - Total: <span class="total"></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				</h5>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th class="col-md-1">ID</th>
								<th class="col-md-2">Tel</th>
								<th class="col-md-6">Review</th>
								<th class="col-md-1">Grade</th>
								<th class="col-md-1">State</th>
								<th class="col-xs-1"></th>
							</tr>
						</thead>
						<tbody class="tbody">
						</tbody>
					</table>
					<div class="paging pull-right">
					</div>
					
				</div>
			</div>
		</div>
	</div>
	</section>
</div>

<form id="jobForm">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
</form>

<script type="text/javascript"
	src="\resources\bootstrap\js\jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		listView();	
	});
	
	var listView = function(){
		pagingCall();
		var data = $('#jobForm').serialize();
		console.log(data);
		$.get("/admin/skc/review/reviewList", data, function(data){
			console.log("들어어어");
			var str = '';
			$(data).each(function(){
				str += '<tr>';
				str += '<th class="col-md-1">'+this.id+'</th>';
				str += '<th class="col-md-2">'+this.st_tel+'</th>';
				str += '<th class="col-md-6">'+this.re_content+'</th>';
				str += '<th class="col-md-1">'+this.re_grade+'</th>';
				if(this.re_state == 1){
					str += '<th class="col-md-1"><span>승인</span></th>';
				}else if(this.re_state == 0){
					str += '<th class="col-md-1"><span>대기</span></th>';
				}else{
					str += '<th class="col-md-1"><span>거절</span></th>';
				}
				str += '<th><span class="delete glyphicon glyphicon-trash col-xs-1" id="'+this.re_seq+'" aria-hidden="true"></span></th>'
				str += '</tr>';
			})
			$('.tbody').html(str);
		});
	};
	
	$(".tbody").on("click",".delete", function(){
		var d_no = $(this).attr("id");
		$.get("/admin/skc/review/reviewDelete/"+d_no, function(data){
			listView();
		});
	});
	
	var pagingCall = function(){
		var first;
		var last;
		var prev;
		var next;
		var data = $('#jobForm').serialize();
		$.get("/admin/skc/review/reviewPaging", data, function(data){
			console.log(data);
			first = data.first;
			last = data.last;
			prev = data.prev;
			next = data.next;
			console.log("first : " + first + " last : "+last+" prev : "+prev+" next : "+next);
			paging(first, last, prev, next);
			$('.total').html(data.totalCount);
		});
	}
	
	var paging = function(first, last, prev, next){
		var str ='';
		str += '<nav>';
		str += '<ul class="pagination pagination-sm inline">';
		if(prev != 0){
			str += '<li><a href="'+prev+'">Previous</a></li>';
		}
		for(var i=first; i<=last; i++){
			if($('#jobForm').find("[name='page']").val()==i){
				str += '<li class="active"><a href="'+i+'">'+i+'</a></li>';
			}else{
				str += '<li><a href="'+i+'">'+i+'</a></li>';
			}
		}
		if(next != 0){
			str += '<li><a href="'+next+'">Next</a></li>';
		}
		str += '</ul>';
		str += '</nav>';
		$('.paging').html(str);
	}
	
	$('.paging').on("click", "li a", function(event){
		event.preventDefault();
		console.log($(this).attr("href"));
		$('#jobForm').find("[name='page']").val($(this).attr("href"));
		listView();
		
	});
	
	
</script>
<%@include file="../../include/footer.jsp"%>
</html>