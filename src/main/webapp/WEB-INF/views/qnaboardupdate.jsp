<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn">
	<h1>UPDATE</h1>
	<div style="width: 60%; margin: auto;">
	<form action="qnaupdateres.do" method="post">
	<input type="hidden" name="bq_num" value="${dto.bq_num }"/>
	<table class="table table-bordered">
		<tr>
			<th>작성자</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="bq_title" value="${dto.bq_title }"/></td>
		</tr>
		<tr>
			<th></th>
			<td><textarea id="summernote" rows="10" cols="50"
					class="form-control" name="bq_content">${dto.bq_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" class="btn btn-outline-success" value="수정" />
				<input type="button" class="btn btn-outline-danger" value="취소" onclick="location.href='qnalist.do?'"/>
			</td>
		</tr>

	</table>
	</form>
	</div>
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
						
			  });
			});
	</script>
	

<jsp:include page="footer.jsp" />
</body>
</html>