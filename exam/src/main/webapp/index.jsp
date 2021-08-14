<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/13/2021
  Time: 9:28 AM
  To change this template use File | Settings | File Templates.
--%>
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

<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="/assert/images.png" alt="" width="60" height="50" class="d-inline-block align-text-top">
      <span style="position: relative; top:20px">Furama</span>
    </a>
    <p>Đồng Văn Nhật</p>
  </div>
</nav>


<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top" style="margin-top: 10px">
  <div class="container-fluid">
    <a class="navbar-brand" href="/" style="margin-left:430px">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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

<div class="container-fluid">
  <div class="row">
    <div class="col-2 back_ground_col-2">
      <div class="row">
        <div class="col-12">
          Item One
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          Item Two
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          Item Three
        </div>
      </div>
    </div>
    <div class="col-10 back_ground_col-10 ">
      <div class="row">
        <div class="col-12 ">

          <h3>
            KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI FURAMA ĐÀ NẴNG, TỰ HÀO LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM
          </h3>

          <img src="/assert/06-2(2).png" style="width: 100%">

          <p>
            Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản
            văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng
            với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo
            phong cách thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành
            khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới
            hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.
          </p>

        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row text-center" style="background-color: #adb5bd">
    <div class="col-lg-12">
      <p style=" display: flex; flex-direction: column; justify-content: center; text-align: center; font-weight: bold; font-size: 20px;
               width: 100%; margin-top: 15px">Dong Van Nhat</p>
      <p style=" display: flex; flex-direction: column; justify-content: center; text-align: center;
               width: 100%"> Ha Noi 2020</p>
    </div>
  </div>
</div>
</body>
<script src="/untitled/js/bootstrap.js"></script>
<script src="/untitled/jquery/popper.min.js"></script>
<script src="/untitled/jquery/jquery-3.5.1.min.js"></script>
</html>
