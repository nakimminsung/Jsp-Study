<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

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
<div style="margin: 30px 30px; width: 400px;" >
	<form action="boardaction.jsp" method="post">
		<table class="table table-bordered">
			<caption align="top"><h5><b><i class='fas fa-pen' style='font-size:24px'></i>
			글쓰기</b></h5></caption>
			<tr>
				<th width="100" class="table-secondary">작 성 자</th>
				<td>
					<input type="text" name="writer" class="form-control" required="required" 
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">비 밀 번 호</th>
				<td>
					<input type="password" name="pass" class="form-control form-control-sm" required="required" 
					autofocus="autofocus" style="width: 150px;" pattern="[0-9]{4,}">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">제 목</th>
				<td>
					<input type="text" name="subject" class="form-control form-control-sm" required="required" 
					autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for = "comment">Comments:</label>
					<textarea class="form-control" id="comment" name="content" 
					required="required" style="width: 100%; height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- submit 기능을 이미지로 image 자체가 submit 기능
						타입이 image이거나 submit일 경우 기본 기능이 submit 입니댜-->
						<input type="image" src="../image/submit.png" style="width: 100px;" >
					
					<button type="button" class="btn btn-secondary" style="margin-left: 30px; "
					onclick="location.href='boardlist.jsp'">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

