<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".comment-update-form").hide();
		$("#replyListDiv").on("click", ".replyUpdateBtn", function() {
			$(".comment-update-form").slideToggle(200);
		});

		//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
		$(".comment-update-form").on("submit", function() {
			var url = $(this).attr("action");
			//폼에 작성된 내용을 query 문자열로 읽어온다.
			// reply_no=댓글번호&reply_content=댓글내용
			var data = $(this).serialize();
			//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
			var $this = $(this);
			$.ajax({
				url : url,
				method : "post",
				data : data,
				success : function(responseData) {
					// responseData : {isSuccess:true}
					if (responseData.isSuccess) {
						alert("수정완료");
						//폼을 안보이게 한다 
						$this.slideUp(200);
						//폼에 입력한 내용 읽어오기
						var content = $this.find("textarea").val();
						// reply_content에 수정 반영하기 
						$("#reply_content").text(content);
						location.reload();
					}
				}
			});
			//폼 제출 막기 
			return false;

		});

		$("#replyListDiv").on("click", ".replyDeleteBtn", function() {

			var reply_no = $(this).attr("name");
			var isDelete = confirm("확인을 누르면 댓글이 삭제 됩니다.");
			if (isDelete) {
				//페이지 전환 없이 ajax요청을 통해서 삭제하기
				$.ajax({
					url : "replydelete.do",
					method : "post",
					data : {
						"reply_no" : reply_no
					}, // 삭제할 댓글의 번호 전송
					success : function(responseData) {
						if (responseData.isSuccess) {
							alert("삭제완료");
							location.reload();
						}
					}
				});
			}

		});

		$("#btnRecommend").click(function() {
			if (confirm("해당 글을 추천하시겠습니까?")) {
				document.form1.action = "recommend.do";
				document.form1.submit();

				alert("해당 글을 추천하였습니다.")

			}
		});

	});
</script>
<body>
	<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">

		<h1>DETAIL</h1>
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${dto.member_id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.br_title }</td>
			</tr>
			<tr>
				<th></th>
				<td><div id="summernote" class="form-control"
						style="width: 600px; height: 100%;">${dto.br_content }</div></td>
			</tr>

			<tr>
				<td colspan="2" align="center">${dto.br_reccount }<input
					type="button" class="btnRecommend" value="추천" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" value="수정"
					onclick="location.href='updateform.do?br_num=${dto.br_num}'" /> <input
					type="button" value="삭제"
					onclick="location.href='delete.do?br_num=${dto.br_num}'" /> <input
					type="button" value="목록" onclick="location.href='boardList.do?'" /></td>
			</tr>
		</table>


		<h1>REPLY</h1>
		<div id="replyListDiv">

			<div>
				<c:forEach items="${replylist}" var="reply">
					<div>
						<div align="left">${reply.reply_member_id}</div>

						<div>
							<fmt:formatDate value="${reply.reply_regdate}"
								pattern="yyyy-MM-dd" />
							<input type="button" class="replyUpdateBtn"
								name="${reply.reply_no }" value="수정"> <input
								type="button" name="${reply.reply_no }" class="replyDeleteBtn"
								value="삭제">
						</div>
					</div>
					<div>
						<div id="reply_content">${reply.reply_content }</div>
						<form class="comment-update-form" action="replyupdateres.do"
							method="post">
							<input type="hidden" name="reply_no" value="${reply.reply_no }" />
							<textarea name="reply_content">${reply.reply_content }</textarea>
							<button type="submit">수정완료</button>
						</form>
					</div>
				</c:forEach>
			</div>


		</div>



		<div>
			<form method="post" action="replyinsert.do">
				<div>
					<input type="hidden" name="br_num" value="${dto.br_num }" />
					<p>
						<input type="hidden" name="reply_member_id"
							value="${dbDto.member_id }">
					</p>
					<p>
						<textarea rows="2" cols="60" name="reply_content"></textarea>
						<button type="submit">댓글 작성</button>
					</p>
					</div>
			</form>

		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({});
		});
	</script>


	<jsp:include page="footer.jsp" />

</body>
</html>