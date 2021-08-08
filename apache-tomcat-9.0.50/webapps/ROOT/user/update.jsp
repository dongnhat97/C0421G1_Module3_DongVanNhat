<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/6/2021
  Time: 9:44 PM
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
<fieldset>
<form method="post">
    <h3>Name</h3>
    <input type="text" name="name" value=${updateServlet.getName()}>
    <h3>Price</h3>
    <input type="text" name="email" value=${updateServlet.getEmail()}>
    <h3>Country</h3>
    <input type="text" name="country" value=${updateServlet.getCountry()}>
    <input type="submit" value="Update User">
</form>
</fieldset>
</body>
</html>
