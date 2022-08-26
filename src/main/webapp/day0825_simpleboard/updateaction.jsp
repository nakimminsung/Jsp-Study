<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
%>
<!-- useBean은 New객체로 생성하는것과 같다, id는 변수명이 된다 -->
<jsp:useBean id="dao" class="data.dao.SimpleBoardDao"/>
<jsp:useBean id="dto" class="data.dto.SimpleBoardDto"/>

<!-- dto의 멤버와 같은 이름의 폼태그는 자동으로 읽어서 dto에 넣는다
	name에 위에서 생성된 id명을 넣는다 -->
<jsp:setProperty property="*" name="dto"/>

<%
	//db update
	dao.updateBoard(dto);
	//수정 후 내용보기로 이동
	response.sendRedirect("contentview.jsp?num="+dto.getNum());
%>
