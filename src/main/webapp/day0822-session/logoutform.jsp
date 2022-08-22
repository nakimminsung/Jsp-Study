<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<button type="button" class="btn btn-danger" 
	style="margin-left: 500px" 
	onclick="location.href='logoutaction.jsp'">로그아웃</button>
	<%
	//세션에 저장된 my id를 얻어서 출력해보자
	String myid=(String)session.getAttribute("myid");
	%>
	<b style="margin-bottom: 20px"><%=myid%>님이 로그인 중입니다
	<hr>
	<img src="../image/mainpage.png" width="100%">
</body>
</html>

