<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="i" begin="0" end="10"><!-- i가 초기값 0부터 10까지 반복 -->
		<c:set var="sum" value="${sum+i }"/>
		${i }<br>
	</c:forEach>
	sum : ${sum }<br>
	
	<ul>
		<c:forEach var="i" begin="1" end="9">
			<li>3*${i}=${3*i}</li>
		</c:forEach>
	</ul>

	<h3>구구단 출력</h3>
	<c:forEach var="i" begin="2" end="9">
		<c:forEach var="j" begin="0" end="9">
			<c:choose>
				<c:when test="${j == 0}">
					${i }단
				</c:when>
				<c:otherwise>
					${i}*${j}=${i*j}&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<br>
	</c:forEach>
	
	<h3>JSTL forEach</h3>
	<%
		int[] arr = new int[]{10,20,30,40,50};
/* 		for(int i:arr){
			out.print("출력값 : "+i+"<br>");
		} */
		
		//문제 : EL은 자바 객체에 대한 직접적인 접근이 불가능하다..
		//해결 : 1. request, session >> setAttribute로 접근
		//모든 객체가 공유하려면 session 아니면 request
		request.setAttribute("intarr", arr);
	%>
	
	<%-- <c:set var="intarray" value="<%=arr %>"/> --%>
	
	<c:forEach var="data" items="${requestScope.intarr}">	<!-- requestScope.intarr 보통 앞에 것은 생략하지만, 쓰지 않으면 정확히 무엇에 대한 것인지 파악 불가 -->
		배열값 : ${data}<br>
	</c:forEach>
	
</body>
</html>