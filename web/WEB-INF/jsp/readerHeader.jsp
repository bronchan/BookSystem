<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/18
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function () {
            $("#resign_link").click(function () {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/userClear",
                    success:function (data) {
                        alert(data);
                    }
                });
                window.location.href="${pageContext.request.contextPath}/toLogin";
            });
        });
    </script>
    <style>
        #resign_link:hover {
            cursor: pointer;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">图书管理</a>
        </div>

        <div class="collapse navbar-collapse header" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/toReaderIndex">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/toBorrowBook">图书借阅</a></li>
                <li><a href="${pageContext.request.contextPath}/toReturnBook">图书归还</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎 ${sessionScope.username}</a></li>
                <li><a id="resign_link">注销</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
