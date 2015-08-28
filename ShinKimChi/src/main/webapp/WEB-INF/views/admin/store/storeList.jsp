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
	<h1>Store</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Store</li>
	</ol>
	</section>

	<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">목록</h3>
			<div class="pull-right">
			<form id="jobForm">
				<input type="hidden" name="st_tel" value="${cri.st_tel }">
				<input type="hidden" name="btnType" value="${cri.btnType }">
				<input type="hidden" name="page" value="${cri.page }">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
				<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
				<input type="radio" name="sortType" value="t" <c:out value="${cri.sortType eq 't' ? 'checked' : '' }"/>>가게종류
				<input type="radio" name="sortType" value="a" <c:out value="${cri.sortType eq 'a' ? 'checked' : '' }"/>>주소
				<input type="radio" name="sortType" value="s" <c:out value="${cri.sortType eq 's' ? 'checked' : '' }"/>>등록상태
				<select name="searchType">
					<option value="n" <c:out value="${cri.searchType eq 'n'?'selected':'' }"/>>---</option>
					<option value="m" <c:out value="${cri.searchType eq 'm'?'selected':'' }"/>>가게명</option>
					<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>전화번호</option>
					<option value="s" <c:out value="${cri.searchType eq 's'?'selected':'' }"/>>가게종류</option>
					<option value="a" <c:out value="${cri.searchType eq 'a'?'selected':'' }"/>>주소</option>
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
					<th style="width: 80px">가게종류</th>
					<th style="width: 120px">가게명</th>
					<th style="width: 100px">전화번호</th>
					<th>주소</th>
					<th style="width: 120px">운영시간</th>
					<th style="width: 80px">아이디</th>
					<th style="width: 160px">등록상태</th>					
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
		$.get("/admin/skc/store/ajaxList", data, function(data){
			
			var str = '';
			
			$(data).each(function(){
				str += '<tr>';
				str += '<td>'+this.st_type+'</td>';
				str += '<td>'+this.st_name+'</td>';
				str += '<td>'+this.st_tel+'</td>';
				str += '<td>'+this.st_addr+'</td>';
				str += '<td>'+this.st_time+'</td>';
				str += '<td>'+this.id+'</td>';
				if(this.st_state == 0){
					str += '<td  id="'+this.st_tel+'"><button id="okBtn" class="btn btn-theme">등록</button>';
					str += '	<button id="delBtn" class="btn btn-theme">삭제</button></td>'
				} else if(this.st_state == 1){
					str += '<td  id="'+this.st_tel+'"><button id="noBtn" class="btn btn-theme">보류</button>';
					str += '	<button id="delBtn" class="btn btn-theme">삭제</button></td>'
				}	
				str += '</tr>'
			});
			
			$(".tbody").html(str);
		});
	}
	
	var listPaging = function(){
		var data = jobForm.serialize();
		$.get("/admin/skc/store/ajaxPaging", data, function(data){
			
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
		
		jobForm.find("input[name='st_tel']").remove();
		jobForm.find("input[name='btnType']").remove();
		jobForm.find("input[name='page']").val(1);
		listView();
	});
	
	$(".tbody").on("click", "button", function(event){
		
		var st_tel = $(this).parent().attr("id");
		var btnId = $(this).attr("id");
		
		jobForm.find("input[name='st_tel']").val(st_tel);
		jobForm.find("input[name='btnType']").val(btnId);
		var data = jobForm.serialize();
		
		$.post("/admin/skc/store/changeState", data, function(data){
			console.log(data);
		});
		
		setTimeout(listView, 400);
	});
	
</script>

</html>