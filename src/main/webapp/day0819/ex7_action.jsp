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
	div.box{
	 width: 300px; height: 300px;
	 border: 2px solid gray;
	}
</style>
</head>
<body>
<%
	//한글 엔코딩
	request.setCharacterEncoding("UTF-8");

	String fcolor = request.getParameter("fcolor");
	String doll = request.getParameter("doll");
	String food = request.getParameter("food");
	String []itlang = request.getParameterValues("itlang");
%>
<h3 class="alert alert-info">Ex7 폼태그로부터 읽는 값</h3>

<div class="box" style="color: <%=fcolor %>">
	글자색 : <%=fcolor %><br>
	
	선택한 인형 : <img src="<%=doll%>"width="100"><br>
	
	오늘 점심 : <img src="<%=food%>"width="100"><br>
	
	사용가능한 언어는?
		<%if(itlang==null){%>
			구현 가능한 언어가 없어요!
		<%}else{
			for(String a:itlang){%>
		 		<b><%=a%></b>&nbsp;
			<%};%>
			이정도 언어는 삽가능!
		<%}%>
</div>
</body>
</html>

