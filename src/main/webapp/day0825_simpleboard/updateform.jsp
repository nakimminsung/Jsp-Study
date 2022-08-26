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
</style>
</head>

<%
String num = request.getParameter("num");

SimpleBoardDao dao = new SimpleBoardDao();

SimpleBoardDto dto = dao.getContent(num);
%>


<body>
<div style="margin: 30px 30px; width: 400px;" >
	<form action="updateaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<table class="table table-bordered">
			<caption align="top"><h5><b><i class='far fa-file-alt' style='font-size:24px'></i>
			수정하기</b></h5></caption>
			<tr>
				<th width="100" class="table-secondary">작 성 자</th>
				<td>
					<input type="text" name="writer" class="form-control" required="required" value="<%=dto.getWriter()%>"
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">제 목</th>
				<td>
					<input type="text" name="subject" class="form-control form-control-sm" required="required" value="<%=dto.getSubject()%>"
					autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for = "comment">Comments:</label>
					<textarea class="form-control" id="comment" name="content"
					required="required" style="width: 100%; height: 100px;"><%=dto.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success" style="margin-left: 30px;">수정하기</button>
					
					<button type="button" class="btn btn-info" style="margin-left: 30px; "
					onclick="location.href='contentview.jsp?num=<%=dto.getNum()%>">글내용</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

