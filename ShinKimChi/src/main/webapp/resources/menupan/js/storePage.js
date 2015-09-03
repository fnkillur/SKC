/**
 * 
 */

var jobForm = $("#jobForm");

var getMenu = function(){

	var data = jobForm.serialize();
	$.get("/skc/storePage/ajaxMenu", data, function(data){
		
		var str = '';
		
		$(data).each(function(){
			
			str += '<dt><a href="'+this.me_seq+'" class="rm-viewdetails" data-thumb="'+this.me_img+'">'+this.me_name+'</a></dt>';
			if(this.me_weight == null)
				str += '가격 : '+this.me_price+'원</dd>';
			else
				str += '<dd>중량 : '+this.me_weight+'g  /  가격 : '+this.me_price+'원</dd>';
			
		});

			$(".menu_rank").html(str);
		
	});
}

var getMenuAll = function(){

	var data = jobForm.serialize();
	$.get("/skc/storePage/ajaxMenuAll", data, function(data){
		
		var str = '';
		var cnt = 0;
			
		$(data).each(function(){
			
			cnt ++;
			str += '<dt><a href="'+this.me_seq+'" class="rm-viewdetails" data-thumb="'+this.me_img+'">'+this.me_name+'</a></dt>';
			if(this.me_weight == null)
				str += '가격 : '+this.me_price+'원</dd>';
			else
				str += '<dd>중량 : '+this.me_weight+'g  /  가격 : '+this.me_price+'원</dd>';
			
			if(cnt == 7){
				$(".menu_all").html(str);
				str = '';
			}
			
		});

			if(cnt < 7)
				$(".menu_all").html(str);
			if(cnt > 7)
				$(".menu_all2").html(str);
		
	});
}

var getStore = function(){

	var data = jobForm.serialize();
	$.get("/skc/storePage/ajaxStore", data, function(data){
		
		$(".st_name").html(data.st_name);
		$(".st_type").html(data.st_type);
		
		var str = '';
		
		str += '<p><strong>restaurant</strong><br>';
		str += data.st_intro+'<br>';
		str += data.st_addr+'<br>';
		str += '<strong>Time</strong>  '+data.st_time+'<br>';
		str += '<strong>Phone</strong>  '+data.st_tel+'</p>';
		
		$(".rm-info").html(str);
	});
}

$(document).ready(function() {

	getMenu();
	getMenuAll();
	getStore();
	listPaging("/skc/storePage/ajaxPagingMenu",".menupaging");
});



