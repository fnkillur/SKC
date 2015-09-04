<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../include/mainheader.jsp" %>


<div id="map" style="position: absolute; top: 80px; left: 0; width: 100%; height:840px; "></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=644dbae64161fdba65b07f4a65c961d3&libraries=services"></script>
<script>
	var x = "${lat}";
	var y = "${lng}";
	console.log(x + " : " + y);
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
 	
    console.log("map : " + map);
</script>


<%@include file="../../include/mainfooter.jsp" %>
</html>