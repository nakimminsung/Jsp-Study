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
	div.box{
		border: 6px solid orange;
		margin-left: 200px;
		margin-bottom: 10px;
		padding: 10px 10px;
		width: 300px;
	}
</style>
</head>
<body>
	<img src="../image/01.png">
	<br>
	<button type="button" class="btn btn-outline-danger" id="btn1">data5.xml 읽기</button>
	<button type="button" class="btn btn-outline-danger" id="btn2">data6.json 읽기</button>
	<br><br>
	<div id="result">1111</div>
	
	<script type="text/javascript">
		$("#btn1").click(function() {
			//$("#result").empty();
			
			//xml읽기
			var s = "";
			$.ajax({
				type: "get",
				url: "data5.xml",
				dataType: "xml",
				success: function(data) {
					$(data).find("guest").each(function(idx,ele) {
						var e = $(ele);
						s+="<div class='box'>";
						s+="Idx:"+idx+"<br>";
						s+="Date:"+e.find("date").text()+"<br>";
						s+="Message:"+e.find("message").text()+"<br>";
						s+="photo:"+"<img src='"+e.find("photo").text()+
							"' width="+e.find("photo").attr("width")+"><br>"; 
						s+="</div>"
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
				url: "data6.json",
				dataType: "json",
				success: function(data) {
					$.each(data,function(idx,ele){
						s+="<div class='box'>";
						s+="idx:"+idx+"<br>";
						s+="Name:"+ele.name+"<br>";
						s+="Score<br>"
						
						var cnt=0, sum=0;
						$.each(ele.score,function(i,jumsoo){
							cnt++;
							s+=(i+1)+" : "+jumsoo+"점<br>";
							sum+=Number(jumsoo);
						});
						
						s+="총 "+cnt+"과목 총점:"+sum+"점 <br>";
						s+="Age:"+ele.age+"<br>";
						s+="사진<br>";
						s+="<img src='"+ele.photo+"' width=130><br>";
						
						s+="</div>"
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

