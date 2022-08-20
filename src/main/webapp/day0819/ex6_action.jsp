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
	//post방식은 읽기전에 엔코딩 한줄 무조건 추가
	request.setCharacterEncoding("UTF-8");
	String irum=request.getParameter("irum");
	String birth=request.getParameter("birth");
	//체크박스가 여러개인경우 select가 muliple인 경우는
	//getParameterValues로 읽는다(반환타입이 String [])
	
	//이때 선택하지 않으면 null이되며, 선택하면 배열로 값이 넘어온다 
	String []hobby=request.getParameterValues("hobby");

%>
<h3 class="alert alert-info">Ex6 폼태그로부터 읽은 값</h3>

	이 름 : <%=irum%><br>
	생년월일 : <%=birth %><br>
	취 미 :
		<%if(hobby==null){%>
			<b style="color: red">취미없음</b>
		<%}else{
			for(String h:hobby){%>
				[<%=h %>]&nbsp;
			<%}
		}%> 

</body>
</html>

