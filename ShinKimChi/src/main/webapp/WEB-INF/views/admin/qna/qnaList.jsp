<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hideDiv{
		display: none;
	}
</style>
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
			
		</div>
	</div>
	</section>
</div>
<div class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
		<form id="upForm">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Admin(관리자)</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="up_no" value="">
				<p><textarea name="qna_content" class="form-control" col="15" row="5"></textarea></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"
					data-dismiss="modal">Close</button>
				<button type="button" id="saveBtn" class="btn btn-primary">Save changes</button>
			</div>
		</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript"
	src="\resources\bootstrap\js\jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	listView();
});

var listView = function(){
	var str = '';
	$.get("/admin/skc/qna/qnaList", function(data){
		console.log(data);
		$(data).each(function(){
			if(this.id != "admin"){
				str += '<div>&nbsp;</div>';	
				str += '<div>&nbsp;</div>';
				str += '<div class="item">';
				str += '<p class="message">';
				str += '<h4>'+this.id+'</h4>';
				str += this.qna_content;
				str += '<div class="pull-right" style="margin-right:1%;"><a href="'+this.qna_seq+'">답변하기</a>&nbsp;<i id="'+this.qna_seq+'" class="Q_del fa fa-fw fa-trash-o"></i></div></p>';
				str += '<div class="'+this.qna_seq+' hideDiv">';
				str += '</div>';
			}else{
				str += '<div class="attachment">';
				str += '<i id="'+this.qna_seq+'" class="A_del fa fa-fw fa-trash-o pull-right" style="margin-right:1%;"></i><i id="'+this.qna_seq+'" class="update fa fa-fw fa-edit pull-right" data-target=".modal" style="margin-right:1%;"></i>';
				str += '<h4>'+this.id+'</h4>';
				str += '<p class="filename">'+this.qna_content+'</p>';
				str += '</div>';
			}
		});
		str += '</div>';
		$('.box-body').html(str);
	});
};

$('.box-body').on("click", ".pull-right a", function(event){
	event.preventDefault();
	var str ='';
	var target = $(this).attr("href");
	$('.'+target).removeClass("hideDiv");
	str += '<form id="answerForm"><p class="filename" style="margin-left:4%; margin-right:1%;"><input type="hidden" name="qna_parent" value="'+target+'"><textarea name="qna_content" class="form-control"></textarea></form>';
	str += '<button class="cancel pull-right" style="margin-right:1%">취소</button><button class="submit pull-right" style="margin-right:1%">확인</button></p>';
	str += '<div>&nbsp;</div>';
	str += '<div>&nbsp;</div>';
	
	$('.'+target).html(str);
	
	$('.'+target).on("click", ".submit", function(e){
		e.preventDefault();
		var data = $('#answerForm').serialize();
		console.log($('#answerForm').find('[name="qna_content"]').val());
		if($('#answerForm').find('[name="qna_content"]').val() == null || $('#answerForm').find('[name="qna_content"]').val() == ""){
			alert("글을 작성해주세요.");
		}else{
			$.post("/admin/skc/qna/qnaInsert", data, function(data){
				listView();
			});
		}
	});
	
	$('.'+target).on("click", ".cancel", function(e){
		e.preventDefault();
		$('.'+target).addClass("hideDiv");
	});
	
});

$('.box-body').on("click", ".A_del", function(){
	console.log($(this).attr("id"));
	var targetId = $(this).attr("id");
	$.post("/admin/skc/qna/qnaDelete/"+targetId, function(data){
		listView();
	});
});

$('.box-body').on("click", ".Q_del", function(){
	console.log($(this).attr("id"));
	var targetId = $(this).attr("id");
	$.post("/admin/skc/qna/qnaParentDelete/"+targetId, function(data){
		listView();
	});
});

$('.box-body').on("click", ".update", function(){
	var targetId = $(this).attr("id");
	$.get("/admin/skc/qna/qnaRead/"+targetId,function(data){
		console.log(data);
		$("#upForm .modal-body").find("[name='up_no']").val(targetId);
		$("#upForm .modal-body").find("[name='qna_content']").val(data.qna_content);
		$('.modal').modal("show");
	});
});

$('#upForm').on("click", "#saveBtn", function(){
	
	var targetNo = $('#upForm').find('[name="up_no"]').val();
	var targetContent = $('#upForm').find('[name="qna_content"]').val();
	$.get("/admin/skc/qna/qnaUpdate/"+targetNo+"/"+targetContent, function(data){
		$('.modal').modal("hide");
		listView();
	});
});


</script>
<%@include file="../../include/footer.jsp"%>
</html>