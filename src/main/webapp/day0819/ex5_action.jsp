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
<%
	//폼이 get방식일 경우 톰캣 8이후 한글 엔코딩을 안해도된다
	String irum = request.getParameter("irum");  //fortag 안의 이름이여야한다
	//checkbox는 체크하면 value가 없을때 on을, 체크안하면 무조건 null
	String driver = request.getParameter("driver");
%>
<h3>폼으로부터 읽은 값</h3>
<h3>이름 : <%=irum%></h3>
<h3>운전면허 : <%=driver==null?"없음":"있음"%></h3>
</body>
</html>

