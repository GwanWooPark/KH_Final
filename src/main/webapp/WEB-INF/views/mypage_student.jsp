<%@page import="com.kh.bnpp.sms.SMS"%>
<%@page import="com.kh.bnpp.model.dto.MemberDto"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.kh.bnpp.model.biz.FoodBizImpl"%>
<%@page import="com.kh.bnpp.model.biz.PayBizImpl"%>
<%@page import="com.kh.bnpp.model.dto.FoodDto"%>
<%@page import="com.kh.bnpp.model.biz.FoodBiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bnpp.model.biz.PayBiz"%>
<%@page import="com.kh.bnpp.model.dto.PayDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(수강생)</title>
<link href="resources/css/mypage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">
	$(function() {
		$('.mymenus li').click(function() {
			$('.mymenus li').find('a').removeClass('active');
			$(this).find('a').addClass('active');
			$('.mypage').hide();
			var i = $(this).index();
			$('.mypage').eq(i).show();
		});
		$('.mymenus li').eq(0).trigger('click');
	});
	
	$(function() {
		$( "#datepicker" ).datepicker({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'
		  });
	});
		
	function check() {
		var member_phone = $('input[name=member_phone_1]').val() + "-"
				+ $('input[name=member_phone_2]').val() + "-"
				+ $('input[name=member_phone_3]').val();
		$('input[name=member_phone]').attr('value', member_phone);
		var member_addr = $('input[name=member_addr_1]').val() + ","
				+ $('input[name=member_addr_2]').val() + ","
				+ $('input[name=member_addr_3]').val() + ","
				+ $('input[name=member_addr_4]').val();
		$('input[name=member_address]').attr('value', member_addr);
	}
	
	function DaumPostCode(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	}
	
	function test(){
		var p1 = $('#password1').val();
		var p2 = $('#password2').val();
		
		if(p1 != p2){
			$("#pw_msg").text("비밀번호를 다시 입력해주세요");
		} else if(p1 == p2){
			$("#pw_msg").text("비밀번호가 일치합니다");
		}
	}

	$(function () {
		$('a').click(function () {
			var roomId = $(this).attr("class").replace('https://146.56.135.129:3000/', '');
			var pass = prompt("비밀번호를 입력하세요 : " );
			$.ajax({
				url: "roomPass.do",
				method: "POST",
				data: {"roomId" : roomId, "pass": pass},
				success: function () {
					location.href = "https://146.56.135.129:3000/" + roomId;
				}
			})
		});
	});
	
</script>
</head>
<body>

<jsp:include page="header.jsp" />
	<div class="main-banner wow fadeIn">
	<div class="mypage-body">
		<div id="mypage_nav" style="z-index: 1; ">
			<nav>
				<ul class="mymenus" >
					<li><a class="mymenu">나의 수강 목록</a></li>
					<li><a class="mymenu">나의 냉장고</a></li>
					<li><a class="mymenu">회원정보수정</a></li>
					<li><a class="mymenu">회원탈퇴</a></li>
					<li><a class="mymenu">화상강의</a></li>
				</ul>
			</nav>
		</div>
		
		<div class="mypage">
			<h3>나의 수강 목록</h3>
			<br>
			<div class="mypage_lecture">
				<div>
					<c:choose>
						<c:when test="${empty c_list }">
							<span>----------수강한 강의가 없습니다----------</span>
						</c:when>
						<c:otherwise>
							<ul>
								<c:forEach items="${c_list }" var="dto">
									<li class="lecture_list">
										<div class="lecture_img_div">
											<!-- 사진 넣을곳 -->
										</div>
										<div class="lecture_info">
											<span class="lecture_info_num">${dto.class_num }</span>
											<span class="lecture_info_name"><a href="">${dto.class_title }</a></span>
											<span class="lecture_info_category">${dto.member_category }</span>
											<span class="lecture_info_money">${dto.class_price }원</span>
											<span class="lecture_info_teacher">${dto.member_name }</span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="mypage">
			<h2>나의 냉장고</h2>
			<br>
			<div class="mypage_food">
					<form action="foodlifeupdateres.do" method="post">
					<input type="hidden" name="member_id" value="${m_dto.member_id }">
					<table class="table table-bordered">
						<col width="50"/>
						<col width="50"/>
						<tr>
							<th>식품명</th>
							<th>유통기한</th>
						</tr>
						<c:choose>
							<c:when test="${empty f_list}">
								<tr>
									<th>---------------------등록된 식품이 없습니다----------------------</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${f_list }" var="dto" varStatus="status">
										<tr>
											<td><input type="text" name="food_list[${status.index }].food_name" value="${dto.food_name }" /></td>
											<td>
												<input type="hidden" name="food_list[${status.index }].food_num" value="${dto.food_num }"/>
												<c:choose>
													<c:when test="${empty dto.food_life}">
														<input type="text" name="food_list[${status.index }].food_life" id="datepicker" value="미설정" />
													</c:when>
													<c:otherwise>
														<input type="text" name="food_list[${status.index }].food_life" id="datepicker" value="${dto.food_life }" />
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<tr>
							<td colspan="4" align="right">
								<input type="submit" class="btn btn-outline-success"  value="수정사항 적용" />
								<input type="button" class="btn btn-outline-success" value="영수증 스캔목록" onclick="location.href='./receiptupload.do?member_id=${m_dto.member_id}'"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<div class="mypage">
			<h2>회원 정보수정</h2>
			<br>
			<div class="join_table">
				<form action="studentupdateres.do"> 
					<div id="general_signup_idpw">
							<div class="general_signup_row">
								<h4 class="general_signup_title">아이디</h4>
								<div class="general_signup_id">
									<span class="general_signup_span">
										<input class="general_signup_text" name="member_id" value="${m_dto.member_id }" readonly="readonly" />
									</span>
								</div>
							</div>
							<div class="general_signup_row">
								<h4 class="general_signup_title">비밀번호</h4>
								<input type="button" value="비밀번호 변경" class="btn btn-outline-success"  onclick="location.href='./updatepw.do?member_id=${m_dto.member_id}'">
							</div>
						</div>
						<div id="general_signup_info">
							<div class="general_signup_row">
								<h4 class="general_signup_title">이름</h4>
								<div class="general_signup_name">
									<span class="general_signup_span">
										<input class="general_signup_text" type="text" name="member_name" value="${m_dto.member_name }" readonly="readonly">
									</span>
								</div>
							</div>
						</div>
						
						<div class="general_signup_row">
							<h4 class="general_signup_title">이메일</h4>
							<div class="general_signup_email">
								<span class="general_signup_span">
									<input type="text" id="general_signup_email" name="member_email" maxlength="30" value="${m_dto.member_email }">
								</span>
							</div>
						</div>
							
						<%
						MemberDto m_dto = (MemberDto)request.getAttribute("m_dto");
						String[] phone_num = m_dto.getMember_phone().split("-");
						%>
						<div class="general_signup_row">
							<h4 class="general_signup_title">휴대폰</h4>
							<div class="general_signup_moblie_phone">
								<span class="general_signup_span">
									<input type="hidden" name="member_phone" value="">
									<input class="general_signup_phone" type="text" name="member_phone_1" maxlength="3" size="3" value="<%=phone_num[0]%>">
									-
									<input class="general_signup_phone" type="text" name="member_phone_2" maxlength="4" size="3" value="<%=phone_num[1]%>">
									-
									<input class="general_signup_phone" type="text" name="member_phone_3" maxlength="4" size="3" value="<%=phone_num[2]%>">
								</span>
							</div>
						</div>
						
						<%
							String[] addr = new String[4];
							String[] addrex = m_dto.getMember_address().split(",");
							if (addrex.length > 3) {
								addr = m_dto.getMember_address().split(",");
							} else {
								addr[0] = " ";
								addr[1] = " ";
								addr[2] = " ";
								addr[3] = " ";
							}
						%>
						<div class="general_signup_row">
							<h4 class="general_signup_title">주소</h4>
							<div class="general_signup_home_addr">
								<span class="general_signup_span_home_addr">
									<input type="text" id="postcode" placeholder="우편번호">
									<input type="button" value="주소 검색" class="btn btn-outline-success"  onclick="DaumPostCode()">
									<br>
									<input type="text" id="roadAddress" name="member_addr_1" class="general_signup_addr"  placeholder="도로명주소" value="<%=addr[0]%>">
									<input type="text" id="jibunAddress" name="member_addr_2" class="general_signup_addr"  placeholder="지번주소" value="<%=addr[1]%>">
									<span id="guide" style="color:#999;display:none"></span>
									<input type="text" id="detailAddress" name="member_addr_3" class="general_signup_addr"  placeholder="상세주소" value="<%=addr[2]%>">
									<input type="text" id="extraAddress" name="member_addr_4" class="general_signup_addr"  placeholder="참고항목" value="<%=addr[3]%>">
									<input type="hidden" name="member_address" value="" >
								</span>
							</div>
						</div>
						
						<div id="general_signup_btn">
							<input type="submit" value="회원정보수정" class="btn btn-outline-success"  style="font-weight: bold" onclick="check();" />
						</div>
				</form>
			</div>
		</div>
		<div class="mypage">
			<form action="memberdelete.do" method="post">
				<h3>회원탈퇴</h3>
				<div id="general_signup_idpw">
					<div class="general_signup_row">
						<h4 class="general_signup_title">아이디</h4>
						<div class="general_signup_id">
							<span class="general_signup_span">
								<input class="general_signup_text" type="text" value="<%=m_dto.getMember_id()%>" readonly="readonly" />
							</span>
						</div>
					</div>
				<div class="general_signup_row">
						<h4 class="general_signup_title">비밀번호</h4>
						<div class="general_signup_pw">
							<span class="general_signup_span">
								<input class="general_signup_text" type="password" id="password1" name="member_password" >
							</span>
						</div>
					</div>
					<div class="general_signup_row">
						<h4 class="general_signup_title">비밀번호 확인</h4>
						<div class="general_signup_pw">
							<span class="general_signup_span">
								<input class="general_signup_text" type="password" id="password2" name="member_password_chk" >
								<input type="button" onclick="test();" value="비밀번호확인">
							</span>
						</div>
					</div>
					<span id="pw_msg"></span>
				</div>
				<div id="general_signup_btn">
					<button type="submit" class="btn btn-outline-danger" style="font-weight: bold">회원 탈퇴</button>
				</div>
			</form>
		</div>

		<div class="mypage">
			<h3>방 목록</h3>
			<br/>
			<div class="mypage_rtc">
				<c:choose>
					<c:when test="${empty r_list }">
						<span>----------생성된 방이 없습니다----------</span>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach items="${r_list }" var="r_dto">
								<li class="rtc_list">
									<a href="#" class="${r_dto.rtc_room }">${r_dto.rtc_title}</a>
								</li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />

	<!-- Scripts -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/js/owl-carousel.js"></script>
	<script src="resources/assets/js/animation.js"></script>
	<script src="resources/assets/js/imagesloaded.js"></script>
	<script src="resources/assets/js/templatemo-custom.js"></script>

</body>
</html>