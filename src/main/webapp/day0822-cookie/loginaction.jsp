<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//암호를 읽는다
	String amho = request.getParameter("amho");
	//암호가 bit면 쿠키저장
	if(amho.equals("bit")){
		Cookie cookie = new Cookie("cookieok","yes");
		//유지시간 설정
		cookie.setMaxAge(60*60);
		//저장될 path지정
		cookie.setPath("/"); //localhost:9000 위치로 저장
		//브라우저에 추가
		response.addCookie(cookie);
		
		//메인페이지로 이동
		response.sendRedirect("cookiemain.jsp");
	}else{%>
		<script>
			alert("암호가 틀렸어요 다시 입력해주세요");
			history.back();
		</script>
	<%}
%>

