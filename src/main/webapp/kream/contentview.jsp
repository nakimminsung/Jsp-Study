<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.KreamDto"%>
<%@page import="data.dao.KreamDao"%>
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
<%
	//num 읽기
	String num = request.getParameter("num");

	//dao 선언
	KreamDao dao = new KreamDao();
	
	//dto 가져오기
	KreamDto dto = dao.getData(num);
	
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");

%>
<body>
<div style="margin: 30px 30px;">
	<table class="table table-bordered" style="width: 600px;">
		<caption align="top"><h4>제품 상세보기</h4></caption>
		<tr>
			<td width="350" rowspan="7">
				<img src="../save/<%=dto.getPhoto()%>" width="100%;">
			</td>
		</tr>
		
		<tr>
			<td><%=dto.getCategory()%></td>
		</tr>
		<tr>
			<td><%=dto.getEsubject()%><br>
			<%=dto.getKsubject()%></td>
		</tr>
		<tr>
			<td><%=dto.getSsize()%></td>
		</tr>
		<tr>
			<td><b>가격:</b><br><%=nf.format(Integer.parseInt(dto.getResale()))%>원</td>
		</tr>
		<tr>
			<td><b>발매가격:</b><br><%=nf.format(Integer.parseInt(dto.getSale()))%>원</td>
		</tr>
		<tr>
			<td><b>등록날짜:</b><br><%=dto.getDday()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			
				<button type="button" class="btn btn-info" onclick="history.back()">이전</button>
				
				<button type="button" class="btn btn-danger">삭제</button>
				
				<button type="button" class="btn btn-success"
				onclick="location.href='updateform.jsp?num=<%=num%>'">수정</button>
			</td>
		</tr>
	</table>
</div>
</body>
<script type="text/javascript">
	$(function() {
		$(".btn-danger").click(function() {
			var c = confirm("삭제하시겠습니까?")
			if(c)
				location.href="deleteaction.jsp?num=<%=num%>";
		})
	})
	
</script>
</html>



