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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
            $(document).ready(function(){
                
                var status = false; //수정과 대댓글을 동시에 적용 못하도록
                
             /*   $("#list").click(function(){
                    location.href = "/board/list";
                });
             */   
                //댓글 저장
                $("#reply_save").click(function(){
                   
                    
                    if($("#reply_content").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_content").focus();
                        return false;
                    }
                    
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
                    
                    //값 셋팅
                    var objParams = {
                    		board_id        : $("#rb_num").val(),
                            reply_content   : reply_content
                            reply_writer    : $("#reply_member_id").val()
                    };
                    
                    var reply_id;
                    
                    //ajax 호출
                    $.ajax({
                        url            :    "/replysave.do",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_no;
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    var reply_area = $("#reply_area");
                    
                    var reply = 
                        '<tr reply_type="main">'+
                        '    <td width="820px">'+
                        reply_content+
                        '    </td>'+
                        '    <td width="100px">'+
                        $("#reply_writer").val()+
                        '    </td>'+
                        '    <td align="center">'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="reply_del" r_type = "main" reply_id = "'+reply_id+'">삭제</button>      '+
                        '    </td>'+
                        '</tr>';
                        
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                    $("#reply_content").val("");
                    
                });
</script>

	<h1>REPLY</h1>
	   <!-- 댓글목 -->
	   <table>
	                   <c:forEach var="replyList" items="${replyList}" varStatus="status">
                    <tr reply_type="<c:if test="${replyList.reply_tab == '0'}">main</c:if><c:if test="${replyList.reply_tab == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
                        <td width="820px">
                            <c:if test="${replyList.reply_tab == '1'}"> → </c:if>${replyList.reply_content}
                        </td>
                        <td width="100px">
                            ${replyList.reply_member_id}
                        </td>
                        <td align="center">
                            <c:if test="${replyList.reply_tab != '1'}">
                                <button name="reply_reply" parent_id = "${replyList.reply_no}" reply_id = "${replyList.reply_no}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
                            </c:if>
                            <button name="reply_modify" parent_id = "${replyList.reply_groupno}" r_type = "<c:if test="${replyList.reply_tab == '0'}">main</c:if><c:if test="${replyList.reply_tab == '1'}">sub</c:if>" reply_id = "${replyList.reply_no}">수정</button>
                            <button name="reply_del" r_type = "<c:if test="${replyList.reply_tab == '0'}">main</c:if><c:if test="${replyList.reply_tab == '1'}">sub</c:if>" reply_id = "${replyList.reply_no}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
               </table>
	
		<!-- 댓글공간 -->
		 <table border="1" width="1200px" id="reply_area">
                   <tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                       <td colspan="4"></td>
                   </tr>
                   <!-- 댓글이 들어갈 공간 -->
                   
                   <c:forEach var="replyList" items="${replyList}" varStatus="status">
                    <tr reply_type="<c:if test="${replyList.reply_tab == '0'}">main</c:if>
                    <c:if test="${replyList.reply_tab == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
                        <td width="820px">
                            <c:if test="${replyList.reply_tab == '1'}"> → </c:if>${replyList.reply_content}
                        </td>
                        <td width="100px">
                            ${replyList.reply_member_id}
                        </td>
                        <td align="center">
                            <c:if test="${replyList.reply_tab != '1'}">
                                <button name="reply_reply" parent_id = "${replyList.reply_no}" reply_id = "${replyList.reply_no}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
                            </c:if>
                            <button name="reply_modify" parent_id = "${replyList.reply_tab}" r_type = "<c:if test="${replyList.reply_tab == '0'}">main</c:if><c:if test="${replyList.reply_tab == '1'}">sub</c:if>" reply_id = "${replyList.reply_no}">수정</button>
                            <button name="reply_del" r_type = "<c:if test="${replyList.reply_tab == '0'}">main</c:if><c:if test="${replyList.reply_tab == '1'}">sub</c:if>" reply_id = "${replyList.reply_no}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
               </table>
		
 
</body>
</html>