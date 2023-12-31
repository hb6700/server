<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	/*
	이미지뷰어	
	“ex18.jsp”			: 메인, 목록 보기(뷰어)
	“ex18_ok.jsp”		: 이미지 업로드 처리
	“ex18_del.jsp”		: 업로드한 이미지 삭제처리
	
	webapp > "pic" 폴더 생성
	
	*/
	
	//디렉토리 탐색
	String path = application.getRealPath("./pic");
	
	File dir = new File(path);
	File[] list = dir.listFiles();
	
	//System.out.println(list[0].getName());
	
	//순서 가지고 놀기
	/* 
	Arrays.sort(list, new Comparator<File>(){
		public int compare(File o1, File o2) {
			return o2.getName().compareTo(o1.getName());
		}
	}); 
	*/
	//람다식 이용
	Arrays.sort(list, (o1, o2) -> o2.getName().compareTo(o1.getName()));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex18.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	#list {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
	}
	
	#list > .item {
		position: relative;
		left:0; top:0;
		/* border: 1px solid gray; */
	}
	
	#list > .item > img {
		width:180px; height:180px;
		object-fit:contain;
		border: 1px solid gray;
		padding: 3px
	}
	
	#list > .item > div:last-child{
		position:absolute;
		right:20px; top:7px;
		font-size: 1.5rem;
		text-shadow:0px 0px 1px #846584;
		display:none;
		cursor:pointer
	}
	
	#list > .item:hover > div:last-child {
		display:block;
	}
</style>
</head>
<body>
	<h1>Image Viewer</h1>
	
	<!-- 목록보기 -->
	<div id = "list">
		<!-- 
		<div class= "item">
			<img src="pic/짱구1.jpg">
			<div>&times;</div>
		</div> 
		-->
		<% for(File file : list) { %>
		<div class= "item">
			<img src="pic/<%= file.getName() %>">
			<div title="delete" onclick="deleteImage('<%= file.getName() %>');">&times;</div>
		</div> 
		<% } %>
	</div>
	
	<!--  -->
	<form method="POST" action="ex18_ok.jsp" enctype="multipart/form-data">
		<table class="vertical">
			<tr>
				<th>IMAGE</th>
				<td>
					<input type="file" name="attach" required>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="image upload">
		</div>
	</form>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>