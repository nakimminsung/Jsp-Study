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
		세계 60개국에 떡볶이 간편식 '요뽀끼'를 수출하는 세계 1위 떡볶이 수출 기업인 농업회사법인 ㈜영풍의 조재곤 대표는 
		"생산량이 주문량을 못쫓아가 일부 주문은 포기해야할 지경"이라며 이같이 말했다. 
		요뽀끼의 가장 큰 매출처인 일본과 가장 급성장하는 시장인 유럽의 마트와 편의점 등에서 진열과 동시에 품절돼 
		"빨리 공급해달라"는 요청이 쇄도하고 있기 때문이다. 
		조재곤 대표는 "마치 1990년대 우리나라 스파게티 열풍을 보는 듯 하다"며 
		"전세계 청소년과 젊은이들사이에서 '환상적인 맛'이라는 입소문이 퍼지면서 매출이 급증하고 있다"고 소개했다.

		식품제조기업 영풍은 국내 대표 먹거리인 떡볶이, 라볶이, 떡류, 부침개 등을 간편 식품으로 만들어 
		'요뽀끼', '핑크로켓' 등의 자체 브랜드로 80여개 품목을 수출·판매하고 있다. 이 회사 제품의 인기 비결은 유통과 보관 및 조리가 용이하다는 점이다. 
		대다수 떡볶이류 간편식 제품들은 냉동·냉장보관이 필요하지만 이 제품은 그럴 필요가 없다. 
		이 회사가 세계 최초로 ‘상온에서 장기보존이 가능한 떡볶이 떡의 가공방법’기술에 대한 국내외 특허를 보유했기 때문이다. 
		요뽀끼 컵 제품의 경우 물을 붓고 전자레인지에 넣어 2~3분만 돌리면 된다.
		</pre>
	<%}else{ %>
		<script>
			alert("먼저 암호를 입력해주세요");
			history.back();
		</script>
	<%}
%>

