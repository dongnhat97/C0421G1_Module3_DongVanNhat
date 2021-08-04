<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/3/2021
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple calculator</h1>
  <form action="/index" method="post">
    <tr>Calculation</tr><br>
    <tr>First operand</tr><br>
    <input type="text" name="first"><br>
    <tr>Operator</tr><br>
    <select name="operator">
      <option value="+">Addition</option>
      <option value="-">Subtraction</option>
      <option value="*">Multiplication</option>
      <option value="/">Division</option>
    </select><br>
    <tr>Second operand</tr><br>
    <input type="text" name="end"><br>
    <input type="submit" value="Calculate">
  </form>
  </body>
</html>
