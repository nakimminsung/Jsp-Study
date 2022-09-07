<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.KreamDto"%>
<%@page import="java.util.List"%>
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
	
	 a:link, a:visited{
		text-decoration: none;
		color: black;
	}
	
	a:hover {
		text-decoration: underline;
	}
	
	.product_img img{
		width: 250px;
		background-color: #b6dee7;
		border-radius: 30px;
	}
	
    .product_title{
    	margin-top: 50px;
    	margin-left: 100px;
    }
    .product_list{
    	margin-left: 150px;
    }
    .top{
    	margin-left: 50px;
    }
</style>
</head>
<%
	String num = request.getParameter("num");

	KreamDao dao = new KreamDao();
	
	List<KreamDto> list = dao.getAllDatas();
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>
<body>
<div class="alldata" style="margin: 30px auto;">
	<div class="top">
		<h3><b>전체 상품 목록</b></h3>
	</div>

	<div class="product_list">
		<div class="product_item input-group" style="width: 100%">
		<%
		for (int i=0; i<list.size(); i++){
			KreamDto dto = list.get(i);
			if((i+1)%4==0)%>
			<div style="float: left; margin-right: 50px;">
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
							<div class="price">
								<%=dto.getResale()%>원
							</div>
						</a>
					</div>
			</div>	
		<%
		}%>
		</div>
	</div>
</div>
</body>
</html>

