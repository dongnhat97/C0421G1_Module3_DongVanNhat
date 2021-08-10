<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/8/2021
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/users">Back</a> </p>
<fieldset>
<form method="post">
    <p>
        ${message}
    </p>
    <table>
        <tr>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td><input type="submit" value="search"></td>
        </tr>
        <c:if test="${listCountry !=null}">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Email</td>
            <td>Country</td>
        </tr>
        <c:forEach items='${requestScope["listCountry"]}' var="country">
        <tr>
            <td>${country.getId()}</td>
            <td>${country.getName()}</td>
            <td>${country.getEmail()}</td>
            <td>${country.getCountry()}</td>
        </tr>
        </c:forEach>
   </table>
    </c:if>
</form>
</fieldset>
</body>
</html>
