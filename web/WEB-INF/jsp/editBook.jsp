<%@ page import="com.chan.pojo.Book" %><%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/17
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
    <%@include file="taglib.jsp"%>
    <style>
        .notice_head {
            text-align: center;
            font-size: 20px;
            color: blue;
            font-family: "Academy Engraved LET";
            margin-top: 40px;
        }
    </style>

    <script>
        $(function () {
            $("#confirm").click(function () {
                let price = $("#price").val();
                let writer = $("#writer").val();
                let num = $("#num").val();
                let name = $("#name").val();
                let isbn = $(this).val();

                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/updateBook",
                    data:{
                        "isbn":isbn,
                        "name":name,
                        "price":price,
                        "num":num,
                        "writer":writer
                    },
                    error:function () {
                        alert("修改错误");
                    },
                    success:function (data) {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/toBookManaging";
                    }
                })
            })
        })
    </script>
</head>
<body>


<div style="margin: auto;text-align: center">
    <p class="notice_head">修改书本信息</p>
    <table class="table table-striped" style="text-align: center;margin: auto;width: 80%" >
        <tr>
            <td>ISBN:</td>
            <td>${book.isbn}</td>
        </tr>
        <tr>
            <td>书名:</td>
            <td>
                <input type="text" value="${book.name}" id="name">
            </td>
        </tr>
        <tr>
            <td>价格:</td>
            <td>
                <input type="text" value="${book.price}" id="price">
            </td>
        </tr>
        <tr>
            <td>作者:</td>
            <td>
                <input type="text" value="${book.writer}" id="writer">
            </td>
        </tr>
        <tr>
            <td>数量:</td>
            <td>
                <input type="text" value="${book.num}" id="num">
            </td>
        </tr>
    </table>
    <div style="text-align: center">
        <table style="margin: auto">
            <tr>
                <td>
                    <button class="btn btn-primary" id="confirm" value="${book.isbn}">确认</button>
                </td>
                <td>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/toBookManaging">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
