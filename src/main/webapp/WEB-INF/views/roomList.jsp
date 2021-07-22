<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {

        $('a').click(function () {
            var roomId = $(this).attr("class").replace('https://localhost:3000/', '');
            var pass = prompt("비밀번호를 입력하세요 : " );
            $.ajax({
                url: "roomPass.do",
                method: "POST",
                data: {"roomId" : roomId, "pass": pass},
                success: function () {
                    location.href = "https://localhost:3000/" + roomId;
                }
            })
        });

        });
    </script>
</head>
<body>

    <h1>LIST</h1>

    <table border="1">
        <col width="300">
        <tr>
            <th>방 목록</th>
        </tr>

        <c:choose>
            <c:when test="${empty list }">
                <tr>
                    <th colspan="4">-------------생성된 방이 없습니다------------</th>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list }" var="dto">
                    <tr>
                        <td><a href="#" class="${dto.rtc_room }">백종원의 방</a></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
</body>
</html>
