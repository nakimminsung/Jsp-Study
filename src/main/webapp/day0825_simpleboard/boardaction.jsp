<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
%>

<!-- useeBean은 new로 객체 생성하는 것과 같다
	 ID는 변수명이 된다-->

<!-- dao선언 -->
<jsp:useBean id="dao" class="data.dao.SimpleBoardDao"/>

<!-- dto 선언 -->
<jsp:useBean id="dto" class="data.dto.SimpleBoardDto"/>

<!-- dto의 멤버와 같은 이름의 폼 태그는 자동으로 읽어서 dto에 넣어주기 
	 name에는 위에서 생성된 id명을 준다-->
<jsp:setProperty property="*" name="dto"/>

<%
	//db에 insert
	dao.insertBoard(dto);

	//목록으로 이동
	//response.sendRedirect("boardlist.jsp");
	
	//내용보기로 이동
	//방금 insert된 num을 알아야한다
	int num = dao.getMaxnum(); // num값 불러오기
	response.sendRedirect("contentview.jsp?num="+num); // 컨텐트 뷰로 이동
%>