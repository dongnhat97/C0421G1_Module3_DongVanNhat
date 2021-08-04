<%@ page import="servlet.DictionaryServlet" %><%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/3/2021
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>
    Vietnamese : <%=request.getAttribute("transl")%>
</h2>
</body>
</html>
