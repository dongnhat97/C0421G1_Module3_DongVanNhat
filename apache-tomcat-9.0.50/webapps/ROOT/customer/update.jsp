<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/11/2021
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/untitled/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/untitled/js/bootstrap.bundle.js">
    <link rel="stylesheet" href="/assert/untitled/js/bootstrap.js">
    <style>
        .back_ground_col-2 {
            background-color: whitesmoke;
            color: #6c757d;
            height: 1500px;
            font-size: 25px;
        }

        .back_ground_col-10 {
            background-color: burlywood;
            text-align: center;
            padding-top: 100px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="assert/images.png" alt="" width="60" height="50" class="d-inline-block align-text-top">
                    <span style="position: relative; top:20px">Furama</span>
                </a>
                <p>Đồng Văn Nhật</p>
            </div>
        </nav>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top: 10px">
            <div class="container-fluid">

                <a class="navbar-brand" href="/" style="margin-left:450px">Home</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="navbar-brand" href="/employee?action=employee_list">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="navbar-brand" href="/customers?action=customer_list">Customer</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="navbar-brand" href="#">Service</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="navbar-brand" href="#">Contract</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-2 back_ground_col-2">
            <div class="row">
                <div class="col-12">Item One</div>
            </div>
            <div class="row">
                <div class="col-12">Item Two</div>
            </div>
            <div class="row">
                <div class="col-12">Item Three</div>
            </div>
        </div>
        <div class="col-10 back_ground_col-10">
            <fieldset>
                <h2>Update Customer</h2>
                <p>${message}</p>
                <form  method="post">
                    <p>Code</p>
                    <p><input type="text" name="code"></p>
                    <p>ID Type</p>
                    <p>
                        <td>
                        <select name="typeId" style="width: 182px">
                            <c:forEach var="customerType" items="${lisCustomerType}">
                                <option value='${customerType.customerTypeID}'>${customerType.customerTypeName}</option>
                            </c:forEach>
                        </select>
                        </td>
                    </p>
                    <p>Name</p>
                    <p><input type="text" name="name"></p>
                    <p>Birthday</p>
                    <p><input type="text" name="birthday"></p>
                    <p>Gender</p>
                    <p><select name="gender" style="width: 182px">
                        <option selected>Choose one</option>
                        <option value="1">Male</option>
                        <option value="2">Female</option>
                        </select></p>
                    <p>ID Car</p>
                    <p><input type="text" name="idCar"></p>
                    <p>Number PHone</p>
                    <p><input type="text" name="phone"></p>
                    <p>Email</p>
                    <p><input type="text" name="email"></p>
                    <p>Address</p>
                    <p><input type="text" name="address"></p>
                    <p><input type="submit" value="Update"></p>
                </form>
            </fieldset>

        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row" style="padding-bottom: 50px">
        <div style="text-align: center">Footer</div>
    </div>
</div>
<script src="/untitled/js/bootstrap.js"></script>
<script src="/untitled/jquery/popper.min.js"></script>
<script src="/untitled/jquery/jquery-3.5.1.min.js"></script>
</body>
</html>
