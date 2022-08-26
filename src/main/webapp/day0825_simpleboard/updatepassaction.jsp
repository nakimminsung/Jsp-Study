<%@page import="data.dao.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num,pass
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	//dao
	SimpleBoardDao dao = new SimpleBoardDao();
	
	//isPasscheck 호출
	boolean check = dao.isPassCheck(num, pass);
	
	//true면 uptateform으로 이동 (num전달)
	//false면 alert 후 back
	if(check){
		response.sendRedirect("updateform.jsp?num="+num);
	}else{%>
		<script>
			alert("비밀번호가 맞지 않습니다");
			history.back();
		</script>
	<%}
%>
