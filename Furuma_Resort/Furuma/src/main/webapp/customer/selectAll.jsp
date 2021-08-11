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
    <link rel="stylesheet" href="/untitled/css/bootstrap.min.css">
    <link rel="stylesheet" href="/untitled/js/bootstrap.bundle.js">
    <link rel="stylesheet" href="/untitled/js/bootstrap.js">
    <style>
        .back_ground_col-2 {
            background-color: #0dcaf0;
            color: #6c757d;
            height: 500px;
            font-size: 25px;
        }

        .back_ground_col-10 {
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

                <a class="navbar-brand" href="/" style="margin-left:450px">Home</a>

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
                    <th>Update</th>
                    <th>Delete</th>
                </tr>

                <c:forEach items="${requestScope['CustomerList']}" var="customer">
                    <tr style="text-align: center">
                        <td>${customer.getCustomerId()}</td>
                        <td>${customer.getCustomerCode()}</td>
                        <td>${customer.getCustomerTypeId()}</td>
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
                        <td><button onclick="onDelete(${customer.getCustomerId()})" type="button" class="btn btn-danger" data-target="#modelId">Delete</button></td>
                         <td><a href="/customers?action=update_customer&id=${customer.getCustomerId()}"> Update</a> </td>
                        <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Confirm delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="/customers">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="" id="idOnDelete">
                                        <div class="modal-body">
                                            Ban co muon xoa user <span style="color: red">${customer.getCustomerName()}</span>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary">OK</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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
<script>
    function onDelete(id) {
     document.getElementById("idOnDelete").value = id;
    }
</script>
</body>
<script src="/untitled/js/bootstrap.js"></script>
<script src="/untitled/jquery/popper.min.js"></script>
<script src="/untitled/jquery/jquery-3.5.1.min.js"></script>
</html>
