<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
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
    	margin-top: 50px;
    	margin-left: 100px;
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
	//category 읽기
	String category = request.getParameter("category");

	System.out.println(category);
	
	//dao 선언
	KreamDao dao = new KreamDao();
	
	//num에 해당하는 dto 얻기
	List<KreamDto> list = dao.getCategory(category);
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	//list<Kreamdto> categoryList = dao.getAllCategory();
	
 	/* System.out.println(list.get[0]); */
%>
<body>
<div class="product_list">
		<div class="product_item input-group" style="width: 100%">
		<%
		for (int i=0; i<list.size(); i++){
			KreamDto dto = list.get(i);
			%>
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
							<%=nf.format(Integer.parseInt(dto.getResale()))%>원
						</div>
					</a>
				</div>
		</div>	
		<%
		
		}%>
		</div>
	</div>


</body>
</html>

