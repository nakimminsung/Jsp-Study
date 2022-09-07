<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.KreamDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.KreamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	KreamDao dao = new KreamDao();

	List<KreamDto> list = dao.getAllDatas();
	
	JSONArray arr = new JSONArray();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(KreamDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("category",dto.getCategory());
		ob.put("ssize",dto.getSsize());
		ob.put("sale",dto.getSale());
		ob.put("resale",dto.getResale());
		ob.put("photo",dto.getPhoto());
		ob.put("ksubject",dto.getKsubject());
		ob.put("esubject",dto.getEsubject());
		ob.put("dday",dto.getDday());
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>