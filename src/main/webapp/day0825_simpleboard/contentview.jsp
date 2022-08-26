<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SimpleBoardDto"%>
<%@page import="data.dao.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	
	span.day{
		color: #ccc;
		font-size: 0.8em;
	}
</style>
</head>
<body>
<jsp:useBean id="dao" class="data.dao.SimpleBoardDao"></jsp:useBean>
<%
	//num을 읽는다
	String num = request.getParameter("num");

	//dao 선언
	//SimpleBoardDao dao = new SimpleBoardDao(); //위에서 jsp로 선언 가능하다
	
	//조회수 1증가
	dao.updateReadCount(num);
	
	//dto 가져오기
	SimpleBoardDto dto = dao.getContent(num);
	
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><h2><b><%=dto.getSubject()%></b></h2></caption>
		<tr>
			<td>
				<b>작성자:<%=dto.getWriter()%></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday())%>
				&nbsp;&nbsp;조회 <%=dto.getReadcount()%></span>
			</td>
		</tr>
		<tr height="150">
			<td>
				<!-- 여러줄을 입력했어도 출력시 한줄로 나온다 
				해결방법
					1. pre태그 안에 쓴다
					2. db저장시 br 태그가 \으로 저장되므로, 다시 출력시 br로 변환 시켜줘야 한다
						-> replace 명령어를 사용-->
				<%=dto.getContent().replace("\n", "<br>")%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-primary btn-sm" style="width: 100px"
				onclick="location.href='boardform.jsp'"><i class='fas fa-pen' style='font-size:15px'></i>글쓰기</button>
				
				<button type="button" class="btn btn-success btn-sm" style="width: 100px;"
				onclick="location.href='updatepassform.jsp?num=<%=num%>'">
				<i class='far fa-edit' style='font-size:15px'></i>수정</button>
				
				<button type="button" class="btn btn-danger btn-sm" style="width: 100px;"
				onclick="location.href='deletepassform.jsp?num=<%=num%>'">
				<i class='far fa-trash-alt' style='font-size:15px'></i>삭제</button>
				
				<button type="button" class="btn btn-info btn-sm" style="width: 100px;"
				onclick="location.href='boardlist.jsp'">
				<i class='fas fa-th-list' style='font-size:15px'></i>목록</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>

