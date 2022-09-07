<%@page import="data.dto.SmartDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style type="text/css">
    	body *{
    		font-family:'Jua';
    	}
    	
    	span.day{
    		color: #ccc;
    		font-size: 0.8em;
    	}
    	
    	img{
    		max-width: 450px;
    	}
    	
    	div.alist{
    		margin-left: 20px;
    		
    	}
    	
    	div.alist span.aday{
    		float: right;
    		font-size: 0.8em;
    		color: #bbb;
    	}
    </style>
   <script>
   	$(function() {
		//처음 시작 시 댓글 출력 호출
		list();
		
		$(document).on("click",".adel",function(){
			 var a = confirm("댓글을 삭제하려면 [확인]을 눌러주세요");
			 //idx 얻기
			 var idx = $(this).attr("idx");
			 console.log("idx")
			 if(a){
				$.ajax({
					type:"get",
					url:"deleteanswer.jsp",
					dataType:"html",
					data:{"idx":idx},
					success:function(res){	
						list();
								
					},
					statusCode: {
						404:function(){
							alert("json 파일을 찾을수 없어요!");
						},
						500:function(){
							alert("서버 오류..코드를 다시 한번 보세요!");
						}
					}
				});
			 }
		});
	});
	
	function list() {
		//댓글 출력
		console.log("list num=" +$("#num").val());
		
		var s="";
		$.ajax({
			type:"get",
			url:"listanswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){	
				//댓글 개수 출력
				$("b.acount>span").text(res.length);
				var s = "";
				$.each(res,function(idx,item){
					s+="<div>"+item.nickname+":"+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>";
					s+="<button type='button' idx='"+item.idx+"'class='adel'>삭제</button>";
					s+="</div>";
				});
				$("div.alist").html(s);		
			},
			statusCode: {
				404:function(){
					alert("json 파일을 찾을수 없어요!");
				},
				500:function(){
					alert("서버 오류..코드를 다시 한번 보세요!");
				}
			}
		});
	}
   </script>
</head>
<body>
<jsp:useBean id="dao" class="data.dao.SmartDao"></jsp:useBean>
<%
	//num을 읽는다
	String num=request.getParameter("num");
	
	//현재 페이지를 읽는다
	String currentPage = request.getParameter("currentPage");
	
	//조회수 1증가
	dao.updateReadCount(num);
	
	//dto 가져오기
	SmartDto dto = dao.getData(num);
	
	//날짜 형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<input type="hidden" id="num" value="<%=num%>">

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
				<b>작성자:<%=dto.getWriter() %></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday()) %>
				&nbsp;&nbsp;조회 <%=dto.getReadcount() %>
				</span>
			</td>
		</tr>
		<tr height="150">
			<td>
			<%
				if(dto.getContent()==null) {%>
					<h1 style="color: red;">저장된 내용 없음!</h1>
				<%} else { %>
					<!-- 엔터 없이 길게 썼을 경우 500px 안에서 자동 줄넘김 되도록 하기 -->
					<!-- <div style="white-space:pre-wrap; word-wrap:break-word; width: 500px;"> <스마트 에디터가 아닐 경우 textarea에서 내용이 길 경우 자동으로 줄 바꿈 코드 -->
					<%=dto.getContent()%>
					<!-- </div> -->
				<%}			
			%>
			</td>
		</tr>
		<tr>
			<td>
				<b class="acount">댓글 <span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<div class="aform input-group">
					<input type="text" id="nickname" class="form-control form-control-sm"
					 style="width: 100px;" placeholder="닉네임">
					
					<input type="text" id="content" class="form-control form-control-sm"
					 style="width: 300px;" placeholder="댓글메세지">
					 
					 <button type="button" id="btnasend" class="btn btn-outline-info btn-sm">저장</button>
				</div>
			</td>
		</tr>
		<script>
			//댓글부분 ajax insert code
			var num = $("#num").val();
			console.log(num);
			
			$("#btnasend").click(function() {
				var nickname = $("#nickname").val().trim();
				var content = $("#content").val().trim();
				
				if(nickname==''){
					alert("닉네임을 입력 후 저장해주세요");
					return;
				}
				if(content==''){
					alert("댓글 내용을 입력 후 저장해주세요");
					return;
				}
				
				$.ajax({
					type: "get",
					url : "insertanswer.jsp",
					dataType : "html",
					data : {"num":num,"nickname":nickname,"content":content},
					success : function(res) {
						//기존 입력값 지우기
						$("#nickname").val('');
						$("#content").val('');
						//댓글 추가 후 댓글 목록 다시 출력
						list();
					},
					
					statusCode: {
						404 : function() {
							alert("json 파일을 찾을 수 없어요");
						},
						500 : function() {
							alert("서버 오류 : 코드를 다시 한 번 확인하세요");
						}
					}
				});
			});
		</script>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-warning btn-sm" style="width: 100px;"
				onclick="location.href='smartform.jsp'">
				<i class="fas" style="font-size: :14px;">&#xf304;</i>글쓰기</button>
				
				<button type="button" class="btn btn-warning btn-sm" style="width: 100px;"
				onclick="location.href='updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">
				<i class="far fa-edit" style="font-size: :14px;"></i>수정</button>
				
				<button type="button" class="btn btn-warning btn-sm" style="width: 100px;"
				onclick="funcdel(<%=num%>,<%=currentPage%>)">
				<i class="bi bi-trash"></i>삭제</button>
				
				<button type="button" class="btn btn-danger btn-sm" style="width: 100px;"
				onclick="location.href='smartlist.jsp?currentPage=<%=currentPage%>'">
				<i class="bi bi-layout-text-window-reverse"></i>목록</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	function funcdel(num, currentPage) {
		//alert(num + "," + currentPage);
		var a = confirm("삭제하려면 [확인]을 눌러주세요");
		if(a) {
			location.href="deleteaction.jsp?num=" + num + "&currentPage=" + currentPage;
		} else {
			alert("취소되었습니다");
		}
	}
</script>
</body>
</html>