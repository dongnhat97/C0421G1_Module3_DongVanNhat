<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/2/2021
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Discount</title>
</head>
<body>
<h1> Service Discount</h1>
<form action="/hello"method="get">
  <p>
    Product Description
  </p>
  <input type="text" name="pd">
  <p>
    List Price
  </p>
  <input type="text" name="LP">
  <p>
    Discount Percent
  </p>
  <input type="text" name="DP">
  <input type="submit" value="discount">
</form>
</body>
</html>
