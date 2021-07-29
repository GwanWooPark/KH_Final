<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		var responseMessage = "${message}" ;
	    if(responseMessage == "success"){
	        alert("프로필 사진 변경 성공!");
		    window.close();
	    }else if(responseMessage == "fail"){
	    	alert("프로필 사진 변경 실패");
		    window.close();
	    }else if(responseMessage == "empty"){
	    	alert("빈 파일은 저장할 수 없습니다.");
		    window.close();
	    }
	    
	    
	}) 

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>${dbDto.member_id }님 프로필사진 변경</h2>

	<form action="imgupload.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="${dbDto.member_id }">
		<label>파일 : </label>
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value="사진변경">
	</form>
	
	

</body>
</html>