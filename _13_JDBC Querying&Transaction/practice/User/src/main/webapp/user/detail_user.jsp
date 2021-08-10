<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/6/2021
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <a href="/users">Back</a>
</p>
<table border="1">
    <tr>
        <td>
            ID
        </td>
        <td>
            ${detailServlet.getId()}
        </td>
    </tr>
    <tr>
        <td>
        Name
        </td>
        <td>
            ${detailServlet.getName()}
        </td>
    </tr>
    <tr>
        <td>
        Email
        </td>
        <td>
            ${detailServlet.getEmail()}
        </td>
    </tr>
    <tr>
        <td>
        Country
        </td>
        <td>
            ${detailServlet.getCountry()}
        </td>
    </tr>
</table>
</body>
</html>
