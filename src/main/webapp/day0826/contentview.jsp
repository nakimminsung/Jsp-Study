<%@page import="data.dto.SocarDto"%>
<%@page import="data.dao.SocarDao"%>
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
	//num을 읽는다
	String num = request.getParameter("num");

	//dao 선언
	SocarDao dao = new SocarDao();
	
	//조회수 1증가
	dao.updateReadCount(num);
	
	//dto가져오기
	SocarDto dto = dao.getContent(num);
%>
</body>
<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><h2><b></b><%=dto.getCarname()%>(<%=dto.getCompany()%>)의 정보</h2></caption>
		<tr>
			<td>
				자동차 이름 : <%=dto.getCarname()%>
			</td>
		</tr>
		<tr>
			<td>
				자동차 가격 : <%=dto.getCarprice()%>만원
			</td>
		</tr>
		<tr>
			<td>
				연식 : <%=dto.getCaryear()%>
			</td>
		</tr>
		<td>
			제조사 : <%=dto.getCompany()%> 
			<br>
			<img src = "../testimage/<%=dto.getCompany()%>.jpeg" width="150" height="150" id="cphoto">
		</td>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-success btn-sm" style="width: 100px;"
				onclick="location.href='updateform.jsp?num=<%=num%>'">수정</button>
				
				<button type="button" class="btn btn-danger btn-sm" style="width: 100px;"
				onclick="location.href='deleteaction.jsp?num=<%=num%>'">삭제</button>
				
				<button type="button" class="btn btn-info btn-sm" style="width: 100px;"
				onclick="location.href='socarlist.jsp'">목록</button>
			</td>
		</tr>
	</table>
</div>
</html>

