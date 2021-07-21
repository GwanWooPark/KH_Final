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
		location.href = "boardList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel+"&searchType=${paging.searchType}&keyword=${paging.keyword}";
	}

	$(function() {
		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();

			var url = "${pageContext.request.contextPath}/boardList.do";
			url = url + "?searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
			
			

		});

	});
</script>


<body>

<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn">
	<h2>레시피공유게시판</h2>

	<div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
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

		<table border="1">
			<col width="50">
			<col width="500">
			<col width="100">
			<col width="100">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
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
							<td>${dto.br_num }</td>
							<td><a href="select.do?br_num=${dto.br_num }">${dto.br_title }</a></td>
							<td>${dto.member_id }</td>
							<td>${dto.br_regdate }</td>
							<td>${dto.br_readcount }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="5" align="right"><input type="button" value="글작성"
					onclick="location.href='insertform.do'" /></td>
		</table>
		</div>

		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="boardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="boardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="boardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">&gt;</a>
			</c:if>
		</div>
	</div>

	<!-- search -->

	<div style="margin: 0 auto" align="center">
		<div>
			<select name="searchType" id="searchType">

				<option value="br_title">제목</option>
				<option value="br_content">본문</option>
				<option value="member_id">작성자</option>
			</select>
		</div>

		<div>
			<input type="text" name="keyword" id="keyword" value="${paging.keyword}">
		</div>
		<div>
			<button name="btnSearch" id="btnSearch">검색</button>
		</div>
	</div>

	<!-- search -->


<jsp:include page="footer.jsp" />

</body>
</html>