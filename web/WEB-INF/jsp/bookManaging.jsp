<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/17
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理</title>
    <%@include file="taglib.jsp"%>
    <style>
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="adminHeader.jsp"%>
<div style="margin: auto;text-align: center">
    <table class="table table-striped" style="text-align: center;margin: auto;width: 80%" >
        <tr>
            <th>编号</th>
            <th>ISBN</th>
            <th>名称</th>
            <th>作者</th>
            <th>价格</th>
            <th>数量</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        <c:forEach items="${requestScope.get('bookList')}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.isbn}</td>
                <td>${book.name}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>${book.num}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/toEditBook/${book.isbn}" class="glyphicon glyphicon-edit"></a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/deleteBook/${book.isbn}" class="glyphicon glyphicon-trash"></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="text-align: center">
    <a href="${pageContext.request.contextPath}/toAddBook" class="btn btn-primary">添加图书</a>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
