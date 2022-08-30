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
<script type="text/javascript">
check();
 function check() {
	console.log(1);
	var len=$("input[name='chk']:checked").val();
	if(len<1){
		alert("체크된 항목이 없습니다");
		return false;
	}
}
 
 /* console.log($("#caryear").val()); */
</script>
</head>
<body>
<%

//엔코딩
request.setCharacterEncoding("utf-8");
//데이터 읽기

List<SocarDto> list = dao.getAllDatas();

String []chk = request.getParameterValues("chk");


SocarDao dao = new SocarDao();


%>
<div style="margin: 30px 30px;">

<form action="deleteaction.jsp" method="post" onsubmit="return check()">
	<h3 class="alert alert-danger" style="width: 800px;" align="center">차량목록</h3>
	<br>
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
		<%-- <%
			if(totalCount==0){%>
			<tr>
				<td colspan="7" align="center">
					<h6><b>등록된 게시글이 없습니다</b></h6>
				</td>
			</tr>
			<%}else{
				for(int i=0; i<list.size(); i++){%>
				<tr>
					<td align="center">
						<input type="checkbox" name="chk">
					</td>
					<td>
						<a href="contentview.jsp?num=<%=dto.getNum()%>">
							<b><%=dto.getCarname()%>&nbsp;
							(<%=dto.getCompany()%>)</b>
						</a>
					</td>
					<td align="center"><%=dto.getCarcolor()%></td>
					<td align="center"><%=dto.getCaryear()%>년식</td>
					<td><%=dto.getCarprice()%>만원</td>
					<td align="center"><%=dto.getReadcount()%></td>
				</tr>
				
			<%}
		}%>
 --%>	</table>
	<button type="submit" class="btn btn-outline-info">삭제</button>
	<button type="button" class="btn btn-outline-info" onclick="location.href='addform.jsp'">글쓰기</button>
	</form>
</div>
</body>
</html>

