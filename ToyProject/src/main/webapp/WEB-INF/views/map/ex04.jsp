<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	#main{
		display: flex;
		
	}
	#main > table{
		width : 384px;
		margin: 0px 16px;
	}
</style>
</head>
<body class="wide">
	<!-- ex04.jsp -->
	
	<h1>Map<small>즐겨찾기</small></h1>
	
	<div id="main">
		<div id="map" style="width:768px;height:400px;"></div>
		<div>
		
		<table>
			<tr>
				<td>
					<select name="category" id="category">
						<option value="default">basic</option>
						<option value="cafe">cafe</option>
						<option value="food">restaurant</option>
						<option value="private">private</option>
					</select>
					<input type="text" name="name" id="name" class="middle">
					<input type="button" name="add" id="btn">
				</td>
			</tr>
			<tr>
				<td>AAA</td>
			</tr>
			<tr>
				<td>AAA</td>
			</tr>
		</table>
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
		
		let m = null;
		let lat = null;
		let lng = null;
		
		//클릭 이벤트 + 원하느 장소에 마커 추가하기 (DB작업)XXXX
		kakao.maps.event.addListener(map, 'click', function(evt)(){
			lat = evt.latLng.getLat();
			lng = evt.latLng,getLng();
			
			if(m != null){
				//기존 마커 제거
				m.setMap(null);
			}
			const m = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat, lng);
			});
			m.setMao(map);
			$('#name').select();
			
			
			//추가하기
			$('#btn').click(function(){
				$.ajax({
					type: 'POST',
					url: '/toy/map/addplace.do',
					data: {
						lat: lat,
						lng: lng,
						name: $('#name').val(),
						category: $('#category').val()
					},
					dataType: 'json',
					success: function(result){
						if(result.result == 1){
							$('#category').val('default');
							$('#name').val('');
							$('#name').select();
						}
					},
					error: function(a,b,c){
						console.log(a,b,c);
					}
				})
			});
		}
	</script>
</body>
</html>


