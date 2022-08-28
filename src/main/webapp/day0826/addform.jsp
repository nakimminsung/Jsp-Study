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
<div style="margin: 30px 30px; width: 700px;">
	<form action="addaction.jsp" method="post">
		<table class="table table-bordered">
			<caption align="top"><h5><b>글쓰기</b></h5></caption>
			<tr>
				<th width="100" class="table-secpmdary">제조사</th>
				<td>
					<div class="input-group">
						<select id="company" name="company" class="form-select" required="required" autofocus="autofocus" style="width: 150px;">
							<option selected disabled hidden>선택하세요</option>
							<option value="벤츠">벤츠</option>
							<option value="BMW">BMW</option>
							<option value="기아">기아</option>
							<option value="현대">현대</option>
							<option value="쌍용">쌍용</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">차 이름</th>
				<td>
					<input type="text" name="carname" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">차 색상</th>
				<td>
					<input type="text" name="carcolor" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">연식</th>
				<td>
					<input type="number" name="caryear" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secpmdary">차량 가격</th>
				<td>
					<input type="number" name="carprice" class="form-control" required="required"
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<td colspan=2" align="center">
					<button type="submit" class="btn btn-success">저장</button>
					
					<button type="button" class="btn btn-info"
					onclick="location.href='socarlist.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

