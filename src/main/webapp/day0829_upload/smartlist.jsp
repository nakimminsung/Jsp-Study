<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.SmartDao"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
* {
	font-family: 'Jua';
}

a:link, a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: red;
}
</style>
</head>
<%
	//dao선언
	SmartDao dao = new SmartDao();
	//전체갯수
	//페이징처리에 필요한 변수들
	int totalCount = dao.getTotalCount();
	
	int perPage = 3; // 한 페이지당 보여질 글의 갯수
	int perBlock = 3; // 한 블럭당 보여질 페지의 갯수
	int startNum; // db에서 가져올 글의 시작 번호(mysql은 0번, 오라클은 1번)
	int startPage; // 각 블럭당 보여질 시작 페이지
	int endPage; // 각 블럭당 보여질 끝 페이지
	int currentPage; // 현재 페이지
	int totalPage; // 총 페이지 수
	int no; // 각 페이지당 출력할 시작 번호
	
	//현재 페이지를 읽는다 단, null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage = 1;
	else
		//계산을 해야하므로 int로 변환
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	// 총 페이지 수를 구한다
	// 총글의갯수/한페이지당 보여질 갯수로 나눔 (7/5=1)
	// 나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	totalPage = totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각 블럭당 보여질 시작 페이지
	//perBlock=5 일 경우 현재 페이지가 1~5일 경우는 시작페이지가 1, 끝페이지가 5
	//만약 현재 페이지가 13일 경우 시작페이지가 11,끝페이지가 15
	startPage = (currentPage-1)/perBlock*perBlock+1;
	endPage = startPage+perBlock-1;
	
	//총 페이지 수가 23개일 경우 마지막 블럭은 끝페이지가 25가 아니라 23이여야 한다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각페이지에서 보여질 시작 번호
	//예: 1페이지 -> 0, 2페이지: 5, 3페이지: 10...
	startNum=(currentPage-1)*perPage;
	
	//각페이지당 출력할 시작 번호 구하기
	//예: 총 글갯수가 23이라면 1페이지는 23부터 시작, 2페이지는 18, 3페이지는 13...
	no = totalCount-(currentPage-1)*perPage;
	
	//페이지에서 보여질 글만 가져오기
	List<SmartDto> list = dao.getPagingList(startNum, perPage);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
%>
<body>
	<div style="margin: 30px auto; width: 800px;">

		<br> <br>
		<h6>
			<b>총 : <%=totalCount%>개의 게시글이 있습니다
			</b>
		</h6>
		<table class="table table-bordered">
			<caption align="top">
				<h5>
					<b>스마트 게시판</b>
				</h5>
			</caption>
			<tr class="table-light" align="center">
				<th width="50">선택</th>
				<th width="50">번호</th>
				<th width="400">제목</th>
				<th width="100">작성자</th>
				<th width="150">작성일</th>
				<th>조회</th>
			</tr>
			<%
		if(totalCount==0){%>
			<tr>
				<td colspan="6" align="center">
					<h6>
						<b>등록된 게시글이 없습니다</b>
					</h6>
				</td>
			</tr>
			<%}else{
			for(SmartDto dto:list){
			%>
			<tr>
				<td align="center"><input type="checkbox" class="alldel" value="<%=dto.getNum()%>"></td>
				<td align="center"><%=no--%></td>
				<td>
					<!-- 제목 --> 
				<a href="contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>">
						<span style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 200px;">
						<img src="../save/<%=dto.getMainphoto()%>"style="width: 40px; border: 1px;"> &nbsp;&nbsp; 
						<!-- 제목이 길 경우 자동으로 .. 하기 -->
						<b><%=dto.getSubject()%><b></span>
				</a>
				</td>
				<td align="center"><%=dto.getWriter()%></td>

				<td align="center"><%=sdf.format(dto.getWriteday())%></td>

				<td align="center"><%=dto.getReadcount()%></td>
			</tr>
			<%}%>
			<tr>
				<td colspan="6"><input type="checkbox" class="alldelcheck">전체선택
					<span style="float: right;">
						<button type="button" class="btn btn-danger btn-sm" id="btndel">삭제</button>
						&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm"
							onclick="location.href='smartform.jsp'">
							<i class="bi bi-pencil-fill"></i> 글쓰기
						</button>
					</span>
				</td>
			</tr>
			<%}//else
		%>
		</table>

		<!-- 페이지 번호 출력 -->
		<div style="width: 750px; class="container mt-3">
		<ul class="pagination justify-content-center" >
		<%
		if(startPage>1){%>
				<li class="page-item">
				<a class="page-link" href="smartlist.jsp?currentPage=<%=startPage-1%>">이전</a></li>
				<%}
			for(int pp = startPage; pp<=endPage; pp++){
				if(pp==currentPage){%>
				<li class="page-item">
					<a class="page-link" href="smartlist.jsp?currentPage=<%=pp%>"
					style="color: red; border: 1px solid gray;"><%=pp%></a>
				</li> 
				&nbsp;
				<%}else{%>
				<li class="page-item">
					<a class="page-link" href="smartlist.jsp?currentPage=<%=pp%>" 
					style="color: black;"><%=pp%></a>
				</li>
				&nbsp;
				<%}
			}
		//다음
		if(endPage<totalPage){%>
				<li class="page-item">
					<a class="page-link" href="smartlist.jsp?currentPage=<%=endPage+1%>">다음</a>
				</li>
				<%}
		%>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		//전체 체크 클릭시 체크값 얻어서 모든 체크값 전달하기
		$(".alldelcheck").click(function() {
			//전체 체크값 얻기
			var chk=$(this).is(":checked");
			console.log(chk);
			
			//전체 체크값을 글앞에 체크에 일괄 전달하기
			$(".alldel").prop("checked",chk)
		});
		
		//삭제 버튼 클릭시 삭제
		$("#btndel").click(function() {
			//체크를 안했을 경우 최소 1개 이상의 글을 선택해주세요 라고 출력
			
			//체크된 길이 구하기
			var len=$(".alldel:checked").length;
			if(len==0){
				alert("최소 1개 이상의 글을 선택해주세요");
			}else{
				var a = confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요");
				
				if(a){
					//체크된 곳의 value값(num) 얻기
					var n = "";
					$(".alldel:checked").each(function() {
						n+=$(this).val()+",";
					});
					
					//마지막 컴마 제거하기
					n = n.substring(0, n.length-1);
					console.log(n);
					
					//삭제 파일로 get 방식 전송
					location.href = "alldelete.jsp?nums="+n
				}
			}
		});
	</script>
</body>
</html>

