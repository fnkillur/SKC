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
	<h1>Notice</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Notice</li>
	</ol>
	</section>

	<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">목록</h3>
			<div class="pull-right">
			<form id="jobForm">
				<input type="hidden" name="no_seq" value="${cri.no_seq }">
				<input type="hidden" name="page" value="${cri.page }">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
				<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
				<select name="searchType">
					<option value="n" <c:out value="${cri.searchType eq 'n'?'selected':'' }" />>---</option>
					<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }" />>제목</option>
					<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':'' }" />>내용</option>
					<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':'' }" />>제목+내용</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
				<button id="searchBtn" class="btn btn-theme">검색</button>
			</form>
			</div>
		</div>
		<!-- /.box-header -->

		<div class="box-body">
			<table class="table table-bordered table-hover">
				<tr>
					<th style="width: 40px"># </th>
					<th>제목</th>
					<th style="width: 80px">조회수</th>
				</tr>

				<tbody class="tbody">

				</tbody>

			</table>
		</div>
		<!-- /.box-body -->
		<div class="box-footer clearfix">
			<button type="button" id="writeBtn" class="btn btn-theme">글쓰기</button>
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
		$.get("/admin/skc/notice/ajaxList", data, function(data){
			
			var str = '';
			
			$(data).each(function(){
				str += '<tr id="'+this.no_seq+'">';
				str += '<td>'+this.no_seq+'</td>';
				str += '<td>'+this.no_title+'</td>';
				str += '<td>'+this.no_viewcnt+'</td>';
				str += '</tr>'
			});
			
			$(".tbody").html(str);
		});
	}
	
	var listPaging = function(){
		var data = jobForm.serialize();
		$.get("/admin/skc/notice/ajaxPaging", data, function(data){
			
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
		$("td").css("cursor","pointer");
		
	});
	
	$("#writeBtn").click(function(event){
		
		self.location="/admin/skc/notice/regist";
	});
	
	$(".tbody").on("click",	"tr", function(event){

			var targetId = $(this).attr("id");
			jobForm.find("input[name='no_seq']").val(targetId);
			jobForm.attr("action", "/admin/skc/notice/read").attr("method", "get");
			jobForm.submit();
	});
	
	$(".box-footer").on("click", "li a", function(event){
		
		event.preventDefault();
		var targetPageNum = $(this).attr("href");
		
		jobForm.find("[name='page']").val(targetPageNum);
		listView();
		listPaging();
		
	});
	
	$("#searchBtn").click(function(){
		
		jobForm.find("input[name='no_seq']").remove();
		jobForm.find("input[name='page']").val(1);
		listView();
	});
	
</script>
</html>