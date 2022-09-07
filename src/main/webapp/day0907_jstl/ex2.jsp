<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   

 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
</style>
</head>
<body>
	<!-- 한글 엔코딩 -->
	<fmt:requestEncoding value="utf-8"/>
	<form action="ex2.jsp" method="post" style="width: 200px;">
		<h3>이름을 입력하세요</h3>
		<input type="text" name="irum" class="form-control">
		<h3>가고싶은 나라를 입력하세요</h3>
			<input type="text" name="nara" class="form-control">
		<br>
		<button type="submit" class="btn btn-info">결과 확인</button>
		</form>
		
	<!-- pram = parameta를 줄인 것 
		이름을 입력시에만 결과를 나오도록 해보자-->
		
	<c:if test="${!empty param.irum}">
		<h3>이름 : ${param.irum}</h3>
		<h3>가고싶은 나라 : ${param.nara}</h3>
	</c:if>
	
		<%--
			조건문 choose
			<c:choose
			body content 
			(하나 이상의 <when> 과 하나 이하의 <otherwise> 서브태그)
	    	<c:when test="조건">
	        body content
	    	</c:when>
	    
	    	<c:otherwise>
	        conditional block
	    	</c:otherwise>
		</c:choose> --%>
		
	<c:choose>
		<c:when test="${param.nara=='캐나다'}">
			<h3 style="color: green;">캐나다 항공비는 200만원입니다</h3>
		</c:when>
		<c:when test="${param.nara=='하와이'}">
			<h3 style="color: orange;">하와이 항공비는 200만원입니다</h3>
		</c:when>
		<c:when test="${param.nara=='괌'}">
			<h3 style="color: magenta;">괌 항공비는 100만원입니다</h3>
		</c:when>
		<c:when test="${param.nara=='뉴욕'}">
			<h3 style="color: gary;">뉴욕 항공비는 200만원입니다</h3>
		</c:when>
		
		<c:otherwise>
			<h3 style="color: red;">${param.nara}로 가는 비행기는 없습니다</h3>
		</c:otherwise>
		
	</c:choose>
</body>
</html>

