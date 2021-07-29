<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getreplylist();
});
function getreplylist(){
	var replyurl = "replylist.do";
	
	var paramData = {"br_num" : "${dto.br_num}"};
	var reply_no = ${reply.reply_no};
	
	$.ajax({
		url : replyurl ,
		type : 'POST',
		data: paramData ,
		dataType: 'JSON',
		success : function(result){
		var comments = "";
		if(result.length < 1){
			comments = "등록된 댓글이 없습니다.";
		}else{
			
			$(result).each(function(){
			comments +='<div id="reply_no'+this.reply_no+'">';
			comments +='<strong>'+'작성자 : ' + this.reply_member_id+'</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
			comments +='작성 날짜 : '+ this.reply_regdate+'<br/>';
			comments += '<p>';
			comments +='댓글 내용 : &nbsp;&nbsp;&nbsp;'+ this.reply_content;
			comments +='</p>';
			comments +='<br/>';
			comments +='<div id ="buttonshow">';
			comments +='<button type="button" class="btn btn-outline-success" onclick="updateviewBtn(' + this.reply_no + ',\'' + this.reply_regdate+'\', \''+ this.reply_content+'\', \''+ this.reply_member_id +'\')">';
			comments +='댓글수정</button>';
			comments +='<button type="button" class="btn btn-outline-success" onclick="replydelete('+this.reply_no+')">';
			comments +='댓글삭제';
			comments +='</button>';
			comments +='</div>';
			comments +='</div>';
			comments +='<br/>';
			});
				
		};
			$("#replylist").html(comments);
		}, error:function(request, error) {
			alert("fail");
			// error 발생 이유를 알려준다.
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
function replydelete(reply_no){
	
	var deleteurl = "replydelete.do";
	
	$.ajax({
		url: deleteurl,
		type : 'POST',
		data : {
			"reply_no" : reply_no
		},
		dataType: 'json',
		success: function(result){
			getreplylist();
		}
		, error:function(request, error) {
			alert("fail");
			// error 발생 이유를 알려준다.
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	
}
function updateviewBtn(reply_no, reply_regdate, reply_content, reply_member_id){<!-- 폼만 바꾸면 되는 거라서 ajax 이용 x !-->
	
	var commentsview = "";
	
	commentsview +='<div id="reply_no'+reply_no+'">';
	commentsview +='<strong>';
	commentsview +='작성자 : ' + reply_member_id;
	commentsview +='</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
	commentsview +='작성 날짜 : '+ reply_regdate;
	commentsview += '<br/><p>';
	commentsview +='댓글 내용 : &nbsp;&nbsp;&nbsp;';
	commentsview += '<textarea class="form-control" id="reply_edit_content">';
	commentsview += reply_content ;
	commentsview += '</textarea>';
	commentsview +='</p>';
	commentsview +='<br/>';
	commentsview +='<button type="button" class="btn btn-outline-success"';
	commentsview += 'onclick="updateBtn(' + reply_no + ',\'' + reply_member_id +'\')">댓글작성</button>';
	commentsview +='<button type="button" class="btn btn-outline-success" onclick="getreplylist()" >';
	commentsview +='취소';
	commentsview +='</button>';
	commentsview +='</div>';
	commentsview +='<br/>';
	
	$('#reply_no'+reply_no).replaceWith(commentsview);
	$('#reply_no'+reply_no+'#reply_content').focus();
	
};
function updateBtn(reply_no, reply_member_id){<!--update ajax!-->
	
	var updateurl = "replyupdate.do";
	var reply_content = $("#reply_edit_content").val();
	var paramData = {"reply_no" : reply_no,
			 "reply_content":reply_content
			};
	
	$.ajax({
		url: updateurl,
		type : 'POST',
		data : paramData,
		dataType: 'json',
		success: function(result){
			getreplylist();
		}
	, error:function(request, error) {
		alert("fail");
		// error 발생 이유를 알려준다.
	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	});
	
	
};
function getFormatDate(date){ <!--ajax에서는 data형식을 읽을수 없으므로 자바스크립트에서 data형식으로 바꿈 !-->
	var year = date.getFullYear();             
	var month = (1 + date.getMonth());         
	month = month >= 10 ? month : '0' + month; 
	var day = date.getDate();                   
	day = day >= 10 ? day : '0' + day;         
	return  year + '-' + month + '-' + day;      
};
$(function(){
	
	$('#replywriteBtn').click(function(){<!--insert 댓글 작성 ajax!-->
		var reply_content = $('#reply_content').val();
			reply_member_id = $('#reply_member_id').val();
		var br_num = ${dto.br_num};
		var paramData = {"br_num" : br_num,
						 "reply_content":reply_content,
						 "reply_member_id":reply_member_id
						};
			
	    var writeurl = "replywrite.do";
		$.ajax({
			url: writeurl,
			type : 'POST',
			data: paramData ,
			dataType: 'json',
			success: function(result){
				getreplylist();
				$('#reply_content').val('');
				$('#reply_member_id').val('');
			}
		, error:function(request, error) {
			alert("fail");
			// error 발생 이유를 알려준다.
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
});
	

});	
</script>
<body>
	<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">
		<div style="position: relative; left: 30%;">

			<h1>레시피공유</h1>
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
					<c:choose>
						<c:when test="${sessionScope.loginCheck eq true}">
							<c:if test="${dbDto.member_id == dto.member_id }">

								<td colspan="2" align="right"><input type="button"
									value="수정"
									onclick="location.href='updateform.do?br_num=${dto.br_num}'" />
									<input type="button" value="삭제"
									onclick="location.href='delete.do?br_num=${dto.br_num}'" />
							</c:if>
						</c:when>

					</c:choose>
					<td colspan="2" align="right"><input type="button" value="목록"
						onclick="location.href='boardList.do?'">
				</tr>

			</table>

		<hr />
		
		<div class="reply"><!-- 댓글이 들어갈 div -->
			<div id="replylist"></div>
		</div>
		
		<div class="col-md-6"><!-- 댓글 작성 div -->
			 <input type="hidden" class="form-control" id="reply_member_id" value="${dbDto.member_id }"><br />
			<label for="reply_content">댓글 내용 :</label>
			<textarea class="form-control" id="reply_content" name="reply_content"></textarea>
			<button type="button" class="btn btn-outline-success" id="replywriteBtn">댓글 작성</button>
		</div>
		<br />
		<hr />


	</div>
</div>

</body>
</html>