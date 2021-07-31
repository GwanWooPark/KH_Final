<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>마이페이지(관리자)</title>
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<script>
    function selChange() {
        var sel = document.getElementById('cntPerPage').value;
        location.href = "mypage_admin.do?nowPage=${paging.nowPage}&cntPerPage=" + sel
    }
</script>
<style>
    table {
        width: 100%;
    }

    #outter {
        display: block;
        width: 60%;
        margin: auto;
    }
</style>
<body>
<jsp:include page="header.jsp"/>
    <div class="main-banner wow fadeIn">
        <div class="mypage-body">
            <div id="mypage_nav" style="z-index: 1">
               <nav>
                   <ul class="mymenus">
                       <li><a class="mymenu"><h3>회원 목록</h3></a></li>
                   </ul>
               </nav>
            </div>

            <div id="outter">
                <div style="float: right;">
                    <select id="cntPerPage" name="sel" onchange="selChange()">
                        <option value="5" <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
                        <option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                        <option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                    </select>
                </div>

                <!-- 옵션선택 끝 -->
                <table class="table table-bordered">
                    <col width="300">
                    <col width="100">
                    <col width="100">
                    <col width="50">
                    <tr>
                        <th>회원 아이디</th>
                        <th>회원 이름</th>
                        <th>회원 등급</th>
                        <th>삭제</th>
                    </tr>

                    <c:choose>
                        <c:when test="${empty list }">
                            <tr>
                                <th colspan="4">-------------등록된 멤버가 없습니다------------</th>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list }" var="dto">
                                <tr>
                                    <td>${dto.member_id }</td>
                                    <td>${dto.member_name }</td>
                                    <td>${dto.member_role }</td>
                                    <td><input type="button" value="삭제" onclick="location.href='adminMemberDel.do?member_id=${dto.member_id }'"></td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
            <div style="display: block; text-align: center;">
                <c:if test="${paging.startPage != 1 }">
                    <a href="mypage_admin.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
                </c:if>
                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
                            <b>${p }</b>
                        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <a
                                    href="mypage_admin.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:if test="${paging.endPage != paging.lastPage}">
                    <a href="mypage_admin.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"></a>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
