<%@page import="data.dto.BookingDto"%>
<%@page import="data.dao.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   

 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
</style>
<script type="text/javascript">
	function check() {
		var len=$("input[name='food']:checked").length;
		if(len<2){
			alert("주문메뉴는 최소 2개이상 선택해주세요");
			return false;
		}
	}
</script>
</head>
<%
	//num값 읽기
	String num = request.getParameter("num");

	//dao 선언
	BookingDao dao = new BookingDao();
	
	//num에 해당하는 dto 얻기
	BookingDto dto = dao.getBooking(num);

%>
<body>
<div style="margin: 30px 30px;">
	<!-- onsubmit 이벤트는 action이 호출되기전에 발생
	리턴값을 false를 받으면 action이 호출되지 않는다 -->
	
	<form action="updateaction.jsp" method="post" onsubmit="return check()">
	
		<input type="hidden" name="num" value="<%=num%>"> <!-- num값은 무조건 히든으로 받아야한다 수정사항 시 제일 중요한 부분 -->
		
		<table class="table table-bordered" style="width: 750px;">
			<caption align="top"><h4>레스토랑 예약 정보 수정</h4></caption>
			<tr>
				<th width="100" style="background-color: #b0e0e6">예약자명</th>
				<td>
					<input type="text" name="name" class="form-control" placeholder="예약자이름" required="required" width="200px;" value="<%=dto.getName()%>">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color: #b0e0e6">성별</th>
				<td>
					<label>
						<input type="radio" name="gender" value="f"
						<%=dto.getGender().equalsIgnoreCase("f")?"checked":""%>>
						<img src="../image/여자.png" width="50">
					</label>
					&nbsp;
					<label>
						<input type="radio" name="gender" value="m" 
						<%=dto.getGender().equalsIgnoreCase("m")?"checked":""%>>
						<img src="../image/남자.png" width="50">
					</label>
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color: #b0e0e6">예약시간</th>
				<td>
					<input type="datetime-local" name="bookday" class="form-control" 
					style="width: 220px;" required="required" value="<%=dto.getBookday()%>">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color: #b0e0e6">인원수</th>
				<td>
					<input type="number" name="inwon" min="1" max="6" class="form-control" 
					style="width: 80px;" value="<%=dto.getInwon()%>">
				</td>
			</tr>
				<tr>
				<th width="100" style="background-color: #b0e0e6">메뉴선택</th>
				<td>
					<%
						//출력할 메뉴명
						String []inpFood={"치즈샌드위치.jpg","떡볶이.jpg","돼지갈비.jpg","똠양꿍.jpg","알밥.jpg","초밥.jpg"};
						
						//출력할 가격
						String []inpPrice={"12000","12000","23000","17000","13000","30000"};
						
						//출력할 제목
						//String []title={"치즈샌드위치","떡볶이","돼지갈비","똠양꿍","알밥","초밥"};
						
						//db에 저장된 선택 메뉴들
						String []selectFood=dto.getFoodphoto().split(",");
						
						for(int i=0; i<inpFood.length; i++)
						{
							
							//이미지명에서 파일이름만 추출
							int dot = inpFood[i].indexOf(".");
							//.위치 전까지 추출
							String title = inpFood[i].substring(0,dot);
							
							//title의 길이가 4글자 이상이면 4글자까지만 추출하기
							if(title.length()>4)
								title=title.substring(0,4); //0~3까지 추출 (한글도 1byte로 된다)
									
							boolean flag = false;
							for(int j=0; j<selectFood.length; j++)
							{
								//출력할 db의 선택된 파일명이 같은지 비교 후
								//존재할 경우 true
								if(inpFood[i].equals(selectFood[j]))
									flag=true;
							}
							%>	
							<label>
								<input type="checkbox" name="food" value="<%=inpFood[i]%>,<%=inpPrice[i]%>"
								<%=flag?"checked":""%>>
								<%=title%><br>
								<img src="../image/<%=inpFood[i]%>" width="80" height="80" border="1">
							</label>
							<%
						}
					%>
					
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color: #b0e0e6">메세지</th>
				<td>
					<textarea style="width: 500px; height: 80px;" class="form-control" required="required" name="message"><%=dto.getMessage()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-danger" style="width: 120px;">예약수정</button> <!-- 서브밋은 폼 전체를 전달 -->
					
					<button type="reset" class="btn btn-outline-danger" style="width: 120px;">다시하기</button>  <!-- 초기화 -->
					
					<button type="button" class="btn btn-outline-danger" style="width: 120px;" onclick="location.href='startbooking.jsp'">예약목록</button> <!-- 목록으로 이동 -->
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

