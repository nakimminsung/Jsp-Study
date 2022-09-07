<%@page import="data.dao.KreamDao"%>
<%@page import="data.dto.KreamDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드할 폴더
	String realFolder = getServletContext().getRealPath("/save");
	System.out.println(realFolder);
	
	//업로드할 이미지의 크기
	int uploadSize = 1024*1024*3;

	MultipartRequest multiRequest = null;	
	
	try{
		
	multiRequest = new MultipartRequest(request, realFolder,uploadSize, "utf-8", new DefaultFileRenamePolicy());
	
	
	//폼 데이터 읽기
	String category = multiRequest.getParameter("category");
	String esubject = multiRequest.getParameter("esubject");
	String ksubject = multiRequest.getParameter("ksubject");
	String ssize = multiRequest.getParameter("ssize");
	String sale = multiRequest.getParameter("sale");
	String resale = multiRequest.getParameter("resale");
	String dday = multiRequest.getParameter("dday");
	
	//사진 저장
	String photo = multiRequest.getFilesystemName("photo");
	
	//dto에 저장
	KreamDto dto = new KreamDto();
	dto.setCategory(category);
	dto.setEsubject(esubject);
	dto.setKsubject(ksubject);
	dto.setSsize(ssize);
	dto.setSale(sale);
	dto.setResale(resale);
	dto.setDday(dday);
	dto.setPhoto(photo);
	
	//dao선언
	KreamDao dao = new KreamDao();
	
	//insert
	dao.insertKream(dto);
	
	//메인으로 이동
	response.sendRedirect("mainform.jsp");
	
	}catch(Exception e){
		System.out.println("업로드 오류:"+e.getMessage());
	}
%>

