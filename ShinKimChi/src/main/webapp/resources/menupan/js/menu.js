var Menu = (function() {
	
	var $container = $( '#rm-container' ),						
		$cover = $container.find( 'div.rm-cover' ),
		$middle = $container.find( 'div.rm-middle' ),
		$right = $container.find( 'div.rm-right' ),
		$open = $cover.find('a.rm-button-open'),
		$close = $right.find('span.rm-close'),
		$details = $container.find( 'a.rm-viewdetails' ),

		init = function() {

			initEvents();

		},
		initEvents = function() {

			$open.on( 'click', function( event ) {

				openMenu();
				return false;

			} );

			$close.on( 'click', function( event ) {

				closeMenu();
				return false;

			} );

			$(".rm-content").on("click", "dl a", function(event){
				
				event.preventDefault();
				$container.removeClass( 'rm-in' ).children( 'div.rm-modal' ).remove();
				viewDetails( $(this) );
				return false;

			});
			
		},
		openMenu = function() {

			$container.addClass( 'rm-open' );

		},
		closeMenu = function() {

			$container.removeClass( 'rm-open rm-nodelay rm-in' );

		},
		viewDetails = function( review ) {

			var title = review.text(),
				img = review.data( 'thumb' ),
				me_seq = review.attr('href');

			$("#jobForm").find("input[name='me_seq']").val(me_seq);
			
			var $modal = $( '<div class="rm-modal"><div class="rm-thumb" style="background-image: url(' + img + ')"></div><h5>' + title + '</h5><div style="height:80px"><br><br><button class="rm-btn" id="writeReview">리뷰 쓰기</button></div><br><tbody><div class="taeng"></div><table class="table table-hover table-bordered"></table><div><ul class="modalpaging pagination pagination-sm pull-right"></ul></div></tbody><br><span class="rm-close-modal">x</span></div>' );

			$modal.appendTo( $container );
			
			getReview();
			listPaging("/skc/storePage/ajaxPaging",".modalpaging");
			
			var h = $modal.outerHeight( true );
			$modal.css( 'margin-top', -h / 2 );

			setTimeout( function() {

				$container.addClass( 'rm-in rm-nodelay' );

				$modal.find( 'span.rm-close-modal' ).on( 'click', function() {

					$container.removeClass( 'rm-in' );

				} );
			
			}, 0 );

		};

	return { init : init };

})();

var getReview = function() {

	var data = $("#jobForm").serialize();
	$.get("/skc/storePage/ajaxReview", data, function(data) {

		var str = '';

		$(data).each(function() {

			str += '<tr>';
			str += '<td>' + this.id + '</td>';
			str += '<td>' + this.re_grade + '</td>';
			str += '</tr>';
			
			str += '<tr>';
			str += '<td colspan="2">' + this.re_content + '</td>';
			str += '</tr>';
		});
		
		if(str == '')
			str += '<div class="rm-order"><p><strong>등록된 리뷰가 없습니다!</strong><br><br>리뷰를 등록하고 쿠폰을 받아가세요!</p></div>';
		$(".table").html(str);
	});
}

var listPaging = function(control,addr){
	
	var data = jobForm.serialize();
	$.get(control, data, function(data){
		
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
		
		$(addr).html(str);
	});
}

var exitWrite = function(){
	
	$("#saveBtn").text("리뷰 쓰기");
	$("#saveBtn").attr("id", "writeReview");
	$("#rm-container").find(".review_form").remove();
}

$("#rm-container").on("click", ".modalpaging li a", function(event) {
	
	event.preventDefault();
	
	var targetPageNum = $(this).attr("href");
	
	$("#jobForm").find("[name='page']").val(targetPageNum);
	
	getReview();
	listPaging("/skc/storePage/ajaxPaging",".modalpaging");
});

$(".menupaging").on("click", "li a", function(event) {

	event.preventDefault();
	
	var targetPageNum = $(this).attr("href");
	$("#jobForm").find("[name='page']").val(targetPageNum);
	
	getMenuAll();
	listPaging("/skc/storePage/ajaxPagingMenu",".menupaging");
});

$("#rm-container").on("click", "#writeReview", function(event) {
	
	$("#writeReview").text("등록");
	$("#writeReview").attr("id", "saveBtn");
	var me_seq = $("#jobForm").find("input[name='me_seq']").val();
	var str = '';
	
	str += '<div class="review_form">';
	str += '<form id="upForm">';
	str += '<input type="hidden" name="me_seq" value="'+me_seq+'">';
	str += '<textarea style="border:0; resize: none; width:100%;" name="re_content" rows="5" cols="65"></textarea><br><br>';
	str += '<strong>점수를 0~5점 까지 입력해주세요 : </strong>';
	str += '<select style="width:15%; text-align:center;" name="re_grade>';
	
	for(var i = 6; i>0; i--){
		str += '<option value="'+i+'"><strong>'+i+'점</strong></option>';	
	}
	
	str += '</select>';
	
	str += '<button type="button" class="rm-btn" id="cancelBtn">취소</button>';
	str += '</form>';
	str += '</div><br><br>';
	
	$(".taeng").html(str);
});

$("#rm-container").on("click", "#saveBtn", function(event) {
	
	var data = $("#upForm").serialize();

	$.post("/skc/storePage/insertReview", data, function(data) {

		console.log(data);
	});
	
	setTimeout(getReview, 400);
	listPaging("/skc/storePage/ajaxPaging",".modalpaging");
	exitWrite();

});

$("#rm-container").on("click", "#cancelBtn", function(event) {

	exitWrite();
});
