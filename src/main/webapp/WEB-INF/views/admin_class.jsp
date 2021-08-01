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
            <div class="mypage_class">
                <table class="table table-bordered">
                    <col width="100">
                    <col width="150">
                    <col width="100">
                    <col width="150">
                    <tr>
                        <th>강사 아이디</th>
                        <th>강의명</th>
                        <th>강의 가격</th>
                        <th>삭제</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty c_list }">
                            <tr>
                                <th colspan="4">-------------등록된 강의가 없습니다------------</th>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${c_list }" var="dto">
                                <tr>
                                    <td>${dto.teacher_id }</td>
                                    <td>${dto.class_title }</td>
                                    <td>${dto.class_price }</td>
                                    <td><input type="button" value="삭제" onclick="location.href='adminClassDel.do?class_num=${dto.class_num}'"></td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <div style="display: block; text-align: center;">
                    <c:if test="${c_paging.startPage != 1 }">
                        <a href="admin_class.do?nowPage=${c_paging.startPage - 1 }&cntPerPage=${c_paging.cntPerPage}"></a>
                    </c:if>
                    <c:forEach begin="${c_paging.startPage }" end="${c_paging.endPage }" var="p">
                        <c:choose>
                            <c:when test="${p == c_paging.nowPage }">
                                <b>${p }</b>
                            </c:when>
                            <c:when test="${p != c_paging.nowPage }">
                                <a href="admin_class.do?nowPage=${p }&cntPerPage=${c_paging.cntPerPage}">${p }</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${c_paging.endPage != c_paging.lastPage}">
                        <a href="admin_class.do?nowPage=${c_paging.endPage+1 }&cntPerPage=${c_paging.cntPerPage}"></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
