<%@page import="data.dao.SocarDao"%>
<%@page import="data.dto.SocarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 엔코딩
 request.setCharacterEncoding("utf-8");

//데이터 읽기

String []chk = request.getParameterValues("chk");
console.log(chk);


SocarDto dto = new SocarDto();

SocarDao dao = new SocarDao();

//카트로 이동
response.sendRedirect("cart.jsp");

%>

