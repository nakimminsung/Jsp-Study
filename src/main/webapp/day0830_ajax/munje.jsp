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
</head>
<body>
	<img src="../image/01.png">
	<br>
	<button type="button" class="btn btn-outline-danger" id="btn1">data1.xml 읽기</button>
	<button type="button" class="btn btn-outline-danger" id="btn2">data2.json 읽기</button>
	<br><br>
	<div id="result">1111</div>
	
	<script type="text/javascript">
		$("#btn1").click(function() {
			//$("#result").empty();
			
			//xml읽기
			var s = "";
			$.ajax({
				type: "get",
				url: "munje1.xml",
				dataType: "xml",
				success: function(data) {
					$(data).find("sawon").each(function(idx,ele) {
						var e = $(ele);
						s+="Idx:"+idx+"<br>";
						s+="No:"+e.attr("no")+"<br>";
						s+="부서:"+e.find("buseo").text()+"<br>";
						s+="Pay:"+e.find("pay").text()+"<br>";
						s+="Sudang:"+e.find("pay").attr("sudang")+"<br>";
						
						s+="-------------------------------------<br>";
					});
					//empty로 읽을 경우 위에 empty를 선언하고, 밑에서 append로 읽는다
					//html태그로 읽는 법
					$("#result").html(s);
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
			
			//xml읽기
			var s = "";
			$.ajax({
				type: "get",
				url: "munje2.json",
				dataType: "json",
				success: function(data) {
					$.each(data,function(idx,ele){
						s+="idx:"+idx+"<br>";
						s+="Name:"+ele.name+"<br>";
						//s+="Hobby"+(ele.hobby==null?"취미없음":ele.hobby)+"<br>";
						s+="Hobby";
							if(ele.hobby==null)
								s+="취미없음<br>"
								else{
									$.each(ele.hobby,function(i,h){
										s+="["+h+"]";
									});
									s+="<br>"
								}
						s+="HP:"+(ele.hp==null?"번호없음":ele.hp)+"<br>";
						s+="Addr"+ele.addr+"<br>";
						s+="-------------------------------------<br>";
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
	
	</script>
</body>
</html>

