<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.KreamDto"%>
<%@page import="data.dao.KreamDao"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	
	.shotitem_img img{
		width: 200px;
		border-radius: 100px;
		margin: 30px;
		margin-top: 50px;
	}
	.shotitem {
		margin-left: 200px;
	}
	
	.product_img img{
		width: 250px;
		background-color: #b6dee7;
		border-radius: 30px;
		
	}
	.info_box{
		width: 250px;
	}
	
    .product_title{
    	margin-top: 50px;
    	margin-left: 100px;
    }
    .product_list{
    	margin-left: 150px;
    }
    
    a:link, a:visited{
		text-decoration: none;
		color: black;
	}
	
	a:hover {
		text-decoration: underline;
	}
</style>
</head>
<%
	//num 읽기
	String num = request.getParameter("num");

	//dao선언
	KreamDao dao = new KreamDao();
	
	//num에 해당하는 dto 얻기
	//KreamDto dto = dao.getData(num);
	
	//
	List<KreamDto> list = dao.getAllDatas();
	
	//넘버포맷, 심플데이트 포맷
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
	
	List<KreamDto> categoryList = dao.getAllCategory();

%>
<body>
<div class="main_inner">
	<div class="input-group">
		<h2 style="margin: 30px 30px;">KREAM</h2>
		<button type="button" style="width: 100px; height: 30px;margin: 30px 30px; float: left;"
		class="btn btn-outline-primary" onclick="location.href='addform.jsp'">
		글쓰기</button>
		
		<button type="button" style="width: 100px; height: 30px;margin: 30px 30px; float: left;"
		class="btn btn-outline-primary" onclick="location.href='../kreamajax/KreamAllList.html'">
		전체 목록</button>
	</div>
</div>

<div class="main_home">
	<div class="main_vanner">
		<div id="demo" class="carousel slide" data-bs-ride="carousel">

		 <!-- Indicators/dots -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		  </div>
	  
		  <!-- The slideshow/carousel -->
		  <div class="carousel-inner" style="border: 1px solid black;">
			    <div class="carousel-item active">
			      <img src="../kream_image/vanner/vanner5.jpeg" class="d-block" style="width:100%">
			      <div class="carousel-caption">
			        <h3></h3>
			        <p></p>
			      </div>
			    </div>
			    
			    <div class="carousel-item">
			      <img src="../kream_image/vanner/vanner8.jpg" class="d-block" style="width:100%">
			      <div class="carousel-caption">
			        <h3></h3>
			        <p></p>
			      </div> 
			    </div>
			    
			    <div class="carousel-item">
			      <img src="../kream_image/vanner/vanner7.png" alt="New York" class="d-block" style="width:100%; height: 100%">
			      <div class="carousel-caption">
			        <h3></h3>
			        <p></p>
			      </div>  
			    </div>
			    
			</div>
		</div>
	</div>				

<div class="main_cube">
	<div class="input-group">
		<!-- 카테고리 시작 -->
		<%
		for (int i=0; i < categoryList.size(); i++){
			KreamDto dto = categoryList.get(i);
			%>
		<div class="shotitem">
			<a href="categoryform.jsp?category=<%=dto.getCategory()%>">
			<div class="shotitem_img" align="center">
				<img src="../kream_image/cubeimage/<%=dto.getCategory()%>.jpeg"
				style="background-color: <%=dto.getColor()%>;">
				<br>
				<b><%=dto.getCategory()%></b>
			</div>
			</a>
		</div>
		<%} %>
		<!-- 카테고리 끝 -->
		<!-- <div class="shotitem">
			<a href="jodanform.jsp?category=Jodan">
			<div class="shotitem_img" align="center">
				<img src="../kream_image/cubeimage/jodan.jpeg"
				style="background-color: #fb9da7;">
				<br>
				<b>Jodan</b>
			</div>
			</a>
		</div>
		<div class="shotitem">
			<div class="shotitem_img" align="center">
				<img src="../kream_image/cubeimage/dunk.jpeg"
				style="background-color: #fcccd4;">
				<br>
				<b>Dunk</b>
			</div>
		</div>
		<div class="shotitem">
			<div class="shotitem_img" align="center">
				<img src="../kream_image/cubeimage/airmax.jpeg"
				style="background-color: #fbdea2;">
				<br>
				<b>Airmax</b>
			</div>
		</div>
		<div class="shotitem">
			<div class="shotitem_img" align="center">
				<img src="../kream_image/cubeimage/force.jpeg"
				style="background-color: #f2e2c6;">
				<br>
				<b>Force</b>
			</div>
		</div>
		<div class="shotitem">
			<div class="shotitem_img" align="center">
				<img src="../kream_image/cubeimage/off_white.jpeg"
				style="background-color: #8eb695;">
				<br>
				<b>off-white</b>
			</div>
		</div> -->
	</div>
</div>
	
	
<div class="product_title">
	<div class="title">
		<h3><b>Just Droppen</b></h3>
	</div>
	<div class="sub_title">
		<b>발매 상품</b>
	</div>
</div>
	
<div class="product_list">
		<!-- <div class="product_item input-group" style="width: 100%"> -->
		<table style="width: 100%">
			<tr>
			
		<%
		for (int i=0; i<list.size(); i++){
			KreamDto dto = list.get(i);
			%>
		<!-- <div style="float: left; margin-right: 50px;"> -->
		  <td style="width: 20%;">
				<div class="product_img">
					<a href="contentview.jsp?num=<%=dto.getNum()%>">
					<img src="../save/<%=dto.getPhoto()%>">
					</a>
				</div>
				<div class="info_box">
					<div class="brand_text">
						<%=dto.getCategory()%>
					</div>
					<a href="contentview.jsp?num=<%=dto.getNum()%>">
						<div class="brand_name">
							<%=dto.getEsubject()%>
						</div>
					</a>
						<div class="resale">
							<%=nf.format(Integer.parseInt(dto.getResale()))%>원
						</div>
					
				</div>
		</td>	
		<%
		if((i+1)%4==0){%>
		  </tr><tr>
		<%}
		}%>
		</tr>
		</table>
	</div>
</div>
</body>
</html>

