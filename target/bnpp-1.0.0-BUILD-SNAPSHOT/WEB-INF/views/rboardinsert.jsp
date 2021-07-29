<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">

		<h1>INSERT</h1>

		<div style="width: 60%; margin: auto;">
			<form method="post" action="insertres.do">
				<input type="hidden" name="member_id" value="${dbDto.member_id }" /><br>
				<input type="text" name="br_title" style="width: 40%;"
					placeholder="제목" /> <br> <br>
				<div class="form-group">
					<textarea id="summernote" rows="" cols="5" class="form-control"
						name="br_content"></textarea>
				</div>

				<input type="submit" class="btn btn-outline-success" value="글 작성" style="float: right;" />
				<input type="button" value="취소" class="btn btn-outline-danger" onclick="location.href='boardList.do?'"/>
			</form>
		</div>

		<script>
$(document).ready(function() {
	  $('#summernote').summernote({
		    placeholder: '내용을 입력하세요',
		    tabsize: 2,
		    height: 500,
		    toolbar: [
		    	['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
		    ],
		    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: { 
							onImageUpload : function(files){ 
							sendFile(files[0]); }

				        }
			
	  });
	});
function sendFile(file) {
	var data = new FormData(); 
	data.append("file",file); 
	$.ajax({ url: "/Users/melody/Documents/upload/",
			type: "POST", 
			enctype: 'multipart/form-data', 
			data: data, 
			cache: false, 
			contentType : false, 
			processData : false, 
			success: function(image){ 
				$('#summernote').summernote('insertImage',image); 
				}
			, error: function(e){console.log(e);} }); }

</script>
	</div>


	<jsp:include page="footer.jsp" />

</body>
</html>