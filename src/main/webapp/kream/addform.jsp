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
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
<div style="margin: 30px 30px;">
	<form action="addaction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 800px;">
			<tr>
				<td width="300" rowspan="8" align="center" valign="middle">
					<img src="../image/noimage.jpeg" width="100%" id="blah">
				</td>
				<td colspan="2" align="center">
					<input type="file" name="photo" onchange="readURL(this)">
				</td>
			</tr>
			<tr>
			<th>카테고리</th>
				<td>
					<div class="input-group">
						<select id="category" name="category" class="form-select" style="width: 150px;">
							<option value="jordan">조던</option>
							<option value="dunk">덩크</option>
							<option value="airmax">에어맥스</option>
							<option value="offwhite">오프화이트</option>
							<option value="force">포스</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>영어이름</th>
				<td>
					<input type="text" name="esubject">
				</td>
			</tr>
			<tr>
				<th>한글이름</th>
				<td>
					<input type="text" name="ksubject">
				</td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td>
					<div>
						<select id="ssize" name="ssize" class="form-select" style="width: 150px;">
							<option value="220">220</option>
							<option value="230">230</option>
							<option value="240">240</option>
							<option value="250">250</option>
							<option value="260">260</option>
							<option value="270">270</option>
							<option value="280">280</option>
							<option value="290">290</option>
							<option value="300">300</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>정상가격</th>
				<td>
					<input type="number" name="sale">
				</td>
			</tr>
			<tr>
				<th>판매가격</th>
				<td>
					<input type="number" name="resale">
				</td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td>
					<input type="date" name="dday">
				</td>
			</tr>
			
			<tr>
				<td colspan="3" align="center">
					<button type="submit" class="btn btn-success">상품등록</button>
					
					<button type="button" class="btn btn-info"
					onclick="location.href='mainform'">이전</button>
				</td>
			</tr>
		</table>
	</form>	
</div>
</body>
</html>

