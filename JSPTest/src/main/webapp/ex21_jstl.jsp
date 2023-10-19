<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex21_jstl.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>JSTL</h1>
	<h2>변수 선언</h2>
	<%
		int a = 10;
		pageContext.setAttribute("b", 20);		//내장객체 변수
	%>
	<!-- 접두어 네임스페이스??? -->
	<c:set var="c" value="30" />			<!-- JSTL변수 -->
	
	<div>a : <%= a %></div>
	<div>a : ${a}</div>
	
	<div>b : <%= pageContext.getAttribute("b") %></div>
	<div>b : ${b}</div>
	
	<%-- <div>c : <%= c %></div> --%>
	<div>c : ${c}</div>
	<div>c : ${pageContext.getAttribute("c")}</div>
	
	<h2>변수 수정하기(값 바꾸기)</h2>
	<c:set var="c" value="300" />
	<div>c : ${c}</div>
	
	<h2>변수 삭제하기(Map의 요소 삭제)</h2>
	<c:remove var="c" />
	<div>c : ${c}</div>
	<div>c : ${empty c}</div>
	
	<h2>조건문</h2>
	<c:set var="num" value="10" />
	<div>num : ${num}</div>
	<c:if test="${num > 0}">
		<!-- 조건이 참일시 실행 문 -->
		<div>${num}은 양수입니다.</div>
	</c:if>
	<c:if test="${num <= 0}">
		<div>${num}은 양수가 아닙니다.</div>
	</c:if>
	
	<!-- 다중조건문 -->
	<c:choose>
		<c:when test="${num>0}">양수</c:when>
		<c:when test="${num<0}">음수</c:when>
		<c:otherwise>0</c:otherwise>
	</c:choose>
	
	<h2>반복문(일반 for문 + 향상된 for문)</h2>
	<% for(int i=0; i< 10 ; i++) { %>
		<div>숫자 : <%= i %></div>
	<% } %>
	
	<c:forEach var="i"  begin="10" end="0"  step="1">
		<div>숫자 : ${i}</div>
	</c:forEach>
	
	<%
		String[] names = {"홍길동", "아무개", "하하하", "호호호", "후후후"}; 
		pageContext.setAttribute("names", names);
	%>
<%-- 	<c:set var="n" value="0" />
	<table>
		<tr>
			<th>이름</th>
			<th>index</th>
			<th>n</th>
			<th>count</th>
			<th>current</th>
			<th>first</th>
			<th>last</th>
		</tr>
		<!-- for(String name : names) -->
		<c:forEach var="name"  items="${items}"  varStatus="status">
			<tr>
				<td>${name}</td>
				<td>${status.Index}</td>
				<td>${n}</td>
				<td>${status.count}</td>
				<td>${status.current}</td>
				<td>${status.first}</td>
				<td>${status.last}</td>
			</tr>
			<c:set var="n" value="${n + 1 }" />
		</c:forEach>
	</table> --%>
	   <c:set var="n" value="0" />
   <table>
      <tr>
         <th>이름</th>
         <th>index</th>
         <th>n</th>
         <th>count</th>
         <th>current</th>
         <th>first</th>
         <th>last</th>
      </tr>
      <!-- for (String name : names) -->
      <!-- //varStatus는 보통 status라고 지정한다. 인덱스를 가져온다.-->
      <c:forEach var="name" items="${names}" varStatus="status">
      <tr>
         <td>${name}</td>
         <td>${status.index}</td>
         <td>${n}</td>
         <td>${status.count}</td>   <!-- 1부터 시작한다. -->
         <td>${status.current}</td>   <!-- 현재 가져온 아아템 값. -->
         <td>${status.first}</td>   <!-- 첫번째 인덱스인지 boolean값으로 반환한다. -->
         <td>${status.last}</td>   <!-- 마지막 인덱스인지 boolean값으로 반환한다. -->
      </tr>
      <!-- varStatus로 대체 가능하다 -->
      <c:set var="n" value="${n+1}" />     <!-- n=n+1 -->
      </c:forEach>
   </table>
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>






