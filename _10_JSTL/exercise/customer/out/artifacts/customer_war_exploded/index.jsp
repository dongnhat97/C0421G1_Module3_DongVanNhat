<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/3/2021
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<table border="1">
  <tr>
    <th>STT</th>
    <th>Name</th>
    <th>dayOfBirth</th>
    <th>Address</th>
    <th>Picture</th>
  </tr>
  <c:forEach var="customerObj" items="${CustomerServlet}" varStatus="loop">
  <tr>
    <td><c:out value="${loop.count}"/></td>
    <td><c:out value="${customerObj.name}"/> </td>
    <td><c:out value="${customerObj.dateOfBirth}"/></td>
    <td><c:out value="${customerObj.address}"/></td>
    <td><img width="100px" height="100px" src="${customerObj.picture}" alt=""></td>
  </tr>
  </c:forEach>
</table>
  </body>
</html>
