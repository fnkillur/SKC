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
	<h1>Q & A</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Q&A</li>
	</ol>
	</section>
	<section class="content">
	<div class="box box-success">
		<div class="box-header">
		<div>&nbsp;</div>
			<div class="box-tools pull-right" data-toggle="tooltip"
				title="Status">
				<div class="btn-group" data-toggle="btn-toggle">
					<button type="button" class="btn btn-default btn-sm active">
						<i class="fa fa-square text-green"></i>
					</button>
					<button type="button" class="btn btn-default btn-sm">
						<i class="fa fa-square text-red"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="box-body chat" id="chat-box">
			<!-- chat item -->
			<div class="item">
				<p class="message">
					<h4>user01</h4>
					질문있습니다.
				</p>
				<div class="attachment">
					<h4>admin:</h4>
					<p class="filename">답변입니다.</p>
				</div>
				<!-- /.attachment -->
			</div>
			<div>&nbsp;</div>
			<!-- /.item -->
			<div class="item">
				<p class="message">
					<h4>user02</h4>
					질문있습니다.
				</p>
				<div class="attachment">
					<h4>admin:</h4>
					<p class="filename">답변입니다.</p>
				</div>
				<!-- /.attachment -->
			</div>
			<div>&nbsp;</div>
			<!-- /.item -->
			<div class="item">
				<p class="message">
					<h4>user03</h4>
					질문있습니다.
				</p>
				<div class="attachment">
					<h4>admin:</h4>
					<p class="filename">답변입니다.</p>
				</div>
				<!-- /.attachment -->
			</div>
			<!-- /.item -->
		</div>
		<!-- /.chat -->
	</section>
</div>
<%@include file="../../include/footer.jsp"%>
</html>