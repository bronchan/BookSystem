<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/17
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书借阅管理</title>
    <%@include file="taglib.jsp"%>
    <style>
        th {
            text-align: center;
        }
        .notice_head {
            text-align: center;
            font-size: 20px;
            color: blue;
            font-family: "Academy Engraved LET";
        }
    </style>

    <script>
        $(function () {
            $("button[id='borrow']").click(function () {
                var bookISBN=$(this).val();
                $.ajax({
                    type:"post",//请求方式
                    url:"${pageContext.request.contextPath}/borrowingBook",//请求传输的位置
                    data:{
                        "bookISBN":bookISBN
                    },
                    error:function () {
                        alert("提交错误");
                    },
                    success:function (data) {
                        if (data==="-1") {
                            alert("没有该图书")
                        } else if (data==="-2") {
                            alert("图书不足");
                        } else if (data==="-3") {
                            alert("当前正在借阅该书");
                        } else {
                            alert(data)
                            //自动刷新页面
                            location.reload(true);
                        }
                    }
                });
            });
        });
    </script>

</head>
<body>

<%@include file="readerHeader.jsp"%>

<div style="    margin: auto;text-align: center" >
    <p class="notice_head">所有书籍</p>
    <table  class="table table-striped" style="text-align: center;margin: auto;width: 80%">
        <tr style="text-align: center">
            <th>序号</th>
            <th>书籍名称</th>
            <th>ISBN</th>
            <th>作者</th>
            <th>价格</th>
            <th>剩余数量</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${bookList}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.name}</td>
                <td>${book.isbn}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>${book.num}</td>
                <td >
                    <button class="btn btn-primary" value="${book.isbn}" id="borrow">借阅</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
