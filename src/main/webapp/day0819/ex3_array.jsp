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
<body>
<%
	String []colors={"lightgray","lightgreen","pink","lightyellow","purple"};
%>

<table class="table table-bordered" style="width: 300px;">
<caption align="top"><b>1차원 배열 출력</b></caption>
		<tr class="table-danger"> 
			<td>번호</td>
			<td>결과</td>
		</tr>
<%
		for(int i=0; i<colors.length; i++){%>
			<tr>
				<td align="center"><%=i+1%></td>
				<td style="background-color: <%=colors[i]%>"><%=colors[i]%></td>
			</tr>
		<%}
%>
</table>
<hr>
<%
	String[][] array2={
			{"영자","01.png"},
			{"미자","02.png"},
			{"철수","05.png"},
			{"샌드위치","1.jpg"},
			{"망고빙수","11.jpg"}
	};
%>

<table class="table table-bordered" style="width: 100px; height: 100px;">
<caption align="top"><b>2차원 배열 출력</b></caption>
		<tr class="table-danger"> 
			<td>번호</td>
			<td>이름</td>
			<td>사진</td>
		</tr>
<%
	for(int i=0; i<array2.length; i++){%>
		<tr>
			<td align="center"><%=i+1%></td>
			
			<td><%=array2[i][0]%></td>
			<td>
				<img src="../image/<%=array2[i][1]%>" width="100" height="100" border="1">
			</td>
		</tr>
	<%}	
%>
</table>
<script>
	
</script>
</body>
</html>

