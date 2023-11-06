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
	<!-- ex02.jsp -->
	<h1>Map<small>기본지도</small></h1>
	
	<div>	
		<div id="map" style="width:768px;height:400px;"></div>
	</div>
	
	<hr>
	
	<div>
		<div>
			<input type="button" value="종각역으로 이동하기" id="btn1">
			<input type="button" value="역삼역으로 이동하기" id="btn2">
			<input type="button" value="잠실역으로 이동하기" id="btn3">
		</div>
		<div>
			<input type="button" value="확대" id="btn4">
			<input type="button" value="축소" id="btn5">
		</div>
		<div>
			<input type="button" value="이동 제어" id="btn6">
			<input type="button" value="확대축소 제어" id="btn7">
		</div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad162e5a826d7a37a21c4f3b4e10c85d"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	
	<script>
		//지도를 담을 영역의 DOM 레퍼런스
		const container = document.getElementById('map'); 
		
		//지도를 생성할 때 필요한 기본 옵션
		const options = { 
			center: new kakao.maps.LatLng(37.499350, 127.033196), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		//지도 생성 및 객체 리턴
		const map = new kakao.maps.Map(container, options); 
		
		//종각역(37.570183, 126.983011) 
		$('#btn1').click(function(){
			const p1 = new kakao.maps.LatLng(37.570183, 126.983011);
			map.setCenter(p1);
		});
		//역삼역(37.500795, 127.036873)
		$('#btn2').click(function(){
			const p2 = new kakao.maps.LatLng(37.500795, 127.036873);
			//map.setCenter(p2);		//순간이동 
			map.panTo(p2);				//스크롤 이동 
		});		
		//잠실역(37.513271, 127.100002)
		$('#btn3').click(function(){
			const p3 = new kakao.maps.LatLng(37.513271, 127.100002);
			map.setCenter(p3);
		});		

		
		//확대 
		$('#btn4').click(function(){
			//map.setLevel(1);
			map.setLevel(map.getLevel() - 1);
		});		
		//축소 
		$('#btn5').click(function(){
			//map.setLevel(14);
			map.setLevel(map.getLevel() + 1);
		});		
		
		
		
		//토글 버튼(드래그 on/off)
		map.setDraggable(false);			//지도(이미지) 드래그 노노링 
		$('#btn6').click(function(){
			if(map.getDraggable()){
				map.setDraggable(false);
				$(this).css('background-color', '#EFEFEF');
			}else{
				map.setDraggable(true);
				$(this).css('background-color', 'gold');
			}
		});		
		
		
		//토글버튼(ON/OFF)
		map.setZoomable(false);
		$('#btn7').click(function(){
			if(map.getZoomable()){
				map.setZoomable(false);
				$(this).css('background-color', '#EFEFEF');
			}else{
				map.setZoomable(true);
				$(this).css('background-color', 'gold');
			}
		});		
		
		
	</script>
</body>
</html>






