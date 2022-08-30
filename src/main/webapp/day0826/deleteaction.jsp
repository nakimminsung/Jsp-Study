<%@page import="data.dao.SocarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//num값 읽기
String num = request.getParameter("num");

//dao 선언
SocarDao dao = new SocarDao();

//imNumcheck 호출
boolean check = dao.isNumCheck(num); 

//삭제 메서드 호출
dao.deleteSocar(num);

//socarlist로 이동
response.sendRedirect("socarlist.jsp"); 
%>
<%--  <script> 
confirm("정말 삭제하시겠습니까?")
</script>
	<%if(check){
		dao.deleteSocar(num);%>
		<script>
		alert("삭제되었습니다 리스트로 이동합니다");
		location.href='socarlist.jsp';
		</script>
	<%}else{%>
		<script type="text/javascript">
		alert("취소되었습니다")
		history.back();
		</script>
	<%}%>
 --%>

