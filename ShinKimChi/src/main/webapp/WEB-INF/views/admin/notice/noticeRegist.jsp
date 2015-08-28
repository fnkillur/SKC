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

<form id="jobForm" method="post">
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
			<label class="col-sm-2 col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input class="modi form-control" name="no_title" type="text" required>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea class="modi form-control" name="no_content" rows="5" required></textarea>
			</div>
		</div>
		
		<div class="col-sm-3 col-sm-3 pull-right">
			<br>
			<button type="button" id="listBtn" class="btn btn-theme">목록</button>
			<button type="button" id="checkBtn" class="btn btn-theme02">등록</button>
		</div>
	</section>	
</div>
</form>
<%@include file="../../include/footer.jsp"%>

<script type="text/javascript" src="/resources/bootstrap/js/jquery-1.11.3.js"></script>
<script>

	
	var jobForm = $("#jobForm");
	
	$("#listBtn").click(function(){
		
		self.location="/admin/skc/notice/list";
		
	});
	
	$("#checkBtn").click(function(){
		
		jobForm.submit();			
	});

</script>

</body>
</html>