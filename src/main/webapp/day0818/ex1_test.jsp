<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(function() {
	$(.gun).click
})
</script>

<style type="text/css">
* {
	font-family: 'Jua';
	
}
</style>
</head>
<body>
<!-- HTML 주석, 소스보기에서는 보인다 -->
<%-- JSP주석 -비실행,소스보기에서도 안보인다- --%>
	<h3>JSP는 Java Server Page의 약자입니다</h3>
	<img src="../image/01.png">
<% // 자바영역 ,scriptlet이라고 부른다(지역변수)
	Date date = new Date();  
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String day = sdf.format(date);
	out.print(day); // out: 내장객체 : JspWrite,브라우저로 출력
%>
</body>
</html>