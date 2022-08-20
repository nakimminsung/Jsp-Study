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
	<div style="margin-left: 200px">
		<form action="ex6_action.jsp" method="post">
			<table class="table table-borderes" style="width: 400px">
				<caption align="top">Ex6번 폼</caption>
					<tr>
						<th width="120" class="table-warning">이 름</th>
						<td>
							<input type="text" name="irum" class="form-control">
						</td>
					</tr>
					<tr>
						<th width="120" class="table-warning">생년월일</th>
						<td>
							<input type="date" name="birth" class="form-control">
						</td>
					</tr>
					<tr>
						<th width="120" class="table-warning">취 미</th>
						<td>
							<label><input type="checkbox" name="hobby" value="게임">게임</label>
							<label><input type="checkbox" name="hobby" value="서핑">서핑</label>
							<label><input type="checkbox" name="hobby" value="축구">축구</label>
							<label><input type="checkbox" name="hobby" value="독서">독서</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-danger">서버 전송</button>
						</td>
					</tr>
			</table>
		</form>	
	</div>
</body>
</html>

