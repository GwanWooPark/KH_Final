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
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 30px 0 30px 0;
            font-size: 11pt;
        }

        .container div {
            margin-bottom: 10px;
        }

        img {
            width: 240px;
            height: 180px;
        }

        button {
            border: none;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
  <div class="container">
      <div class="row">
          <div class="col-2" >음식명</div>
          <div class="col-3">${dto.recipe_name}</div>
          <div class="col-6">
              <img src="${dto.recipe_path }">
          </div>
      </div>
      <div class="row">
          <div class="col-4">재료</div>
          <div class="col-8">${dto.recipe_ingredient}</div>
      </div>
      <div class="row">
          <div class="col-4">레시피</div>
          <div class="col-8">${dto.recipe_info}</div>
      </div>
      <div class="row">
          <button onclick="location.reload()">메뉴 다시 추천 받기</button>
      </div>
  </div>
</body>
</html>
