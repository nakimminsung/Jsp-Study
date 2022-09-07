<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//front에서 보낸 데이타를 읽는다
	String irum = request.getParameter("irum");
	String addr = request.getParameter("addr");
	
	//front로 보낼 데이타를 만든다
	String message = irum+"님은 "+addr+"에 살고있어요";
	
	//json형태로 만들어서 프론트로 보낸다
	JSONObject ob = new JSONObject();
	ob.put("message",message);
%>
<%=ob.toString()%>