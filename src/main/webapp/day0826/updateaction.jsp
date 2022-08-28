<%@page import="data.dto.SocarDto"%>
<%@page import="data.dao.SocarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 엔코딩
 request.setCharacterEncoding("utf-8");

//데이터 읽기
int num = Integer.parseInt(request.getParameter("num"));
String carname = request.getParameter("carname");
String company = request.getParameter("company");
String carcolor = request.getParameter("carcolor");
int carprice = Integer.parseInt(request.getParameter("carprice"));
String caryear = request.getParameter("caryear");

//dto에 담기
SocarDto dto = new SocarDto();
dto.setNum(num);
dto.setCarname(carname);
dto.setCompany(company);
dto.setCarcolor(carcolor);
dto.setCarprice(carprice);
dto.setCaryear(caryear);

//dao 선언
SocarDao dao = new SocarDao();

//update메서드 호출
dao.updateSocar(dto);

//목록으로 이동
response.sendRedirect("socarlist.jsp");

%>

