<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furuma</title>
    <link rel="stylesheet" href="/assert/untitled/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/untitled/js/bootstrap.bundle.js">
    <link rel="stylesheet" href="/assert/untitled/js/bootstrap.js">
    <style>
        .back_ground_col-2{
            background-color: #0dcaf0;
            color: #6c757d;
            height: 2000px;
            font-size: 25px;
        }
        .back_ground_col-10 {
            /*background-color: burlywood;*/
            text-align: center;
            padding-top: 200px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="images.png" alt="" width="60" height="50" class="d-inline-block align-text-top">
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

                <a class="navbar-brand" href="/customers" style="margin-left:450px">Home</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="navbar-brand" href="#">Employee</a>
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
                <h2>Create Customer</h2>
                <p>${message}</p>
                <form  method="post">
                    <p>Name</p>
                    <p><input type="text" name="name"></p>
                    <p>Birthday</p>
                    <p><input type="text" name="birthday"></p>
                    <p>Car</p>
                    <p><input type="text" name="car"></p>
                    <p>Salary</p>
                    <p><input type="text" name="Salary"></p>
                    <p>Phone</p>
                    <p><input type="text" name="Phone"></p>
                    <p>Email</p>
                    <p><input type="text" name="Email"></p>
                    <p>Address</p>
                    <p><input type="text" name="Address"></p>
                    <p>Position ID</p>
                    <p>
                        <select name="Position" style="width: 182px">
                            <c:forEach var="position" items="${positionList}">
                                <option value='${position.getPositionId()}' >${position.getPositionName()}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>Education ID</p>
                    <p><input type="text" name="Education"></p>
                    <p>Division ID</p>
                    <p><input type="text" name="Division"></p>
                    <p>UserName</p>
                    <p><input type="text" name="UserName"></p>

                    <p><input type="submit" value="Create"></p>
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
<script src="/assert/untitled/js/bootstrap.js"></script>
<script src="/assert/untitled/jquery/popper.min.js"></script>
<script src="/assert/untitled/jquery/jquery-3.5.1.min.js"></script>
</body>
</html>
