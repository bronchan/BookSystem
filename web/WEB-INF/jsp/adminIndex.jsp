<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/16
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>管理员页面</title>
    <%@include file="taglib.jsp"%>
    <%--样式--%>
    <style>
    * {
    box-sizing: border-box;
    }
    /* body 样式 */
    body {
    font-family: Arial;
    margin: 0;
    }
    /* 列容器 */
    .row {
    display: -ms-flexbox; /* IE10 */
    display: flex;
    -ms-flex-wrap: wrap; /* IE10 */
    flex-wrap: wrap;
    }
    /* 创建两个列 */
    /* 边栏 */
    .side {
    -ms-flex: 30%; /* IE10 */
    flex: 30%;
    background-color: #f1f1f1;
    padding: 20px;
    }
    /* 主要的内容区域 */
    .main {
    -ms-flex: 70%; /* IE10 */
    flex: 70%;
    background-color: white;
    padding: 20px;
    }
    /* 测试图片 */
    .text_area {
    background-color: #aaa;
    width: 100%;
    padding: 20px;
    }
    /* 响应式布局 - 在屏幕设备宽度尺寸小于 700px 时, 让两栏上下堆叠显示 */
    @media screen and (max-width: 700px) {
    .row {
    flex-direction: column;
    }
    }
    /* 响应式布局 - 在屏幕设备宽度尺寸小于 400px 时, 让导航栏目上下堆叠显示 */
    @media screen and (max-width: 400px) {
    .navbar a {
    float: none;
    width: 100%;
    }
    }
    .welcome_head {
    color: blue;
    font: 0.875em/1.5em"微软雅黑", "PTSans", "Arial", sans-serif;
    font-size: 30px;
    text-align: center;
    /*background-color: #aaaaaa;*/
    width: 100%;
    }
    #links p:hover {
    cursor: pointer;
    text-decoration: none;
    background-color: #3BD9FF;
    color: #f1f1f1;
    font: 20px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
    line-height: 30px;
    margin-top: 15px;
    }
    </style>
  </head>
  <body>
  <%@include file="adminHeader.jsp"%>
  <h1 class="welcome_head">欢迎使用图书管理系统</h1>
  <div class="main">
        <h3>项目介绍</h3>
        <h5>校园管理系统</h5>
        <div class="text_area">
            <pre>
                首先，感谢博主 <a href="https://blog.csdn.net/weixin_44062380">博主链接</a>；这个项目是当时半月前初学JavaWeb时，
                在CSDN上找到了博主的这个项目，虽然这个项目基本是简单CRUD，但对于初学者来说，这是一个非常适合的练手项目。
                由于前几天刚学完了Spring5+SpringMVC+Mybatis，所以拿这个项目来作为SSM整合的练手项目，所以实在原基础上进行了重构；
                数据库结构设计和样式跟原项目一样；因为Mybatis框架，JDBC代码基本上都没有了，Dao层和Service极其的简单，也就Controller层
                的代码量稍多了些。
                功能介绍：
                登录功能：ajax异步请求通过绑定失去和获得焦点事件进行了账号密码验证，然后判断用户Session判断用户是否登出拦截请求；
                读者端：
                  * 借阅：
                      可以借阅库存中还有的书籍
                  * 查找：
                      可以通过关键词，查找对应的书籍

                管理员端：
                  * 处理借阅：
                      处理读者的借阅申请
                  * 管理书籍：
                      可以增删改查书籍信息

            </pre>
        </div>
  </div>
  <%@include file="footer.jsp"%>
  </body>
</html>
