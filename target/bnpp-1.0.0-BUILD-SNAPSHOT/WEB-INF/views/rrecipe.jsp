<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#refresh').click(function () {
                location.reload();
            });
        });
    </script>
</head>
<body>
    <table border="1">
        <tr>
            <th>음식명</th>
            <td><c:out value="${dto.recipe_name}"/></td>
        </tr>
        <tr>
            <th>재료</th>
            <td width="150"><c:out value="${dto.recipe_ingredient}"/></td>
        </tr>
        <tr>
            <th>레시피</th>
            <td><c:out value="${dto.recipe_info}"/></td>
        </tr>
    </table>
    <button id="refresh">재추천</button>
</body>
</html>
