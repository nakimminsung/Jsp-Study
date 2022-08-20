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
	<h3>Ex5 폼태그</h3>
	<form action="ex5_action.jsp" method="get">
		<b>이름 :</b>
		<input type="text" name="irum" class="form-control" style="width: 140px"
		placeholder="input Name" required="required">
		<br>
		<b>운전면허 :</b>
		<label><input type="checkbox" name="dirver">운전면허</label>
		<br>
		<!-- required는 submit에서만 가능하다 -->
		<button type="submit" class="btn btn-danger">서버전송</button>
	 </form>
</body>
</html>

