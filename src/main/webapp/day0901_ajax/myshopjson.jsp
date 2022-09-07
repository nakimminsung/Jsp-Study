<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.MyShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MyShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sangpum=request.getParameter("sangpum");

	//String sangpum="";
	
	MyShopDao dao = new MyShopDao();
	
	//검색한 상품만 얻기
	List<MyShopDto> list = dao.getSearchSangpums(sangpum);
	
	//json 배열 선언
	JSONArray arr = new JSONArray();
	
	for(MyShopDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("sangpum",dto.getSangpum());
		ob.put("color",dto.getColor());
		ob.put("price",dto.getPrice());
		ob.put("photo","../image2/"+dto.getPhoto()+".jpg");
		
		//배열에 추가
		arr.add(ob);
	}
%>
<%=arr.toString()%>

