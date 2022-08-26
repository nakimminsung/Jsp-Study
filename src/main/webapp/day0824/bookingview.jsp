<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.BookingDto"%>
<%@page import="data.dao.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">


<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
* {
	font-family: 'Jua';
}
</style>
<script type="text/javascript">
	function funcdel(num) {
		//삭제 버튼에서 보낸 num값 확인
		//alert(num);
		
		var a=confirm("해당 주문사항을 삭제하라면 [확인]을 눌러주세요");
		//확인 클릭시 a는 true
		if(a){
			location.href="deletebooking.jsp?num="+num;
		}
	}
</script>
</head>
<body>
	<%
	//num 읽기
	String num = request.getParameter("num");

	//dao 선언
	BookingDao dao = new BookingDao();
	
	//num에 해당하는 dto 얻기
	BookingDto dto = dao.getBooking(num);
	
	//넘버포맷, 심플데이트포맷
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//dto데이타를 출력하는데
	//foodphoto는 컴마로 분리해서 이미지로 출력
	String []fphoto = dto.getFoodphoto().split(",");
	
	//foodprice는 컴마로 분리해서 반복문에서 총 금액에 더하는데 
	//이때 int로 변환 후 더해야 한다
	String []fprice = dto.getFoodprice().split(","); 
	
	int totalmoney = 0;
	
%>
	<div style="margin: 30px 30px; width: 700px;">
		<h4 class="alert alert-danger">예약 상세보기</h4>
		<table class="table table-bordered">
			<caption align="top">예약자 명단 확인하세요</caption>
			<tr>
				<th style="background-color: orange; width: 100px;">예약자명</th>
				<td><img
					src="../image/<%=dto.getGender().equalsIgnoreCase("m")?"남자":"여자"%>.png"
					width="40"> &nbsp; <%=dto.getName()%></td>
			</tr>
			<tr>
				<th style="background-color: orange; width: 100px;">예약시간</th>
				<td><%=dto.getBookday()%></td>
			</tr>
			<tr>
				<th style="background-color: orange; width: 100px;">예약인원수</th>
				<td><%=dto.getInwon()%>명</td>
			</tr>
			<tr>
				<th style="background-color: orange; width: 100px;">주문한 시간</th>
				<td><%=sdf.format(dto.getWriteday())%></td>
			</tr>
			<tr>
				<th style="background-color: orange; width: 100px;">메세지</th>
				<td><%=dto.getMessage()%></td>

			</tr>
			<tr>
				<th style="background-color: orange; width: 100px;">주문메뉴</th>
				<td>
					<%for(int i=0; i<fphoto.length; i++){
				//숫자형태라도 문자열이므로 int타입으로 변환 후 계산한다
				int price = Integer.parseInt(fprice[i]); 
				totalmoney += price;//같은 변수에 계속 더해야 총 금액을 구할 수 있다
				
				//이미지 명에서 확장자를 뺀 파일명만 분리하기 (split으로도 분리 가능)
				//.의 위치 얻기 방법 #1 indexOf
				/* int dotloc = fphoto[i].indexOf('.'); */
				//.의 위치 전까지 분리하기
				/* String menuname = fphoto[i].substring(0,dotloc); */
				
				//split으로 분리해보자 방법 #2 split// m[0]으로 출력하면 됨
				String []m = fphoto[i].split("[.]");
				
				%>
					<div class="input-group">
						<img src="../image/<%=fphoto[i]%>" width="80" height="80"
							border="2" style="margin-left: 30px; margin-bottom: 5px;">


						<%--  <h4 style="width: 200px; margin-left: 30px;"><%=menuname%></h4> --%>
						<!-- 인덱스로 분리 -->
						<h4 style="width: 200px; margin-left: 30px;"><%=m[0]%></h4>
						<!-- split 분리  -->

						&nbsp;
						<%= nf.format(price)%>
					</div> <br> <%}%>
					<h3>
						총 결제 금액 :
						<%=nf.format(totalmoney)%></h3>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-warning" style="width: 120px;"
						onclick="location.href='bookingupdateform.jsp?num=<%=num%>'">수정</button>

					<button type="button" class="btn btn-danger" style="width: 120px;"
						onclick="funcdel(<%=num%>)">삭제</button>

					<button type="button" class="btn btn-info" style="width: 120px;"
						onclick="location.href='startbooking.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

