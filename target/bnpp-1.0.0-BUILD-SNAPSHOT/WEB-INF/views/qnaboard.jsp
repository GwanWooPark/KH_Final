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

a {
	text-decoration: none;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "qnalist.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel
	}
</script>


<body>

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

			<h2>1:1 문의게시판</h2>

			<div id="outter">
				<div style="float: right;">
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="10"
							<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
							보기</option>
					</select>
				</div>
				<!-- 옵션선택 끝 -->

				<table class="table table-bordered">
					<col width="300">
					<col width="100">
					<col width="100">
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>

					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<th colspan="4">-------------작성된 글이 없습니다------------</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td><a href="qnaselect.do?bq_num=${dto.bq_num }">${dto.bq_title }</a></td>
									<td>${dto.member_id }</td>
									<td><fmt:formatDate value="${dto.bq_regdate }"
											pattern="MM-dd HH:ss" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.loginCheck eq true}">
							<c:if test="${not empty dbDto.member_id}">
								<tr>
									<td colspan="5" align="right"><input type="button" class="btn btn-outline-success"
										value="글작성" onclick="location.href='qnainsertform.do'" /></td>
										
									</tr>
								</c:if>
						</c:when>
					</c:choose>
				</table>
			</div>

			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="qnalist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="qnalist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="qnalist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</div>
	</div>


	</div>




</body>
</html>