<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/18
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加图书</title>
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
                let isbn = $("#isbn").val();
                let price = $("#price").val();
                let writer = $("#writer").val();
                let num = $("#num").val();
                let name = $("#name").val();
                $.ajax({//ajax传输json数据
                    type: "post",//请求方式
                    url: "${pageContext.request.contextPath}/doAddBook",//请求传输的位置
                    data: {
                        "isbn":isbn,
                        "name":name,
                        "price": price,
                        "num": num,
                        "writer": writer,
                    },
                    error: function () {
                        alert("添加错误");
                    },
                    success: function (data) {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/toBookManaging";
                    }
                });
            });
        });
    </script>


</head>
<body>


<div style="margin: auto;text-align: center">
    <p class="notice_head">添加图书</p>
    <table class="table table-striped" style="text-align: center;margin: auto;width: 80%" >
        <tr>
            <td>ISBN:</td>
            <td>
                <input type="text" id="isbn">
            </td>
        </tr>
        <tr>
            <td>书名:</td>
            <td>
                <input type="text" id="name">
            </td>
        </tr>
        <tr>
            <td>价格:</td>
            <td>
                <input type="text" id="price">
            </td>
        </tr>
        <tr>
            <td>作者:</td>
            <td>
                <input type="text" id="writer">
            </td>
        </tr>
        <tr>
            <td>数量:</td>
            <td>
                <input type="text" id="num">
            </td>
        </tr>
    </table>
    <div style="text-align: center">
        <table style="margin: auto">
            <tr>
                <td>
                    <button class="btn btn-primary" id="confirm">确认</button>
                </td>
                <td>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/toBookManaging">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>



<%@include file="footer.jsp"%>
</body>
</html>
