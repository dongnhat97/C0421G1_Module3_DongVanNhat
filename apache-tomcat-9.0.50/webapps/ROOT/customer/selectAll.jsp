<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/10/2021
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furama Resort</title>
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
                    <img src="/assert/images.png" alt="" width="60" height="50" class="d-inline-block align-text-top">
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
                    <form class="d-flex" >
                        <input class="form-control me-2" type="search" placeholder="Search" name="name" aria-label="Search">
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


            <p>${message}</p>
             <h3 >Create</h3>
            <p><a href="/customers?action=create_customer"><input type="submit" value="Create"></a></p>
            <table class="table" style="padding-left: 40px" border="1" >
                <tr style="text-align: center">
                    <th>ID</th>
                    <th>Code</th>
                    <th>Type ID</th>
                    <th>Name</th>
                    <th>Birthday</th>
                    <th>Gender</th>
                    <th>Car</th>
                    <th>Number Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>

                <c:forEach items="${requestScope['CustomerList']}" var="customer">
                    <tr style="text-align: center">
                        <td>${customer.getCustomerId()}</td>
                        <td>${customer.getCustomerCode()}</td>
                        <td><c:choose>
                            <c:when test="${customer.getCustomerTypeId() ==1}">Diamond</c:when>
                            <c:when test="${customer.getCustomerTypeId() ==2}">Palatinum</c:when>
                            <c:when test="${customer.getCustomerTypeId() ==3}">Gold</c:when>
                            <c:when test="${customer.getCustomerTypeId() ==4}">Silver</c:when>
                            <c:when test="${customer.getCustomerTypeId() ==5}">Member</c:when>
                            <c:otherwise>Other</c:otherwise>
                        </c:choose>
                        </td>
                        <td>${customer.getCustomerName()}</td>
                        <td>${customer.getCustomerBirthday()}</td>
                        <td>
                        <c:choose>
                            <c:when test="${customer.customerGender == 1}">Male</c:when>
                            <c:when test="${customer.customerGender == 2}">Female</c:when>
                            <c:otherwise>Other</c:otherwise>
                        </c:choose>
                        </td>
                        <td>${customer.getCustomerIdCar()}</td>
                        <td>${customer.getCustomerPhone()}</td>
                        <td>${customer.getCustomerEmail()}</td>
                        <td>${customer.getCustomerAddress()}</td>
                        <td>
                            <button type="button" onclick="onDelete('${customer.getCustomerId()}','${customer.getCustomerName()}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Delete
                        </button>
                        </td>
                         <td><a href="/customers?action=update_customer&id=${customer.getCustomerId()}"> Update</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row" style="padding-bottom: 50px">
        <div style="text-align: center">Footer</div>
    </div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               Bạn có muốn xóa <input name="id" value=""id="onName">
            </div>
            <form action="/customers" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idOnDelete">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yup</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function onDelete(id,name) {
        document.getElementById("idOnDelete").value = id;
        document.getElementById("onName").value = name;
    }
</script>
</body>
<script src="/assert/untitled/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/untitled/jquery/popper.min.js"></script>
<script src="/assert/untitled/js/bootstrap.bundle.js"></script>
<script src="/assert/untitled/js/bootstrap.js"></script>
</html>
