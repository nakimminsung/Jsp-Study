<%@page import="data.dto.SocarDto"%>
<%@page import="data.dao.SocarDao"%>
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
String num = request.getParameter("num");

SocarDao dao = new SocarDao();

SocarDto dto = dao.getContent(num);

%>
<body>
<div style="margin: 30px 30px; width: 700px;">
	<form action="updateaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<table class="table table-bordered">
			<caption align="top"><h5><b>수정사항</b></h5></caption>
			<tr>
				<th width="100" class="table-secpmdary">제조사</th>
				<td>
			<div class="input-group">		
				<select id="company" name="company" class="form-select" required="required" autofocus="autofocus" style="width: 150px;">
					<option value="벤츠" <%=dto.getCompany().equals("벤츠")?"selected":""%>>벤츠</option>
					<option value="BMW" <%=dto.getCompany().equals("BMW")?"selected":""%>>BMW</option>
					<option value="기아" <%=dto.getCompany().equals("기아")?"selected":""%>>기아</option>
					<option value="현대" <%=dto.getCompany().equals("현대")?"selected":""%>>현대</option>
					<option value="쌍용" <%=dto.getCompany().equals("쌍용")?"selected":""%>>쌍용</option>
				</select>
				<img src = "../testimage/<%=dto.getCompany()%>.jpeg" width="150" height="150" id="cphoto">
				<script type="text/javascript">
					//select 변경시 사진도 변경
						$("#company").change(function() {
							var src = "../testimage/"+$(this).val()+".jpeg";
							$("#cphoto").attr("src",src);
						});
				</script>
			</div>
			</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">차 이름</th>
				<td>
					<input type="text" name="carname" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;" value="<%=dto.getCarname()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">차 색상</th>
				<td>
					<input type="text" name="carcolor" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;"value="<%=dto.getCarcolor()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">연식</th>
				<td>
					<input type="text" name="caryear" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;" value="<%=dto.getCaryear()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">차량 가격</th>
				<td>
					<input type="number" name="carprice" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;" value="<%=dto.getCarprice()%>">
				</td>
			</tr>
			<tr>
				<td colspan=2" align="center">
					<button type="submit" class="btn btn-success">변경사항 저장</button>
					
					<button type="button" class="btn btn-info"
					onclick="location.href='socarlist.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

