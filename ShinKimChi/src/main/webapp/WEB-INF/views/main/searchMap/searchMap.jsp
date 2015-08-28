<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../include/mainheader.jsp" %>


<div id="map" style="position: absolute; top: 5%; left: 0; width: 100%; height: 90%; "></div>
<div id="centerAddr" style="position: absolute; left: 10%; top: 10%;"></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=644dbae64161fdba65b07f4a65c961d3&libraries=services"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new daum.maps.LatLng(37.6819868, 126.7646921),
        level: 2
    };
    var map = new daum.maps.Map(container, options);
    
    var markerPosition  = new daum.maps.LatLng(37.6819868, 126.7646921); 

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
 	        var infoDiv = document.getElementById('centerAddr');
 	        infoDiv.innerHTML = result[0].fullName;
 	    }    
 	}
    console.log("map : "+map);
</script>


<%@include file="../../include/mainfooter.jsp" %>
</html>