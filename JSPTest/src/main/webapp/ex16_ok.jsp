<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩 설정 -> 한글 지원 위해서
	request.setCharacterEncoding("UTF-8");
	
	//<form enctype="multipart/form-data">을 적용하면, 인코딩 방식이 변경
	//1. request.getParameter() 동작 불가능
	//2. request.getParameterValues() 동작 불가능
	
	//cos.jar > MultiparatRequest 클래스 -> 객체가 request의 수신 기능을 대신함
	
	//String name = request.getParameter("name");
	//String age = request.getParameter("age");
	
	//업로드된 파일을 어디에 저장할지 경로 지정 -> webapp/files -> 로컬경로(c://~~~)
	//C:\class\code\server\JSPTest\src\main\webapp\files
	
	//절대경로(상대경로) -> 로컬경로로 변환해주는 고마운 소스
	String path = application.getRealPath("/files");
	//C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
	//System.out.println(path);
	
	//업로드할 파일의 최대 크기 제한 -> 바이트 단위
	int size = 1024*1024*100;		//100MB
	
	//변수 선언
	String name = "";			//이름
	String age = "";			//나이
	String filename = "";		//첨부파일명
	String orgfilename = "";	//첨부파일명
	
	//request -> MultipartRequest -> 객체 생성
	try { 
		//MultipartRequest 객체를 만드는 순간  이미 첨부파일은 files에 복사가 이루어짐
		MultipartRequest multi = new MultipartRequest(request, 			//원래 request
													  path,				//파일 업로드 위치
													  size,				//파일 크기
													  "UTF-8",			//인코딩
													  new DefaultFileRenamePolicy()		//첨부파일 관리(중복 -> 넘버링)
													  );
		//데이터 수신
		//name = request.getParameter("name");
		name = multi.getParameter("name");			//동작O
		name = multi.getParameter("age");
		
		//업로드 파일 정보 -> 파일명
		//<input type="file" name="attach">
		filename = multi.getFilesystemName("attach"); 
		orgfilename = multi.getOriginalFileName("attach");
		
	} catch(Exception e){
		e.printStackTrace();
	}
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex16_ok.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>RESULT</h1>
	
	<div>
		name : <%= name %>
	</div>
	<div>
		age : <%= age %>
	</div>
	<div>
		filename : <%= filename %>
	</div>
	<div>
		orgfilename : <%= orgfilename %>
	</div>
	
	<h2>파일 다운로드</h2>
	<!-- 
		장점 : 간단함
		단점 : 파일 확장자에 따라 다름(다운로드 or 뷰어)
	 -->
	<div>
		<a href="/jsp//files/<%= filename %>"><%= orgfilename %></a>
	</div>
	
	<!-- 
		장점 : 간단함. 모든 파일을 무조건 다운로드 시키는 옵션
		단점 : 파일명이 다를 수 있다.(넘버링)
	 -->
	<div>
		<a href="/jsp//files/<%= filename %>" download><%= orgfilename %></a>
	</div>

	<!-- 
		장점 : 무조건 다운로드처리, 원본 파일명으로 다운로드
		단점 : 비용(download.jsp)
	 -->
	<div>
		<a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename %>"><%= orgfilename %></a>
	</div>
	
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>