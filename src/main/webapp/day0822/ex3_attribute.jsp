<%@page import="data.dto.StudentDto"%>
<%@page import="java.util.Vector"%>
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
	<h3>request에 Vector 저장 후 불러오기 연습</h3>
	
<%
	Vector<StudentDto> list = new Vector<>();
	list.add(new StudentDto("이영자","강남구",89));
	list.add(new StudentDto("홍길동","영등포구",67));
	list.add(new StudentDto("김진","제주도",100));
	list.add(new StudentDto("이효리","부산시",70));
	
	//데이터 Vector를 rquest에 저장 
	request.setAttribute("list",list); // 다른페이지에서 불러올 경우 보통 사용한다
	
	//페이지 이동하는 두가지 방법
	//1 .forward  : url주소 안바뀜, request,response등이 그대로 전달됨
	//2. redirect : url주소 바뀜, request,response등이 새로 생성된다
	
	//jsp에서 redirect하는 방법
	response.sendRedirect("ex4_redirect.jsp"); // url 주소 바뀜
%>
</body>
</html>

