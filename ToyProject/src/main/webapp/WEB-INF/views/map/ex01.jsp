<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	
</style>
</head>
<body>
	<!-- ex01.jsp -->
	<h1>Map<small>기본지도</small></h1>
	
	<div id="map" style="width:768px;height:400px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad162e5a826d7a37a21c4f3b4e10c85d"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	
	<script>
		//지도를 담을 영역의 DOM 레퍼런스
		const container = document.getElementById('map'); 
		
		//지도를 생성할 때 필요한 기본 옵션
		const options = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		//지도 생성 및 객체 리턴
		const map = new kakao.maps.Map(container, options); 
	</script>
</body>
</html>






