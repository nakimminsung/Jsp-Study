<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디와 비밀번호, 체크박스를 읽는다
	String myid=request.getParameter("myid");
	String mypass=request.getParameter("mypass");
	String saveid=request.getParameter("saveid"); // 체크박스 on OR null
	
	//아이디와 비밀번호가 맞으면 세션에 3가지 저장
	if(mypass.equals("1234")){
		//유지시간을 20초정도로 변경 해보자(생략시 유지시간은 30분)
		//다시 유지시간을 8시간으로 해보자
		session.setMaxInactiveInterval(30);
		
		session.setAttribute("myid", myid);
		session.setAttribute("loginok", "yes");
		session.setAttribute("saveid", saveid==null?"no":"yes");
		
		//세션 저장 후 메인으로 이동
		response.sendRedirect("loginmain.jsp");
	}else{
		//틀리면 자바스크립트로 경고 후 이전페이지로 이동
	%>
		<script>
			alert("비밀번호가 맞지 않습니다");
			history.back(); // history.go(-1)과 같다
		</script>
	<%}
%>

