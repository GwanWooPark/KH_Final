<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="resources/assets/css/templatemo-space-dynamic.css">
    <link rel="stylesheet" href="resources/assets/css/animated.css">
    <link rel="stylesheet" href="resources/assets/css/owl.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style type="text/css">
        table { width: 100%; }

        .recipe {border-collapse: collapse; border-radius: 4px; margin: 25px 0; font-size: 0.9em; font-family: sans-serif;
                 min-width: 400px;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);}
        th { background-color: skyblue; color: #ffffff; text-align: center; }
        .recipe tr:first-child th { border-radius: 4px 0 0 0 }
        .recipe tr:last-child th { border-radius: 0 0 0 4px }
        .recipe tr {border-bottom: 1px solid #dddddd;}
        .recipe tr:last-child { border-bottom: none}
    </style>
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
    <div class="container" align="center">
        <div class="row">
            <div class="">
                <div>음식명
                <c:out value="${dto.recipe_name}"/>
                </div>
                <div>
                재료
                <c:out value="${dto.recipe_ingredient}" escapeXml="false"/>
                </div>
                <div>
                레시피
                <c:out value="${dto.recipe_info}" escapeXml="false"/>
                </div>
            </div>
        </div>
        <button id="refresh">재추천</button>
    </div>
</body>
</html>
