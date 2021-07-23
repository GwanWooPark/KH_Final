<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title></title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        function popupCenter(href, w, h) {
            var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
            var yPos = (document.body.offsetHeight/2) - (h/2);
            window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
        }
    </script>
</head>
<body>
    <a href="boardList.do">recipeboard</a> <br>
    <a href="#" onclick="popupCenter('recipe.do', '600', '400')">randomrecipe</a> <br>
    <a href="chatlogin.do">Chatlogin</a> <br>
    <a href="machine.do">machine</a>
    <a href="main.do">main</a>
    <form action="createRoom.do" method="POST">
        <input type="text" name="roomTitle"/>
        <input type="submit" value="방 만들기">
    </form>
    <a href="listRoom.do">방 목록 보기</a>
    <br>
    <br>
    <br>
    <br>
    <c:choose>
      <c:when test="${sessionScope.loginCheck eq true}">
        <c:if test="${not empty dbDto.member_id}">
          ${dbDto.member_id }님 로그인완료
          <a href="logout.do">로그아웃</a>
        </c:if>
        <c:if test="${userId ne null}">
          <c:out value="${userId}"/>님 로그인 완료!
          <a href="kakaologout.do">로그아웃</a>
        </c:if>
        <c:if test="${session != null }">
          <c:out value="${sessionId }"/>님 로그인 완료!
          <a href="naverlogout.do">로그아웃</a>
        </c:if>
      </c:when>
      <c:otherwise>
        <a href="signupform.do">회원가입</a>
        <a href="loginform.do">로그인</a>
      </c:otherwise>
    </c:choose>
</body>
</html>
