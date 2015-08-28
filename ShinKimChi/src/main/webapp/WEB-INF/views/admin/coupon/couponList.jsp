<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../include/header.jsp"%>

<div class="content-wrapper">
	<section class="content-header">
	<h1>Coupon</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Coupon</li>
	</ol>
	</section>

	<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">목록</h3>
			<div class="pull-right">
			<form id="jobForm">
				<input type="hidden" name="cp_seq" value="${cri.cp_seq }">
				<input type="hidden" name="btnType" value="${cri.btnType }">
				<input type="hidden" name="page" value="${cri.page }">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
				<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
				<input type="radio" name="sortType" value="n" <c:out value="${cri.sortType eq 't' ? 'checked' : '' }"/>>가게명
				<input type="radio" name="sortType" value="i" <c:out value="${cri.sortType eq 'a' ? 'checked' : '' }"/>>아이디
				<input type="radio" name="sortType" value="s" <c:out value="${cri.sortType eq 's' ? 'checked' : '' }"/>>쿠폰상태
				<select name="searchType">
					<option value="n" <c:out value="${cri.searchType eq 'n'?'selected':'' }"/>>---</option>
					<option value="m" <c:out value="${cri.searchType eq 'm'?'selected':'' }"/>>가게명</option>
					<option value="i" <c:out value="${cri.searchType eq 'i'?'selected':'' }"/>>아이디</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
				<button id="searchBtn" class="btn btn-theme">검색</button>
			</form>
			</div>
		</div>
		<!-- /.box-header -->

		<div class="box-body">
			<table class="table table-bordered">
				<tr>
					<th style="width: 120px">고객아이디</th>
					<th style="width: 120px">가게명</th>
					<th style="width: 120px">가게 전화번호</th>
					<th>쿠폰번호</th>
					<th style="width: 120px">발행일</th>
					<th style="width: 120px">만료일</th>
					<th style="width: 160px">쿠폰상태</th>					
				</tr>

				<tbody class="tbody">

				</tbody>

			</table>
		</div>
		<!-- /.box-body -->
		<div class="box-footer clearfix">
			<ul class="pagination pagination-sm no-margin pull-right">
				
			</ul>
		</div>
	</div>
	<!-- /.box --> </section>
</div>

<%@include file="../../include/footer.jsp"%>

<script type="text/javascript" src="/resources/bootstrap/js/jquery-1.11.3.js"></script>
<script>
	
	var jobForm = $("#jobForm");
	
	var listView = function(){
		
		var data = jobForm.serialize();
		$.get("/admin/skc/coupon/ajaxList", data, function(data){
			
			var str = '';
			
			$(data).each(function(){
				str += '<tr>';
				str += '<td>'+this.id+'</td>';
				str += '<td>'+this.st_name+'</td>';
				str += '<td>'+this.st_tel+'</td>';
				str += '<td>'+this.cp_num+'</td>';
				str += '<td>'+this.cp_startdate+'</td>';
				str += '<td>'+this.cp_enddate+'</td>';
				if(this.cp_state == 0){
					str += '<td  id="'+this.cp_seq+'"><button id="okBtn" class="btn btn-theme">만료</button>';
					str += '	<button id="delBtn" class="btn btn-theme">삭제</button></td>'
				} else if(this.cp_state == 1){
					str += '<td  id="'+this.cp_seq+'">';
					str += '<button id="delBtn" class="btn btn-theme">삭제</button></td>'
				}	
				str += '</tr>'
			});
			
			$(".tbody").html(str);
		});
	}
	
	var listPaging = function(){
		var data = jobForm.serialize();
		$.get("/admin/skc/coupon/ajaxPaging", data, function(data){
			
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
	
	$(document).ready(function(){
		
		listView();
		listPaging();
	});
	
	$(".box-footer").on("click", "li a",function(event){
		
		event.preventDefault();
		var targetPageNum = $(this).attr("href");
		
		jobForm.find("[name='page']").val(targetPageNum);
		listView();
		listPaging();
		
	});
	
	$("#searchBtn").click(function(){
		
		jobForm.find("input[name='page']").val(1);
		
		listView();
		listPaging();
	});
	
	$("input[name='sortType']:radio").click(function(){
		
		jobForm.find("input[name='cp_seq']").remove();
		jobForm.find("input[name='btnType']").remove();
		jobForm.find("input[name='page']").val(1);
		listView();
	});
	
	$(".tbody").on("click", "button", function(event){
		
		var cp_seq = $(this).parent().attr("id");
		var btnId = $(this).attr("id");
		
		jobForm.find("input[name='cp_seq']").val(cp_seq);
		jobForm.find("input[name='btnType']").val(btnId);
		var data = jobForm.serialize();
		
		$.post("/admin/skc/coupon/changeState", data, function(data){
			console.log(data);
		});
		
		setTimeout(listView, 400);
	});
	
</script>

</html>