<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
	<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/css/bootstrap.css" />
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#home">SKC</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right" style="margin-top: 11px; margin-right: 20px;">
                <li><input type="text"></li>
                <li>&nbsp;&nbsp;</li>
                <li><input type="text"></li>
                <li>&nbsp;&nbsp;</li>
                <li><button>Sign In</button></li>
            </ul>
        </div>
    </div>
</nav>
</div>
<div class="jumbotron col-md-12" style="top:50px;">
	<div class="col-md-5">
  		<h1>Welcome!</h1>
  		<p>사장님의 점포를 등록하면 사용자들에게 사장님의 점포를 홍보할수있습니다.</p>
  	</div>
  	<form action="/skc/ceo/mainPage/main" method="post">
  	<div class="user col-md-3">
  			<p>ID : 
  			<input type="email" name="id" placeholder="id 입력해주세요" required="required">
  			</p>
  			<p>PW : 
  			<input type="password" name="pw" placeholder="pw 입력해주세요" required="required">
  			</p>
  			<p>Name : 
  			<input type="text" name="name" placeholder="이름 입력해주세요" required="required">
  			</p>
  			<p>Nick : 
  			<input type="text" name="nick" placeholder="닉네임 입력해주세요" required="required">
  			</p>
  			<input type="hidden" name="aut" value="2">
  			
  	</div>
  	<div class="store col-md-4">
  		<p>지역 : <input type="text" name="st_addr" value="" style="width: 50%;" readonly="readonly" required="required"></p>
  		<p>가게이름 : <input type="text" name="st_name" value="" style="width: 40%;" required="required"></p>
  		<p>가게번호 : <input type="tel" name="st_tel1" placeholder="ex)xxx-xxxx-xxxx" required="required"></p>
  		<p>운영시간 : <input type="time" name="time1" required="required" > - <input type="time" name="time2" required="required"></p>
  		<p>메뉴 : <input type="radio" name="st_type" value="중식" required="required">중식 <input type="radio" name="st_type" value="양식">양식 <input type="radio" name="st_type" value="일식">일식 <input type="radio" name="st_type" value="한식">한식</p>
  		<input type="hidden" name="st_x" value="">
  		<input type="hidden" name="st_y" value="">
  		<p class="pull-right" style="margin-right: 20%;"><button id = "subBtn">submit</button></p>
  	</div>
  	</form>
</div>
<div id="map" style="width:100%;height:540px;"></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=644dbae64161fdba65b07f4a65c961d3&libraries=services"></script>

<script>
var lat = 33.450701;
var lng = 126.570667;
if (navigator.geolocation) {
	console.log(navigator.geolocation);
    navigator.geolocation.getCurrentPosition(showPosition);
} else { 
    alert("Geolocation is not supported by this browser.");
}
function showPosition(position) {
	console.log(position);
	lat = position.coords.latitude;
	lng = position.coords.longitude;
	mapView();
}
var mapView = function(){

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
    mapOption = { 
		
        center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new daum.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다

	
	
daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    console.log(latlng.wb);
    console.log(latlng.vb);
    
    $('.store').find("[name='st_x']").val(latlng.wb);
    $('.store').find("[name='st_y']").val(latlng.vb);
    
    
    displayCenterInfo();
	var geocoder = new daum.maps.services.Geocoder();
	
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 주소 정보를 요청합니다
	    geocoder.coord2addr(coords, callback);         
	}
    function displayCenterInfo(status, result) {
		console.log(result);
	    if (status === daum.maps.services.Status.OK) {
	    	console.log(result[0].fullName);
	    	$('.store').find("[name='st_addr']").val(result[0].fullName);
	    }    
	}
    
});

}

</script>
</body>
<%@include file="../../include/ceofooter.jsp" %>
</html>