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
		은행연합회는 22일 홈페이지 소비자포털에 7월 기준 은행권의 예대금리차 현황을 비교 공시했다. 
		금리 관련 정보를 소비자에게 정확하게 제공해 금리상승기 소비자 부담을 완화한다는 취지에서 시행됐다. 
		공시에 따르면 지난 7월 기준 5대 은행의 가계대출 예대금리차는 1.37%포인트(p), 인터넷전문은행은 3.46%p 등으로 나타났다.

		이번 공시로 가장 억울한 곳은 전북은행과 토스뱅크다. 공시된 내용에 따르면 전북은행의 가계예대금리차는 6.33%p, 토스뱅크 또한 5.6%p에 이른다. 
		얼핏 보면 예대마진을 많이 남긴 것 같지만 실상은 그렇지 않다는게 이들의 입장이다.
		
		토스뱅크 관계자는 “토스뱅크 대출 고객 중 중저신용자 비율은 약 38%로(7월말 기준) 모든 은행 중 가장 높고, 
		6월말 공시 기준 타 인터넷전문은행과 비교해도 1.5배 이상 높다”며 
		“인터넷전문은행 최초로 개인사업자 전용 비대면 대출을 출시해 코로나 어려움을 겪는 총 2만 5000여명의 개인사업자가 
		1금융권 혜택을 봤는데 이 부분이 공시에 반영된 것”이라고 말했다. 
		여기에 저금리 하 인기를 끌었던 ‘2% 파킹 통장’은 수시입출금으로 분류돼 예금 상품에서도 배제됐다는 후문이다.
		</pre>
	<%}else{ %>
		<script>
			alert("먼저 암호를 입력해주세요");
			history.back();
		</script>
	<%}
%>

