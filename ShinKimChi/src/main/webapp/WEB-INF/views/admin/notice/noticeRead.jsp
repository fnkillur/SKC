<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="../../include/header.jsp"%>

<form id="pageForm">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
</form>

<form id="jobForm">
<div class="content-wrapper">
	<section class="content-header" >
	<h1>Notice</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Notice</li>
	</ol>
	</section>
   	
	<section class="content"> 
		<div class="form-group">
			<label class="col-sm-2 col-sm-2 control-label">글번호</label>
			<div class="col-sm-10">
				<input class="form-control" name="no_seq" type="text" value="${notice.no_seq }" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input class="modi form-control" name="no_title" type="text" value="${notice.no_title }" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea class="modi form-control" name="no_content" rows="5" readonly>${notice.no_content }</textarea>
			</div>
		</div>
		
		<div class="col-sm-3 col-sm-3 pull-right">
			<br>
			<button type="button" id="listBtn" class="btn btn-theme">목록</button>
			<button type="button" id="modBtn" class="btn btn-theme02">수정</button>
			<button type="button" id="delBtn" class="btn btn-theme03">삭제</button>
		</div>
	</section>	
</div>
</form>

<%@include file="../../include/footer.jsp"%>

<script type="text/javascript" src="/resources/bootstrap/js/jquery-1.11.3.js"></script>
<script>

	
	var jobForm = $("#jobForm");
	var pageForm = $("#pageForm");
	
	$("#listBtn").click(function(){
		
		pageForm.attr("action", "/admin/skc/notice/list").attr("method", "get");
		pageForm.submit();
		
	});
	
	$(".col-sm-3").on("click","#delBtn",function(){
		
		var data = jobForm.serialize();
		$.post("/admin/skc/notice/delete", data, function(data){	
			console.log(data);
		});
		
		pageForm.attr("action", "/admin/skc/notice/list").attr("method", "get");
		pageForm.submit();
	});
	
	$(".col-sm-3").on("click","#modBtn",function(e){
		
		$(".modi").removeAttr("readonly");
		$(this).text("확인");	
		$(this).attr("id", "checkBtn");
		$("#delBtn").text("취소");
		$("#delBtn").attr("id", "cancelBtn")
		
	});
	
	$(".col-sm-3").on("click","#checkBtn",function(e){
		
		var data = jobForm.serialize();
		$.post("/admin/skc/notice/modify", data, function(data){
			$(".form-group")
				.find("input[name='no_seq']").val(data.no_seq)
				.find("input[name='no_title']").val(data.no_title)
				.find("input[name='no_content']").val(data.no_content);
		});
		
		$(".modi").attr("readonly", "readonly");
		$("#cancelBtn").text("삭제");
		$("#cancelBtn").attr("id", "delBtn");
		$(this).text("수정");
		$(this).attr("id", "modBtn");
	});
	
	$(".col-sm-3").on("click","#cancelBtn",function(e){
		$(".modi").attr("readonly", "readonly");
		$(this).text("삭제");
		$(this).attr("id", "delBtn");
		$("#checkBtn").text("수정");
		$("#checkBtn").attr("id", "modBtn");
		
	});

</script>
</body>
</html>