<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- se폴더에서 js파일 가져오기 -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="../se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
	
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	#blah{
		position: absolute;
		left: 700px;
		top: 100px;
		width: 250px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
<div style="margin: 30px 30px; width: 600px;" >
<img id="blah" src="../image/noimage.jpeg" alt="your image" />
	<form action="smartaction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top"><h5><b><i class='fas fa-pen' style='font-size:24px'></i>
			스마트 글쓰기</b></h5></caption>
			<tr>
				<th width="100" class="table-secondary">작 성 자</th>
				<td>
					<input type="text" name="writer" class="form-control" required="required" 
					autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">대표사진</th>
				<td>
					<input type="file" name="mainphoto" required="required" onchange="readURL(this);">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">제 목</th>
				<td>
					<input type="text" name="subject" class="form-control form-control-sm" required="required" 
					autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control" id="content" name="content" 
					required="required" style="width: 100%; height: 300px; display: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-outline-danger" style="width: 120px;"
					onclick="submitContents(this)">게시글 저장</button>
					
					<button type="button" class="btn btn-outline-info" style="width: 120px;"
					onclick="location.href='smartlist.jsp'">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "../se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="../save/'+filepath+'" style="max-width:490px;" >';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>

