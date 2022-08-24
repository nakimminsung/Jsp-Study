<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MyShopDao"%>
<%@page import="data.dto.MyShopDto"%>
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
	.box{
		width: 30px; height: 30px;
		border: 1px solid black;
		border-radius: 100px;
		box-shadow:5px 5px 5px #ccc;
		display: inline-block;
	}
	
</style>
</head>
<body>
<%
//num을 읽는다
String num = request.getParameter("num");
//dao 선언한다
MyShopDao dao = new MyShopDao();
//num에 해당하는 dto 얻기
MyShopDto dto = dao.getSangpum(num);

NumberFormat nf = NumberFormat.getCurrencyInstance();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<div style="margin: 30px 30px">
	<table class="table table-bordered" style="width: 600px">
		<caption align="top"><h4>상품상세보기</h4></caption>
			<tr>
				<td width="350" rowspan="5">
					<img src="../image2/<%=dto.getPhoto()%>.jpg" width="100%">
				</td>
				<td>상품명: <%=dto.getSangpum()%></td>
			</tr>
			
			<tr>
				<td>
					색상:
					<b><%=dto.getColor()%></b>
					<div align="center" class="box" style="background-color:<%=dto.getColor()%>"></div>
				</td>
			</tr>
			
			<tr>
				<td>가격: <%=nf.format(dto.getPrice())%></td>
			</tr>
			
			<tr>
				<td>입고일: <%=dto.getIpgoday()%></td>
			</tr>
			
			<tr>
				<td>
					등록일: <%=sdf.format(dto.getWriteday())%>
				</td>
						   
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-info"
					onclick="history.back()">이전으로</button>
				</td>
			</tr>
	</table>
</div>

</body>
</html>

