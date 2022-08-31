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
	
	div.buttons{
		width: 800px;
		float: right;
		margin-top: 30px;
	}
	
	div.list{
		position : absolute;
		top: 120px;
		left: 50px;
		width: 800px;
		font-size: 20px;
	}
	div.scolor{
		width: 50px;
		height: 50px;
		border: 1px solid gray;
		border-radius: 100px;
	}
	
	img.photo{
		width: 130px;
		border: 2px groove gray;
	}
	th{
		text-align: center;
	}
	ul{
		display: flex;
	}
	
	ul li{
		list-style: none;
		
		width: 200px;
	}
	ul.itemlist{
		display: flex;
	}
	ul.itemlist li{
		list-style: none;
		width: 250px;
		height: 300px;
		text-align: center;
	}
	ul.itemlist li img{
		width: 200px;
		height: 250px;
		border: 1px solid black;
		border-radius: 30px;
	}
	
</style>
</head>
<body>
<div class="buttons">
	<button type="button" class="btn btn-warning" id="btn1">Myshop-XML 출력#1</button>
	<button type="button" class="btn btn-warning" id="btn2">Myshop-XML 출력#2</button>
</div>

<div class="list">

</div>

<script type="text/javascript">
$("#btn1").click(function() {
	
	//xml읽기
	var s = "";
	$.ajax({
		type: "get",
		url: "xmlmyshop.jsp",
		dataType: "xml",
		success: function(data) {
			s+="<table class='table table-bordered'>";
			s+="<tr class='table-warning'>";
			s+="<th width=150>상품사진</th>";
			s+="<th width=150>상품명</th>";
			s+="<th width=70>색상</th>";
			s+="<th width=100>가격</th>";
			s+="<th width=150>입고일</th>";
			s+="<th width=200>작성일</th>";
			s+="</tr>";
			
			//반복문
			$(data).find("myshop").each(function(idx,item){
				s+="<tr valign=middle>";
				s+="<td align=center>";
				s+="<img class='photo' src='"+$(item).find("photo").text()+"'>";
				s+="</td>";
				
				s+="<td align=center>";
				s+=$(item).find("sangpum").text();
				s+="</td>";
				
				s+="<td align=center>";
				//s+=$(item).find("color").text();
				s+="<div class='scolor' style='background-color:"+$(item).find("color").text()+"'>";
				s+="</div>";
				s+="</td>";
				
				s+="<td align=right>";
				s+=$(item).find("price").text();
				s+="</td>";
				
				s+="<td align=center>";
				s+=$(item).find("ipgoday").text();
				s+="</td>";
				
				s+="<td align=center>";
				s+=$(item).find("writeday").text();
				s+="</td>";
				
				s+="</tr>";
			});
			s+="</table>";
			
			$("div.list").html(s);
			
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
	
	//xml읽기
	var s = "";
	s+="<ul class='itemlist'>";
	$.ajax({
		type: "get",
		url: "xmlmyshop.jsp",
		dataType: "xml",
		success: function(data) {
			$(data).find("myshop").each(function(i, element) {
				var e = $(element);
				s+="<li>";
				s+="<img src='"+e.find("photo").text()+"'>";
				s+="<p>"+e.find("sangpum").text()+"<br>";
				s+=e.find("price").text()+"</p>";
				s+="</li>";
				if((i+1)%3==0){
					s+="</ul><ul class='itemlist'>";
				}
			});
			
			s+="</ul>";
			$("div.list").html(s);
			
			
			$(".itemlist img").hover(function(){
                $(this).animate({width:'250px', height:'300px'},'fast');
                },function(){
             $(this).animate({width:'200px', height:'250px'},'fast');
                });
			
			
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

