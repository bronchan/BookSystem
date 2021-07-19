<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用jstl标签--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--启用el表达式--%>
<%@ page isELIgnored="false" %>

<%--jQuery文件。务必在bootstrap.min.js 之前引入--%>
<script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
<%--新 Bootstrap 核心 CSS 文件--%>
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<%--最新的 Bootstrap 核心 JavaScript 文件--%>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>包含文件</title>
</head>
<body>
    <%
        // request是jsp中的隐式成员
        String path = request.getContextPath();
        int port = request.getServerPort();
        String basePath  = null;

        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
        System.out.println(basePath);

        //在request中设置一个变量为basePath，后面在jsp中，就可以通过el表达式获取 ${basePath}
        request.setAttribute("basePath", basePath);
    %>
</body>
</html>
