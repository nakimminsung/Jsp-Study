<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	boolean blogin=false;
	//브라우저에 저장된 모든 쿠키값들을 얻는다
	Cookie []cookies=request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length; i++){
			//cookieok가 있는지
			String cookieok = cookies[i].getName();
			if(cookieok.equals("cookieok")){// cookieok 라는 이름을 가진 쿠키가 있을 경우
				blogin=true;
			}
		}
	}
	
	if(blogin){ // blogin이 true면
		// 기사 열람
		%>
		<pre>
		지난 19일 방송된 `나 혼자 산다`는 카타르 월드컵 D-100 특집으로 프리미어리그에서 활약하고 있는 황희찬 선수의 싱글 라이프를 보여줬다. 
		유럽 감성이 가득 느껴지는 영국 울버햄프턴의 평화로운 분위기와 어우러진 황희찬 선수의 단독 3층 주택 `희찬 하우스`가 전격 공개된 것.
		
		울버햄프턴은 잉글랜드 중부에 위치한 스태퍼드셔 주 남부의 공업 도시다. 
		버밍엄 북서쪽 21km에 위치하며 인구 24만 9000명이 거주한다. 런던에서는 차량으로 약 3시간 걸리는 중소도시다.
		
		현재 기준 황희찬 선수의 주택과 비슷한 수준인 방 4개, 욕실 2개 구성의 울버햄프턴 주택을 찾아보면 
		주세는 보증금 1200파운드로에 주세 277파운드로 한화로는 보증금 약 190만원에 43만원 수준이다.
		</pre>
	<%}else{ %>
		<script>
			alert("먼저 암호를 입력해주세요");
			history.back();
		</script>
	<%}
%>

