<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SimpleBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"> -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	a{
		text-decoration: none;
		color:black;
	}
	a:hover {
		text-decoration: underline;
		color: blue;
	}
</style>
</head>
<%
	//dao선언
	SimpleBoardDao dao = new SimpleBoardDao();
	//전체갯수
	int totalCount = dao.getTotalCount();
	//전체 데이터
	List<SimpleBoardDto> list = dao.getAllDatas();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 30px 30px; width: 750px;">
	<button type="button" class="btn btn-outline-info" onclick="location.href='boardform.jsp'" 
	style="width: 120px; margin-left: 550px;">
	<i class='far fa-edit' style='font-size:24px'></i>
	글쓰기</button>
	
	<br>
	<h6><b>총 : <%=totalCount%>개의 게시글이 있습니다</b></h6>
	<table class="table table-bordered">
		<caption align="top"><h5><b>간단 게시판</b></h5></caption>
		<tr class="table-light">
			<th width="50">번호</th>
			<th width="400">제목</th>
			<th width="100">작성자</th>
			<th width="150">작성일</th>
			<th>조회</th>
		</tr>
		<%
		if(totalCount==0){%>
			<tr>
				<td colspan="5" align="center">
					<h6><b>등록된 게시글이 없습니다</b></h6>
				</td>
			</tr>	
		<%}else{
			for(int i=0; i<list.size(); i++){
				SimpleBoardDto dto = list.get(i);
			%>
			<tr>
				<td align="center"><%=totalCount-i%></td>
				<td>
					<a href="contentview.jsp?num=<%=dto.getNum()%>" >
						<b><%=dto.getSubject()%><b>
					</a>
				</td>
				<td align="center"><%=dto.getWriter()%></td>
				
				<td align="center"><%=sdf.format(dto.getWriteday())%></td>
				
				<td><%=dto.getReadcount()%></td>
			</tr>
			<%}
		}
		%>
	</table>
</div>
</body>
</html>

