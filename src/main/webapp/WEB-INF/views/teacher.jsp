<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function alt(){
		
		location.href="classform.do"
	}

	function after(){
		var msg = "${msg}";
		
		if(msg == "success"){
			alert("강의 저장 성공!");
		}else{
			alert("강의 저장 실패!");
		}
	}

</script>
</head>
<style>

.card-img, .card-img-top, .card-img-bottom{

width: 150px;

}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<jsp:include page="header.jsp" />
	<div class="main-banner wow fadeIn">

	

	
		<div class="row" style="padding-left: 15%;">
			<h1>${category} 카테고리</h1>
			<h3>${category} 강사</h3>
			<div>
			<c:if test="${dbDto.member_role == 'T' }"><button type="button" class="btn btn-outline-success" onclick="alt()">강의등록</button></c:if>
			</div>
			
				<c:choose>
					<c:when test="${empty list }">
						<p>---------등록된 강사가 없습니다---------<p>
					</c:when>
					<c:otherwise>
						<!-- MemberDto list 가져온 것-->
						<c:forEach items="${list }" var="dto">
							<div class="col-lg-2 col-sm-3 col-10 offset-sm-0 offset-1"  style="width:20%;">
								<div class="card">
								<c:if test="${empty dto.member_img_path || dto.member_img_path eq null }"><img  class="card-img-top" alt="teacherImg" src="resources/upload/img/dummy.png"></c:if>
								<c:if test="${not empty dto.member_img_name }"><img class="card-img-top" alt="teacherImg" src="resources/upload/img/${dto.member_img_name }"></c:if>
									<div class="card-body">
										<p class="card-text" style="height: 40px;">
											<a href="classdetailteacher.do?teacher_id=${dto.member_id }">${dto.member_name }</a></td>
										</p>
										<hr>
										<p>${dto.member_intro }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			
		</div>
	</div>

</body>
</html>