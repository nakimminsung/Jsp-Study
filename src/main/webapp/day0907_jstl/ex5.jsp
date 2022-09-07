<%@page import="data.dto.MyShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MyShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
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
	MyShopDao dao = new MyShopDao();
	List<MyShopDto> list = dao.getAllSangpums();
	request.setAttribute("list", list);
%>
<div style="margin: 30px 30px;">
	<table class="table table-bordered" style="width: 900px;">
		<tr class="table-info">
			<th width="50">번호</th>
			<th width="300">상품명</th>
			<th width="60">색상</th>
			<th width="100">가격</th>
			<th width="150">입고일</th>
			<th>등록일</th>
		</tr>
		
		<c:forEach var="dto" items="${list}" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>
					<img src="../image2/${dto.photo}.jpg" width="60" class="img-thumnail">
					<b>${dto.sangpum}</b>
				</td>
				<td style="background-color: ${dto.color}">
					<b>${dto.color}</b>
				</td>
				<td align="right">
					<fmt:formatNumber value="${dto.price}" type="number"/>
					<br>
					<c:if test="${dto.price > 100000}">
						<b>고가제품</b>
					</c:if>
					
					<c:if test="${dto.price < 50000}">
						<b>저가제품</b>
					</c:if>
				</td>
				<td align="center">
					${dto.ipgoday}
				</td>
				<td>
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd a hh:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>

