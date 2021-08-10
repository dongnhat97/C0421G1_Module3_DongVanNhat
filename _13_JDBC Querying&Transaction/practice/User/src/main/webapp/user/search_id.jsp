<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/9/2021
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<fieldset>
<form method="post">
    <p>
        ${message}
    </p>
    <table>

    <h1>Tìm kiếm User bằng Id</h1>
    <tr><input type="text" name="id" placeholder="search ID"></tr>
    <tr><input type="submit" value="Search"></tr>
        <tr>
            <td>ID</td>
            <td>${listId.getId()}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>${listId.getName()}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>${listId.getEmail()}</td>
        </tr>
        <tr>
            <td>Country</td>
            <td>${listId.getCountry()}</td>
        </tr>
    </table>

</form>
</fieldset>
</body>
</html>
