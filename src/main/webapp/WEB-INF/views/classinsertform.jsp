<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	function confirm(){
		//alert("회원가입 버튼 클릭>>");
		
		$('input[name=class_where]').val($('#roadAddress').val()
										  + ','
				  						  + $('#jibunAddress').val()
				  						  + ','
				  						  + $('#detailAddress').val()
				  						     
									  	  + $('#extraAddress').val());
		//위에랑 기능은 같음
		/* var totalAddress = $('#roadAddress').val() + $('#jibunAddress').val() + $('#detailAddress').val() + $('#extraAddress').val();
		//alert("totalAddress = " + totalAddress);
		$('input[name=member_address]').attr('value',totalAddress); */
											  
		//alert("최종 input[name=class_where] = " + $("input[class_where]").val());
		$("form[name=classform]").submit();
	}
	

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn">
<div style="position:relative; left:15%;">
	<h1>강의 등록</h1>

	<form name="classform" action="classres.do" method="post" enctype="multipart/form-data">
		<!-- ClassDto에 저장할 때 session에 저장된 강사 id 필요함 -->
		<input type="hidden" name="teacher_id" value="${dbDto.member_id }">	
		<!-- teacherController에서 view로 갈 때 category필요 -->
		<input type="hidden" name="category" value="${dbDto.member_category }">
			<table id="class_form_table" class="table table-bordered w-auto">
				<tbody>
				<tr>
					<th>강의 이름</th>
					<td><input type="text" name="class_title"></td>
				</tr>
				<tr>
					<th>강의 소개</th>
					<td><textarea rows="10" cols="20" name="class_intro"></textarea></td>
				</tr>
				<tr>
					<th>강의 가격</th>
					<td><input type="text" name="class_price">원</td>
				</tr>
				<tr>
					<th>강의 진행 방법</th>
					<td><input type="radio" name="class_how" value="N">온라인
						<input type="radio" name="class_how" value="F">오프라인
					</td>
				</tr>
				<tr>
					<th>강의장소(오프라인시)</th>
					<td>
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" value="주소 검색" onclick="DaumPostCode()" class="btn btn-outline-success">
					<br>
					<input type="text" id="roadAddress" placeholder="도로명주소">
					<input type="text" id="jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<br>
					<input type="text" id="detailAddress" placeholder="상세주소">
					<input type="text" id="extraAddress" placeholder="참고항목">
					<input type="hidden" id="address1" name="class_where" >
					</td>
				</tr>
				<tr>
					<th>필요한 재료</th>
					<td><textarea rows="10" cols="20" name="class_ingred"></textarea></td>
				</tr>
				<tr>
					<th>강의 내용</th>
					<td><textarea rows="10" cols="20" name="class_content"></textarea></td>
				</tr>
				<tr>
					<th>강의 영상</th>
					<td><label>파일 : </label><input type="file" name="file" multiple="multiple"></td>
				</tr>
				<tr>
					<td>
						<input type="button" value="강의등록" onclick="confirm()" class="btn btn-outline-success" >
						<input type="button" value="취소" onclick="location.href='main.do'" class="btn btn-outline-danger" >		
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>