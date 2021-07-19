<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/17
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <%@include file="taglib.jsp"%>
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <style>
        html,body{
            background-image:url("/img/bkground.jpg");
            background-size: 100% 100%;
            height: 100%;
        }
    </style>
    <%--账号密码验证和登陆--%>
    <script>
        var flag = false;
        function usercheck() {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/userCheck",
                data:{
                    "username":$("#userid").val(),
                    "pwd":$("#password").val(),
                    "entity":$("input[name=identity]:checked").val()
                },
                success:function (data) {
                    if (data.trim() === '账号密码正确'){
                        $("#namespan").css("color","green");
                        flag = true;
                    }else {
                        $("#namespan").css("color","red");
                        flag=false;
                    }
                    $("#namespan").html(data);
                }
            })
        }

        //点击登陆
        function login() {
            if (flag === true) {
                // 去设置用户Session
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/userKeep",
                    data:{
                        "username":$("#userid").val(),
                        "entity":$("input[name=identity]:checked").val()
                    }
                });
                if ($("input[name=identity]:checked").val() === "admin") {
                    // 管理员页面
                    window.location.href = "${pageContext.request.contextPath}/toAdminIndex";
                }else{
                    // 读者管理页面
                    window.location.href = "${pageContext.request.contextPath}/toReaderIndex";
                }
            }else {
                alert("请输入正确的账号密码信息，新用户请注册登陆！");
            }
        }


        //跳转进入注册页面
       function toRegister() {
            window.location.href = "${pageContext.request.contextPath}/toRegister"
        }

    </script>

    <%--图书管理系统几个字体的样式设计--%>
    <style>
        .logo{
            background: #EEE url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAIAAAAmkwkpAAAAHklEQVQImWNkYGBgYGD4//8/A5wF5SBYyAr+//8PAPOCFO0Q2zq7AAAAAElFTkSuQmCC) repeat;
            text-shadow: 5px -5px black, 4px -4px white;
            font-weight: bold;
            -webkit-text-fill-color: transparent;
            -webkit-background-clip: text;
            font-size: 30px;
        }
    </style>
</head>
<body>
<div id="login_frame">
    <p id="logo" class="logo">图书管理系统</p>
    <p>
        <label class="label_input">账号</label><input type="text" id="userid" class="text_field" placeholder="请输入账号,账号为数字" onblur="usercheck()"/>
    </p>
    <p>
        <label class="label_input">密码</label><input type="password" id="password" class="text_field" placeholder="请输入密码" onblur="usercheck()"/>
    </p>
    <p>
        <span id="namespan"></span><br>
    </p>
    <div>
        <input type="radio" name="identity" value="reader" style="margin-left: 2px" checked="true" onclick="usercheck()">读者
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="identity" value="admin" style="margin-right: 2px" onclick="usercheck()">管理员
    </div>
    <br/>
    <div id="login_control">
        <input type="button" id="btn_login" class="btn btn-primary" value="登录" onfocus="usercheck()" onclick="login()"/>
        <input type="button" id="btn_register" class="btn btn-primary" value="注册" onclick="toRegister()"/>
    </div>
</div>
</body>
</html>
