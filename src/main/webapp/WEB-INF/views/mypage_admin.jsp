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
<style>
    .mypage_body {
        width: 1200px;
        margin: 0 auto;
        height: 60%;
    }
</style>
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
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
