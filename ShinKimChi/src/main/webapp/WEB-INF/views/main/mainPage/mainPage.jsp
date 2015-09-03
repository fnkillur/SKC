<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../include/mainheader.jsp" %>
</head>
<div style="position: absolute; left: 20%; top: 20%; width: 60%;">
	<form id="searchForm">
		<input type="hidden" name="st_x" value="">
		<input type="hidden" name="st_y" value="">
		<input type="button" id="gpsBtn" class="form-control" style="position: absolute; left: 0; width: 15%;" value="gps">
		<input type="text" class="form-control"  style="position:absolute; left: 17%; width: 78%;" placeholder="가까운 역을 입력해주세요.">
		<button type="button" class="btn btn-default" style="position: absolute; right: 0;">검색</button>
	</form>
</div>
<div style="position: absolute; left: 25%; top: 25%; width: 50%; height: 50%;">
  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="\resources\dist\img\avatar.png" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="\resources\dist\img\avatar2.png" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="\resources\dist\img\avatar3.png" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="\resources\dist\img\avatar04.png" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

</div>
<div id="map" style="position: absolute; top: 5%; left: 0; width: 0; height: 0; "></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=644dbae64161fdba65b07f4a65c961d3&libraries=services"></script>
<script>
$('#gpsBtn').on("click", function(){
	getLocation();
});

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        alert("Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {
	$('#searchForm').find("[name='st_x']").val(position.coords.latitude);
	$('#searchForm').find("[name='st_y']").val(position.coords.longitude);
	console.log(position);
	mapPosition(position.coords.latitude, position.coords.longitude);
}
var mapPosition = function(x, y){
	
var container = document.getElementById('map');
var options = {
    center: new daum.maps.LatLng(x, y),
    level: 2
};
var map = new daum.maps.Map(container, options);

var markerPosition  = new daum.maps.LatLng(x, y); 

 // 마커를 생성합니다
	var marker = new daum.maps.Marker({
	position: markerPosition
	});
	marker.setMap(map);
	displayCenterInfo();
	var geocoder = new daum.maps.services.Geocoder();
	console.log("geocoder : "+geocoder);
	
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 주소 정보를 요청합니다
	    geocoder.coord2addr(coords, callback);         
	}
	
	function displayCenterInfo(status, result) {
		console.log(result);
	    if (status === daum.maps.services.Status.OK) {
	    	console.log(result[0].fullName);
	        $('#gpsBtn').val(result[0].fullName);
	    }    
	}
}
</script>


<%@include file="../../include/mainfooter.jsp" %>
</html>