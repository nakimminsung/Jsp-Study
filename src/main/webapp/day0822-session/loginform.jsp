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
	//세션으로부터 아이디와 체크값을 얻는다
	String myid=(String)session.getAttribute("myid");
	String saveid=(String)session.getAttribute("saveid");
	
	boolean savechk=true;
	
	
	if(saveid==null || saveid.equals("no"))//조건이 여러가지일경우 반드시 null조건을 먼저 쓴다
	{
		myid=""; // 아이디저장을 체크하지 않은 경우 아이디를 없앤다
		savechk=false; // 체크하지 않았을 경우 false, 그 이외에는 초기값이 true이므로 true가 된다
	}
%>
<body>
	<div style="margin: 100px 100px">
		<form action="loginaction.jsp" method="post">
			<table class="table table-bordered" style="width: 300px">
				<caption align="top">
					<input type="checkbox" name="saveid" <%=savechk?"checked":""%>>아이디저장
				</caption>
				<tr>
					<th style="background-color: orange">아이디</th>
					<td>
						<input type="text" name="myid" class="form-control" style="width: 160px"
							value="<%=myid%>">		
					</td>
				</tr>
				<tr>
					<th style="background-color: orange">비밀번호</th>
					<td>
						<input type="password" name="mypass" class="form-control" style="width: 160px">
								
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">회원 로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

