<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/7/2021
  Time: 11:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>${message}</p>
<h3><a href="/users">Back</a></h3>
<h2>Update User</h2>
<form method="post">
<table border="1">
    <tr>
        <td>
            ID
        </td>
        <td>
             ${deleteServlet.getId()}
        </td>
    </tr>
   <tr>
       <td>Name</td>
       <td>${deleteServlet.getName()}</td>
   </tr>
    <tr>
        <td>Email</td>
        <td>${deleteServlet.getEmail()}</td>
    </tr>
    <tr>
        <td>Country</td>
        <td>${deleteServlet.getCountry()}</td>
    </tr>
    <tr>
        <td ></td>
        <td ><input type="submit" value="Delete"></td>
    </tr>
</table>
</form>
</body>
</html>
