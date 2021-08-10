<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/5/2021
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<style>
    .color {
        background-color: gray;
        color: crimson;
        font-size: 20px;
    }
    .color:hover {
        background-color: black;
        color: aliceblue;
    }
</style>
<body>
<h2>List User </h2>
<p>
    <a href="/users?action=create"><input type="submit"  value="Create User" class="color"> </a>
</p>
<p>
    ${message}
</p>

</p>

<table border="1" >
    <tr>
    <td>ID</td>
    <td><a href="/users?action=orderBy">Name</a></td>
    <td>Email</td>
    <td>Country</td>
    <td>Update</td>
    <td>Delete</td>

    </tr>
    <c:forEach items='${requestScope["userListServlet"]}' var="user">
    <tr>
        <td><a href="${user.getId()}" >${user.getId()}</a></td>
        <td><a href="/users?action=detail&id=${user.getId()}"> ${user.getName()}</a></td>
        <td>${user.getEmail()}</td>
        <td>${user.getCountry()}</td>
        <td><a href="/users?action=update&id=${user.getId()}">Update</a></td>
        <td><a href="/users?action=delete&id=${user.getId()}">Delete</a> </td>
    </tr>
    </c:forEach>
</table>
 <p><a href="/users?action=search"> <input type="submit"value="Search Country"></a></p>
 <p> <a href="/users?action=searchId"><input type="submit" value="Search ID"></a></p>
</body>
</html>
