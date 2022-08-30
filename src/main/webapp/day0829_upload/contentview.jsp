<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"> 
   
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	
	span.day{
		color: #ccc;
		font-size: 0.3em;	
	}
	
	img{
		max-width: 490px;
	}
</style>
</head>
<body>
<%
	//num을 읽는다
	String num = request.getParameter("num");

	//현재 페이지를 읽는다
	String currentPage = request.getParameter("currentPage");

	//dao 선언
	SmartDao dao = new SmartDao();
	
	//조회수 1증가
	dao.updateReadCount(num);
	
	//dto 가져오기
	SmartDto dto = dao.getData(num);
	
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top">
			<div class="input-group">
				<img src="../save/<%=dto.getMainphoto()%>" width="70" height="70" class="rounded-circle">
				&nbsp;
				<h2><b><%=dto.getSubject()%></b></h2>
			</div>
		</caption>
		<tr>
			<td>
				<b>작성자:<%=dto.getWriter()%></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday())%>
				&nbsp;&nbsp;조회 <%=dto.getReadcount()%></span>
			</td>
		</tr>
		<tr height="150">
			<td>
				<%
					if(dto.getContent()==null){%>
						<h1 style="color: red;">저장된 내용 없음!</h1>	
					<%}else{%>
						<!-- 엔터없이 길게 썻을경우 500px 안에서 자동줄넘김 되도록 하기 -->
						<!-- <div style="white-space:pre-wrap; word-wrap:break-word;width: 500px;">
							스마트 에디터에 자동 줄넘김이 들어가있으므로 넣지 않아도 되지만 스마트에디터가 아닐 경우에는 넣어줘야한다 -->
						<%=dto.getContent()%>
						<!-- </div> -->
					<%}
				%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-primary btn-sm" style="width: 100px"
				onclick="location.href='smartform.jsp'"><i class='fas fa-pen' style='font-size:15px'></i>글쓰기</button>
				
				<button type="button" class="btn btn-success btn-sm" style="width: 100px;"
				onclick="location.href='updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">
				<i class='far fa-edit' style='font-size:15px'></i>수정</button>
				
				<button type="button" class="btn btn-danger btn-sm" style="width: 100px;"
				onclick="funcdel(<%=num%>,<%=currentPage%>)">
				<i class='far fa-trash-alt' style='font-size:15px'></i>삭제</button>
				
				<button type="button" class="btn btn-info btn-sm" style="width: 100px;"
				onclick="location.href='smartlist.jsp?currentPage=<%=currentPage%>'">
				<i class='fas fa-th-list' style='font-size:15px'></i>목록</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	function funcdel(num,currentPage) {
		//alert(num+","+currentPage);
		var a = confirm("삭제하려면 [확인]을 눌러주세요");
		if(a){
			location.href = "deleteaction.jsp?num="+num+"&currentPage="+currentPage;
		}else{
			alert("취소되었습니다")
		}
	}
</script>
</body>
</html>

