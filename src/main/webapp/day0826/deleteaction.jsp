<%@page import="data.dao.SocarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//num값 읽기
String num = request.getParameter("num");

//dao 선언
SocarDao dao = new SocarDao();

//삭제 메서드 호출
//dao.deleteSocar(num);

//socarlist로 이동
//response.sendRedirect("socarlist.jsp"); 
%>
<script>

var flag = confirm("정말 삭제하시겠습니까?")
	if(flag){
		alert("삭제되었습니다 리스트로 이동합니다");
		<%dao.deleteSocar(num);%>
		location.href='socarlist.jsp';
	}else{
		alert("취소되었습니다")
		history.back();
	}
</script>


