<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.SocarDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SocarDao"%>
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
		 font-family: 'Jua'
	}
	a:link, a:visited{
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: underline;
		color: blue;
	}
</style>
</head>
<body>
<%
	//dao 선언
	SocarDao dao = new SocarDao();
	//전체목록 가져오기
	List<SocarDto> list = dao.getAllDatas();
	//전체갯수
	int totalCount = dao.getTotalCount();
	//넘버포맷
	NumberFormat nf = NumberFormat.getCurrencyInstance();
%>
<div style="margin: 30px 30px;">
<!-- 카트폼이 아니라 카트액션으로 가야하는지? -->
<form action="" method="post">
	<h3 class="alert alert-danger" style="width: 800px;" align="center">차량목록</h3>
	<br>
	<h6><b>총 : <%=totalCount%>개의 게시글이 있습니다</b></h6>
	<table class="table table-bordered" style="width: 800px">
		<caption align="top"><h5><b>등록된 차량 목록</b></h5></caption>
		<tr class="table-light">
			<th width="50">선택</th>
			<th width="50">번호</th>
			<th width="200">차 이름</th>
			<th width="150">차 색상</th>
			<th width="100">연식</th>
			<th width="150">가격</th>
			<th>조회</th>
		</tr>
		<%
			if(totalCount==0){%>
			<tr>
				<td colspan="7" align="center">
					<h6><b>등록된 게시글이 없습니다</b></h6>
				</td>
			</tr>
			<%}else{
				for(int i=0; i<list.size(); i++){
					SocarDto dto = list.get(i);
				%>
				<tr>
					<td align="center">
						<input type="checkbox">
					</td>
					<td align="center"><%=totalCount-i%></td>
					<td>
						<a href="contentview.jsp?num=<%=dto.getNum()%>">
							<b><%=dto.getCarname()%>&nbsp;
							(<%=dto.getCompany()%>)</b>
						</a>
					</td>
					<td align="center"><%=dto.getCarcolor()%></td>
					<td align="center"><%=dto.getCaryear()%></td>
					<td><%=nf.format(dto.getCarprice())%></td>
					<td align="center"><%=dto.getReadcount()%></td>
				</tr>
				
			<%}
		}%>
	</table>
	<button type="submit" class="btn btn-outline-info">삭제</button>
	<button type="button" class="btn btn-outline-info" onclick="location.href='socarlist.jsp'">목록으로이동</button>
	</form>
</div>
</body>
</html>

