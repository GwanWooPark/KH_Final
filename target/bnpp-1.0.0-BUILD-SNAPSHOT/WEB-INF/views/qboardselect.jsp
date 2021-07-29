<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
}
</style>
<body>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href = "boardList.do?nowPage=${paging.nowPage}&cntPerPage="
					+ sel
		}
	</script>

	<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">


<div style="position: relative; left: 4%; z-index: 1; width: 100px">
			<nav>
				<ul class="menus" style="list-style: none;">
					고객센터 메뉴
					<li><a href="faqboard.do">FAQ</a></li>
					<li><a href="qnalist.do">1:1문의</a></li>
				</ul>
			</nav>
		</div>

				<div style="width: 75%; margin: auto;">
				<h2>1:1 문의게시판</h2>
				<table class="table table-bordered">
					<tr>
						<th>작성자</th>
						<td>${qdto.member_id }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${qdto.bq_title }</td>
					</tr>
					<tr>
						<td colspan="2"><div id="summernote" class="form-control"
								style="width:100%; height: 100%;">${qdto.bq_content }</div></td>
					</tr>

					<tr>
						<c:if test="${dbDto.member_id == qdto.member_id }">

							<td colspan="2" align="right"><input type="button"
								value="수정" class="btn btn-outline-success"
								onclick="location.href='qnaupdateform.do?bq_num=${qdto.bq_num}'" />
						</c:if>
						<c:if test="${dbDto.member_id == 'admin' }">

							<input type="button" class="btn btn-outline-success"
								value="답변"
								onclick="location.href='answerinsertform.do?bq_num=${qdto.bq_num}'" />
								<input type="button" class="btn btn-outline-danger"
											value="삭제" onclick="location.href='qnadelete.do?bq_num=${qdto.bq_num}'" />
						</c:if>
						
						<input type="button" value="목록" class="btn btn-outline-success"
							onclick="location.href='qnalist.do?'"/></td>
					</tr>

				</table>

			</div>
		</div>





	<jsp:include page="footer.jsp" />

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>
</body>
</html>