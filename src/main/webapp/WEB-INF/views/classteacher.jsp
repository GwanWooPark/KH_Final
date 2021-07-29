<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function classdetail(){
		alert("classdeatil로 가즈아~");
	}

</script>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn">
<div style="position:relative; left:15%;">

	<h2>강사 강의 목록</h2>

	<table class="table table-bordered w-auto">
		<col width="50">
		<col width="200">
		<col width="100">
		<col width="100">
		<c:choose>
			<c:when test="${empty dto }">
				<tr><th colspan="4">----------존재하지않는 강사 입니다----------</th></tr>
			</c:when>
			<c:otherwise>
				<!-- 강사id로 memberDto를 가져와서 해당 정보 출력 -->
				<tr>
					<c:if test="${empty dto.member_img_path || dto.member_img_path eq null }"><td><img alt="teacherImg" src="resources/upload/img/dummy.png" width="100" height="100"></td></c:if>
					<c:if test="${not empty dto.member_img_name }"><td><img alt="teacherImg" src="resources/upload/img/${dto.member_img_name }" width="100" height="100"></td></c:if>
					<td>${dto.member_name }</td>
				</tr>
				<tr><th>강사소개</th>
					<td>${dto.member_intro }<td></tr>
				<tr><th>강사자격증</th>
					<td>${dto.member_certi }</td></tr>
				<tr><th>강사경력</th>
					<td>${dto.member_career }</td></tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<br>
	<hr>
	<br>
	
	<table class="table table-bordered w-auto">
		<col width="100">	<!-- 이름 -->
		<col width="200">	<!-- 강좌이름 -->
		<col width="100">	<!-- 강좌간단소개 -->
		<col width="100">	<!-- 강좌가격 -->
		<col width="150">	<!-- 강좌등록날짜 -->
		<col width="100">	<!-- 결제버튼 -->
		<tr>
			<th>이름</th>
			<th>강의제목</th>
			<th>강의소개</th>
			<th>강의가격</th>
			<th>등록날짜</th>
			<th>결제</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr><th colspan="6">----------강좌 없음----------</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="cdto">
				<tr>
					<td>${cdto.member_name }</td>
					<td>${cdto.class_title }</td>
					<td>${cdto.class_intro }</td>
					<td>${cdto.class_price }원</td>
					<td><fmt:formatDate value="${cdto.class_regdate }"
						pattern="MM-dd HH:ss" /></td>
					<td>
						<!-- href로 바꿔서 class_num값 넘겨줘보기 우선 함수로 alert찍어보기 -->
						<a href="classdetail.do?class_num=${cdto.class_num }">결제진행</a>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>