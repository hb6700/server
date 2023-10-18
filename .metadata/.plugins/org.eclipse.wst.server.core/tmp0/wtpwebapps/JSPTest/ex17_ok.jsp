<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = application.getRealPath("/files");

	int size = 1024*1024*100;
	
	ArrayList<String> filename = new ArrayList<String>();
	ArrayList<String> orgfilename = new ArrayList<String>();
	
	try{
		MultipartRequest multi = new MultipartRequest(request,
													  path,
													  size,
													  "UTF-8",
													  new DefaultFileRenamePolicy());
		//다중파일명 -> 컬렉션
		filename.add(multi.getFilesystemName("attach1"));
		filename.add(multi.getFilesystemName("attach2"));
		filename.add(multi.getFilesystemName("attach3"));
		
		//
		orgfilename.add(multi.getOriginalFileName("attach1"));
		orgfilename.add(multi.getOriginalFileName("attach2"));
		orgfilename.add(multi.getOriginalFileName("attach3"));
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex17_ok.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>DOWNLOAD</h1>
	<% for(int i=0; i<3 ; i++){ %>
	<div>
		<a href="download.jsp?filename=<%= filename.get(i) %>&orgfilename=<%= orgfilename.get(i) %>"><%= orgfilename.get(i) %></a>
	</div>
	<% } %>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>