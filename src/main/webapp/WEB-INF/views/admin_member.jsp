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
    <style>
        table {
            width: 100%;
        }

        .mypage {
            display: block;
            width: 60%;
            margin: auto;
        }

        input[type=button] {
            border: none;
            background-color: white;
        }

        .mypage_body {
            width: 1200px;
            margin: 0 auto;
            height: 60%;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="main-banner wow fadeIn">
    <div class="mypage_body">
        <div id="mypage_nav" style="z-index: 1;">
            <nav>
                <ul class="mymenus">
                    <li><a href="admin_member.do">회원 목록</a></li>
                    <li><a href="admin_class.do">강의 목록</a></li>
                </ul>
            </nav>
        </div>

        <div class="mypage">
            <div class="mypage_member">
                <table class="table table-bordered">
                    <col width="60">
                    <col width="300">
                    <col width="100">
                    <col width="50">
                    <tr>
                        <th>회원 아이디</th>
                        <th>회원 이름</th>
                        <th>회원 등급</th>
                        <th>삭제</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty m_list }">
                            <tr>
                                <th colspan="4">-------------등록된 회원이 없습니다------------</th>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${m_list }" var="dto">
                                <tr>
                                    <td>${dto.member_id }</td>
                                    <td>${dto.member_name }</td>
                                    <td>${dto.member_role }</td>
                                    <td><input type="button" value="삭제" onclick="location.href='adminMemberDel.do?member_id=${dto.member_id}'"></td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <div style="display: block; text-align: center;">
                    <c:if test="${m_paging.startPage != 1 }">
                        <a href="admin_member.do?nowPage=${m_paging.startPage - 1 }&cntPerPage=${m_paging.cntPerPage}"></a>
                    </c:if>
                    <c:forEach begin="${m_paging.startPage }" end="${m_paging.endPage }" var="p">
                        <c:choose>
                            <c:when test="${p == m_paging.nowPage }">
                                <b>${p }</b>
                            </c:when>
                            <c:when test="${p != m_paging.nowPage }">
                                <a href="admin_member.do?nowPage=${p }&cntPerPage=${m_paging.cntPerPage}">${p }</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${m_paging.endPage != m_paging.lastPage}">
                        <a href="admin_member.do?nowPage=${m_paging.endPage+1 }&cntPerPage=${m_paging.cntPerPage}"></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
