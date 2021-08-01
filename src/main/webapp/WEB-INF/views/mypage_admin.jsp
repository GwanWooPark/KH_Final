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
    function m_selChange() {
        var sel = document.getElementById('m_cntPerPage').value;
        location.href = "mypage_admin.do?nowPage=${m_paging.nowPage}&cntPerPage=" + sel
    }

    function c_selChange() {
        var sel = document.getElementById('c_cntPerPage').value;
        location.href = "mypage_admin.do?nowPage=${c_paging.nowPage}&cntPerPage=" + sel
    }
</script>
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
</style>
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
</script>
<body>

<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn">
    <div class="mypage-body">
        <div id="mypage_nav" style="z-index: 1;">
            <nav>
                <ul class="mymenus">
                    <li><a class="mymenu">회원 목록</a></li>
                    <li><a class="mymenu">강의 목록</a></li>
                </ul>
            </nav>
        </div>

        <div class="mypage">
            <div class="mypage_member">
                <div style="float: right;">
                    <select id="m_cntPerPage" name="sel" onchange="m_selChange()">
                        <option value="5" <c:if test="${m_paging.cntPerPage == 5}">selected</c:if>>5줄  보기</option>
                        <option value="10" <c:if test="${m_paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                        <option value="15" <c:if test="${m_paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                    </select>
                </div>
            <!-- 옵션선택 끝 -->

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
                        <a href="mypage_admin.do?nowPage=${m_paging.startPage - 1 }&cntPerPage=${m_paging.cntPerPage}">&lt;</a>
                    </c:if>
                    <c:forEach begin="${m_paging.startPage }" end="${m_paging.endPage }" var="p">
                        <c:choose>
                            <c:when test="${p == m_paging.nowPage }">
                                <b>${p }</b>
                            </c:when>
                            <c:when test="${p != m_paging.nowPage }">
                                <a href="mypage_admin.do?nowPage=${p }&cntPerPage=${m_paging.cntPerPage}">${p }</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${m_paging.endPage != m_paging.lastPage}">
                        <a href="mypage_admin.do?nowPage=${m_paging.endPage+1 }&cntPerPage=${m_paging.cntPerPage}">&gt;</a>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="mypage">
            <div class="mypage_class">
                <div style="float: right;">
                    <select id="c_cntPerPage" name="sel" onchange="c_selChange()">
                        <option value="5" <c:if test="${c_paging.cntPerPage == 5}">selected</c:if>>5줄  보기</option>
                        <option value="10" <c:if test="${c_paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                        <option value="15" <c:if test="${c_paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                    </select>
                </div>
                <!-- 옵션선택 끝 -->

                <table class="table table-bordered">
                    <col width="90">
                    <col width="150">
                    <col width="100">
                    <col width="150">
                    <tr>
                        <th>강사 번호</th>
                        <th>강의명</th>
                        <th>강의 가격</th>
                        <th>강의 내용</th>
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
                                    <td>${dto.class_content }</td>
                                    <td><input type="button" value="삭제" onclick="location.href='adminClassDel.do?class_num=${dto.class_num}'"></td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <div style="display: block; text-align: center;">
                    <c:if test="${m_paging.startPage != 1 }">
                        <a href="mypage_admin.do?nowPage=${c_paging.startPage - 1 }&cntPerPage=${c_paging.cntPerPage}">&lt;</a>
                    </c:if>
                    <c:forEach begin="${c_paging.startPage }" end="${c_paging.endPage }" var="p">
                        <c:choose>
                            <c:when test="${p == c_paging.nowPage }">
                                <b>${p }</b>
                            </c:when>
                            <c:when test="${p != c_paging.nowPage }">
                                <a href="mypage_admin.do?nowPage=${p }&cntPerPage=${c_paging.cntPerPage}">${p }</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${c_paging.endPage != c_paging.lastPage}">
                        <a href="mypage_admin.do?nowPage=${c_paging.endPage+1 }&cntPerPage=${c_paging.cntPerPage}">&gt;</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp" />
</body>
</html>
