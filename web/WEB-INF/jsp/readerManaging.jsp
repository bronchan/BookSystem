<%--
  Created by IntelliJ IDEA.
  User: bronchan
  Date: 2021/7/18
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者管理</title>
    <%@include file="taglib.jsp"%>
</head>
<body>
<%@include file="adminHeader.jsp"%>
<div style="margin: auto;text-align: center" >
    <table  class="table table-striped" style="text-align: center;margin: auto;width: 80%">
        <tr>
            <td>序号</td>
            <td>读者id</td>
            <td>读者姓名</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${readerList}" var="reader" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${reader.id}</td>
                <td>${reader.name}</td>
                <td>
                    <%--删除权限--%>
                    <a href="${pageContext.request.contextPath}/deleteReader/${reader.id}" class="glyphicon glyphicon-trash"></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


<%@include file="footer.jsp"%>
</body>
</html>
