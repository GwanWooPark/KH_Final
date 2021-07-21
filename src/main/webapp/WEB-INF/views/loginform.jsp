<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#loginChk").hide();
	});
	
	function signUpDo(){
		location.href='signupform.do'
	}
	
	function loginDo(){
		
		var member_id = $("input[name=loginId]").val().trim();
		var member_pw = $("input[name=loginPw]").val().trim();
		
		alert(member_id + ' / ' + member_pw);
		
		//자바스크립트 객체
		var loginVal = {
				"member_id" : member_id,
				"member_pw" : member_pw
		}
		
		
		if(member_id == null || member_id == "" || member_pw == null || member_pw == ""){
			alert("아이디와 비밀번호가 제대로 입력됬는지 확인해주세요!");
		} else {
			$.ajax({
				type: "post",
				url: "ajaxlogin.do",
				data: JSON.stringify(loginVal),
				contentType: "application/json",
				dataType:"json",
				success: function(msg){
					if(msg.check == true){
						location.href="main.do";
					}else{
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW를 다시 확인해주세요");
					}
				},
				error: function(xhr, status, error){
					alert("통신 실패");
				}
			});
		}
		
	}
	
	function kakaoLogin(){
		location.href='home.do';
	}
	
</script>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn" >
	
	<div style="position:relative; left:30%;"><h1>로그인</h1>
	<h2>잘못온거면 인터셉터에 path확인해</h2>
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="loginId"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="loginPw"></td>
			</tr>
			<tr>
				<td colspan="2"id="loginChk"></td>
			</tr>
			<tr>
				<td><a href="findIdPw.do">아이디/비밀번호찾기</a></td>
				<td colspan="2" align="right">
					<input type="button" value="회원가입"  onclick="signUpDo()">
					<input type="button" value="로그인" onclick="loginDo()">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="${url}">
						<img width="223px" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
					</a>
				</td>
			</tr>
			<tr>
				<!-- 카카오 로그인 -->
				<td colspan="2" align="center">
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2e020dd405766ebb1d85e5c9a0892a99&redirect_uri=http://localhost:3334/bnpp/kakaologin.do">
						<img src="resources/img/kakao_login_medium_narrow.png" alt="kakaologin" >
					</a>
				</td>
			</tr>
			<tr>
				<td>RECAPTCHA API</td>
			</tr>
		</table>
		</div>
</div>


<jsp:include page="footer.jsp" />

</body>
</html>