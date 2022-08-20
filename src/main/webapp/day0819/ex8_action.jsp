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
	pre{
		font-family: 'Jua';
		color: blue;
		font-size: 80px;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String irum=request.getParameter("irum");
	String sex=request.getParameter("sex");
	String back=request.getParameter("back");
	String[] food=request.getParameterValues("food");
	String addr=request.getParameter("addr");
	String lang=request.getParameter("lang");
%>
</body>
<h3>이름 : <%=irum%></h3><br>
<h3>성별 : <%=sex%> </h3>
<h3>접종여부 : <%=back==null?"안맞음":"맞음"%></h3><br>
<h3>좋아하는 메뉴 : <br> 
	 	<%if(food==null){%>
			좋아하는게 없지롱
		<%}else{
			for(String a:food){%>
			<img src="<%=a%>"width="150">
		 		<%-- <b><%=a%></b>&nbsp; --%>
		 	
		<%};%>
		<%}%>
		
<h3>주소 : <%=addr%></h3><br>
<pre>하고 싶은 말 : <%=lang%><pre>
</html>

