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

		<h1>답변하기</h1>

		<div style="width: 60%; margin: auto;">
			<form method="post" action="answerinsert.do">
				
				<input type="hidden" name="bq_num" value="${dto.bq_num }" /><br>
				<input type="hidden" name="member_id" value="${dbDto.member_id }" /><br>
				<input type="hidden" name="bq_title" style="width: 40%;"
					value="	Re:문의주신 내용 답변드립니다." /> <br>
				<br>
				<div class="form-group">
					<textarea id="summernote" rows="" cols="5" class="form-control"
						name="bq_content">${dto.bq_content }<br>=============================================<br></textarea>
				</div>

				<input type="submit" class="btn btn-outline-success"
				 value="글 작성" style="float: right;" />
			</form>
		</div>

		<script>
			$(document)
					.ready(
							function() {
								$('#summernote')
										.summernote(
												{
													placeholder : '내용을 입력하세요',
													tabsize : 2,
													height : 500,
													toolbar : [
															[
																	'fontname',
																	[ 'fontname' ] ],
															[
																	'fontsize',
																	[ 'fontsize' ] ],
															[
																	'style',
																	[
																			'bold',
																			'italic',
																			'underline',
																			'strikethrough',
																			'clear' ] ],
															[
																	'color',
																	[
																			'forecolor',
																			'color' ] ],
															[ 'table',
																	[ 'table' ] ],
															[
																	'para',
																	[
																			'ul',
																			'ol',
																			'paragraph' ] ],
															[
																	'height',
																	[ 'height' ] ],
															[
																	'insert',
																	[
																			'picture',
																			'link',
																			'video' ] ],
															[
																	'view',
																	[
																			'fullscreen',
																			'help' ] ] ],
													fontNames : [ 'Arial',
															'Arial Black',
															'Comic Sans MS',
															'Courier New',
															'맑은 고딕', '궁서',
															'굴림체', '굴림', '돋움체',
															'바탕체' ],
													fontSizes : [ '8', '9',
															'10', '11', '12',
															'14', '16', '18',
															'20', '22', '24',
															'28', '30', '36',
															'50', '72' ],

												});
							});
		</script>
	</div>


	<jsp:include page="footer.jsp" />

</body>
</html>