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
</head>
<body>
	<img src="../image/01.png">
	<br>
	<button type="button" class="btn btn-outline-danger" id="btn1">data1.xml 읽기</button>
	<button type="button" class="btn btn-outline-danger" id="btn2">data2.json 읽기</button>
	<br>
	<button type="button" class="btn btn-outline-danger" id="btn3">data3.xml 읽기</button>
	<button type="button" class="btn btn-outline-danger" id="btn4">data4.json 읽기</button>
	<br>
	<br>
	<div id="result">1111</div>

	<script type="text/javascript">
	$("#btn1").click(function() {
		$("#result").empty();
		
		//xml 읽기
		$.ajax({
			type: "get",
			url: "data1.xml",
			dataType: "xml",
			success: function(data) {
				var len=$(data).length;
				//alert(len+"개");
				var s = "City:"+$(data).find("name").attr("city")+"<br>";
				s+="Name:"+$(data).find("name").text()+"<br>";
				s+="Age:"+$(data).find("age").text();
				
				$("#result").append(s);
			},
			statusCode: {
				404:function(){
					alert("xml 파일을 찾을 수 없어요");
				},
				500:function(){
					alert("서버 오류.. 코드를 다시 한번 보세요");
				}
			}
		});
	});
	
	$("#btn2").click(function() {
		$("#result").empty();
		
		//json 읽기
		$.ajax({
			type: "get",
			url: "data2.json",
			dataType: "json",
			success: function(data) {
				var s = "";
				s+="이름:"+data.name+"<br>"
				s+="주소:"+data.addr+"<br>"
				s+="점수:"+data.score+"점"
				
				$("#result").append(s);
			},
			statusCode: {
				404:function(){
					alert("json 파일을 찾을 수 없어요");
				},
				500:function(){
					alert("서버 오류.. 코드를 다시 한번 보세요");
				}
			}
		});
		$("#btn3").click(function() {
			$("#result").empty();
			
			//xml 읽기
			var s ="";
			
			$.ajax({
				type: "get",
				url: "data3.xml",
				dataType: "xml",
				success: function(data) {
					$(data).find("stu").each(function(idx,ele) {
						var e = $(ele);
						s+="Idx:"+idx+"<br>";
						s+="Name:"+e.attr("name")+"<br>";
						s+="Java:"+e.find("java").text()+"<br>";
						s+="Spring:"+e.find("spring").text()+"<br>";
						s+="HTML:"+e.find("html").text()+"<br>";
						s+="-----------------------------------<br>";
					});
					$("#result").append(s);
				},
				statusCode: {
					404:function(){
						alert("xml 파일을 찾을 수 없어요");
					},
					500:function(){
						alert("서버 오류.. 코드를 다시 한번 보세요");
					}
				}
			});
		});
		
		$("#btn4").click(function() {
			$("#result").empty();
			
			//json 읽기
			var s = "";
			$.ajax({
				type: "get",
				url: "data4.json",
				dataType: "json",
				success: function(data) {
					$.each(data,function(idx,ele){
						s+="idx:"+idx+"<br>";	
						s+="Name:"+ele.name+"<br>";	
						s+="Hobby:"+ele.hobby+"<br>";	
						s+="HP:"+ele.hp+"<br>";	
						s+="Addr:"+(ele.addr==null?"노숙자":ele.addr)+"<br>";	
					});
					$("#result").append(s);
				},
				statusCode: {
					404:function(){
						alert("json 파일을 찾을 수 없어요");
					},
					500:function(){
						alert("서버 오류.. 코드를 다시 한번 보세요");
					}
				}
			});
		});
});		
</script>
</body>
</html>

