<%@page import="data.dao.KreamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//num 읽기
	String num = request.getParameter("num");

	//dao 선언
	KreamDao dao = new KreamDao();
	
	//삭제
	dao.deleteKream(num);
	
	//메인으로 이동
	response.sendRedirect("mainform.jsp");

%>

