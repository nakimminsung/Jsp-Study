<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
    rel="stylesheet"
/>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
*{
 	font-family: 'Jua';
 }

</style>
</head>
<body>
	<!-- jstl에서 변수 선언은 c:set -->
	<c:set var="su1" value="7"/>
	<c:set var="su2" value="4"/>
	
	<%-- 변수 출력은 원래 <c:out/> 인데 생략 --%>
	숫자 1 : ${su1}<br>
	숫자 2 : ${su2}<br>
	
	숫자 1을 다른 방법으로 출력 : <c:out value="${su1}"/><br>
	
	
	<%--if 조건문 --%>
	<c:if test="${su1 > su2 }">
		<h2>숫자 1이 더 크네요!!!</h2>
	</c:if>
	<c:if test="${su1 < su2 }">
		<h2>숫자 2가 더 크네요!! </h2>
	</c:if>
	
	<c:set var="nara" value="프랑스"/>
	<c:if test="${nara == '하와이' }"> <!-- 문자비교도 == 으로 비교 -->
		<h2 style="color:red;">하와이는 해변이 아름다워요!!</h2>
	</c:if>
	
	<c:if test="${nara == '프랑스' }"> <!-- 문자비교도 == 으로 비교 -->
		<h2 style="color:green;">프랑스는 에펠탑이 아름다워요!!</h2>
	</c:if>
	
	<%-- 산술연산문 --%>
	<h2>JSTL 에서의 산술 연산</h2>
	더하기 : ${su1+su2 }<br>
	빼기: ${su1 - su2 }<br>	
	곱하기: ${su1 * su2 }<br>	
	나누기: ${su1 / su2 }<br>
	나누기2: ${su1 div su2 }<br>
	나머지: ${su1 % su2 }<br>
	나머지2: ${su1 mod su2 }<br>
	
	<hr>
	
	<%-- fmt태그들 --%>
	<h2>각종 fmt 태그들</h2>
	<c:set var="money" value="5678900"/>
	<c:set var="num" value="0.012345678"/>
	<c:set var="today" value="<%=new Date() %>"/> <!-- 자바변수를 jstl 변수로 변환시 -->
	<h3>급여 : ${money }</h3>
	<h3>오늘 날짜: ${today }</h3>
	
	<h3>숫자를(money, num) 각종 양식으로 출력</h3>
	<!-- *100 퍼센트로 출력, 소숫점 이하 2자리로 출력 -->
	<fmt:formatNumber value="${num }" type="percent" maxFractionDigits="2"/><br> 
	
	<!-- 현재 화폐단위로 출력, 3자리마다 컴마 -->
	<fmt:formatNumber value="${money }"  type="currency"/><br>
	<!-- 3자리마다 컴마 -->
	<fmt:formatNumber value="${money }"  type="number"/><br>
	
	<h3>날짜를 각종 양식으로 출력</h3>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/><br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/><br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a hh:mm"/><br> <!-- 2022-09-07 오후 03:13 -->
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd EEE"/><br> <!-- 2022-09-07 수 -->
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd EEEE"/><br> <!-- 2022-09-07 수요일 -->
</body>
</html>