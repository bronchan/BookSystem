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
    <title>图书归还</title>
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
            $("button[id='return']").click(function () {
                var bookISBN=$(this).val();
                $.ajax({
                    type:"post",//请求方式
                    url:"${pageContext.request.contextPath}/returningBook",//请求传输的位置
                    data:{
                        "bookISBN":bookISBN
                    },
                    error:function () {
                        alert("提交错误");
                    },
                    success:function (data) {
                        alert(data)
                        //自动刷新页面
                        location.reload(true);
                    }
                });
            });
        });
    </script>

</head>
<body>
<%@include file="readerHeader.jsp"%>
<div style="    margin: auto;text-align: center" >
    <p class="notice_head">图书归还</p>
    <table  class="table table-striped" style="text-align: center;margin: auto;width: 80%">
        <tr style="text-align: center">
            <th>序号</th>
            <th>书籍名称</th>
            <th>ISBN</th>
            <th>作者</th>
            <th>价格</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${requestScope.get('bookBorrowing')}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.name}</td>
                <td>${book.isbn}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>借阅中</td>
                <td >
                    <button class="btn btn-primary" value="${book.isbn}" id="return">归还</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
