<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = application.getRealPath("/pic");
	int size = 1024 * 1024 * 100;
	
	try {
		MultipartRequest multi = new MultipartRequest(request,
													  path,
													  size,
													  "UTF-8",
													  new DefaultFileRenamePolicy());
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("ex18.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		function deleteImage(filename) {
			/* alert(filename); */
			
			if(confirm('delete?')){
				location.href = 'ex18_del.jsp?filename=' + filename;			
			}
		}
	</script>
</body>
</html>