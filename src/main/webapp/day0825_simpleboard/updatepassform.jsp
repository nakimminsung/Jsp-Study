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
	
	#wrap{
    position: absolute;
    left:50%;
    top: 50%;
    transform:translate(-50%,-50%);
	}

</style>
</head>
<body>
<%
	//num 읽어서 form에서 hidden에 넣는다
	String num = request.getParameter("num");
%>
<div id="wrap">
	<form action="updatepassaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<div class="input-group">
			<h4 style="width: 100px;">비밀번호</h4>
			<input type="password" class="form-control form-control-sm"
			required="required" autofocus="autofocus" name="pass" style="width: 140px;">
		</div>
		<br>
		<button type="submit" class="btn btn-info">수정 시 필요한 비밀번호 확인</button>
	</form>
</div>
</body>
</html>

