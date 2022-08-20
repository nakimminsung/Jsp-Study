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
<div style="margin-left: 100px">
	<form action="ex8_action.jsp" method="post">
		<table class="table table-borderes" style="width:500px;">
			<caption align="top">선생님 숙제 받으세요~!</caption>
				<tr>
					<th width="100" class="table-warning">이 름</th>
					<td>
						<input type="text" name="irum" class="form-control">
					</td>
				</tr>
				<tr>
					<th width="100" class="table-warning">성 별</th>
					<td>
						<label><input type="radio" name="sex" value="남">남</label>
						<label><input type="radio" name="sex" value="여">여</label>
					</td>
				</tr>
				<tr>
					<th width="100" class="table-warning">백 신</th>
					<td>
						<label><input type="checkbox" name="back">접종</label>
					</td>
				</tr>
				<tr>
					<th width="120" class="table-warning">좋아하는 메뉴</th>
					<td>
						<label><input type="checkbox" name="food" value="../image/1.jpg">샌드위치1</label>
						<label><input type="checkbox" name="food" value="../image/3.jpg">육개장</label>
						<label><input type="checkbox" name="food" value="../image/8.jpg">샌드위치2</label>
						<label><input type="checkbox" name="food" value="../image/11.jpg">망고빙수</label>
					</td>
				</tr>
				<tr>
					<th width="120" class="table-warning">주소</th>
						<td>
						<select class="form-select" name="addr">
							<option>서울시 강남구</option>
							<option>서울시 영등포구</option>
							<option>서울시 동작구</option>
							<option>서울시 광진구</option>			
						</select>
					</td>
				</tr>
				<tr>
					<th width="120" class="table-warning">하고싶은말</th>
					<td>
						<textarea style="width:300px;height:100px;" class="form-control" name="lang"></textarea>
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

