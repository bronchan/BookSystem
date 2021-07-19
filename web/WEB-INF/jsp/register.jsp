<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/17
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <%@include file="taglib.jsp"%>
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <style>
        html,body {
            background-color: antiquewhite;
            background-image:url("/img/bkground.jpg");
            background-size: 100% 100%;
            height: 100%;
        }
    </style>

    <script>
        var flag = false;
        function accountCheck(){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/accountChecking",
                data:{
                    "userId":$("#userid").val(),
                    "entity":$("input[name=identity]:checked").val()
                },
                success:function (data) {
                    if (data === 'ok') {
                        flag = true;
                        $("#namespan").css("color","green");
                        $("#namespan").html(data);

                    }else {
                        $("#namespan").css("color","red");
                        $("#namespan").html(data);
                    }
                }
            })
        }


        function registering() {
            if (flag) {
                $.ajax({
                    type:"post",//请求方式
                    url:"${pageContext.request.contextPath}/registering",//请求传输的位置
                    data:{
                        "userName":$("#username").val(),
                        "userId":$("#userid").val(),
                        "password":$("#password").val(),
                        "entity":$("input[name=identity]:checked").val()
                    },
                    error:function () {
                        alert("注册失败");
                    },
                    success:function (data) {
                        if (data==="注册成功") {
                            alert($("input[name=identity]:checked").val()+"注册成功！");
                            window.location.href="${pageContext.request.contextPath}/toLogin";
                        } else {
                            alert(data);
                        }
                    }
                });
            }else {
                alert("账号信息有误");
            }
            };
            //返回登录界面的按钮
            $("#btn_login").click(function () {
                window.location.href="${pageContext.request.contextPath}/toLogin";
            });

    </script>

</head>
<body>
<div id="login_frame">

    <p><label class="label_input" >账号</label><input type="text" id="userid" class="text_field" placeholder="账号只能为数字" onblur="accountCheck()"/></p>
    <p><label class="label_input">密码</label><input type="text" id="password" class="text_field" placeholder="请输入密码"/></p>
    <p><label class="label_input">真实姓名</label><input type="text" id="username" class="text_field" placeholder="请输入您的真实姓名"/></p>
    <p><span id="namespan"></span><br></p>
    <div>
        <input type="radio" name="identity" value="reader" style="margin-left: 2px" checked="true" onclick="accountCheck()">读者
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="identity" value="admin" style="margin-right: 2px" onclick="accountCheck()">管理员
    </div>
    <br/>
    <div id="login_control">
        <input type="button" id="btn_register" class="btn btn-primary" value="注册" onfocus="accountCheck()"  onclick ="registering()" />
        <input type="button" id="btn_login" class="btn btn-primary" value="返回登录界面"/>
    </div>
</div>
</body>
</html>
