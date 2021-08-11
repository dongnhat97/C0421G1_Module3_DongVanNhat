<%--
  Created by IntelliJ IDEA.
  User: MR DONG NHAT
  Date: 8/10/2021
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Furama Resort</title>
    <link rel="stylesheet" href="/untitled/css/bootstrap.css">
    <link rel="stylesheet" href="/untitled/js/bootstrap.bundle.js">
    <link rel="stylesheet" href="/untitled/js/bootstrap.js">
    <style>
      .back_ground_col-2{
        background-color: #0dcaf0;
        color: #6c757d;
        height: 2000px;
        font-size: 25px;
      }
      .back_ground_col-10 {
        background-color: burlywood;
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

          <p >Đồng Văn Nhật</p>
        </div>
      </nav>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row">
      <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top: 10px">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" style="margin-left:450px">Home</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                  <li><hr class="dropdown-divider"></li>
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
        <div class="row" ><div class="col-12">Item One</div></div>
        <div class="row"><div class="col-12">Item Two</div></div>
        <div class="row"><div class="col-12">Item Three</div></div>
      </div>
      <div class="col-10 back_ground_col-10">
        <h3>
          KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI FURAMA ĐÀ NẴNG, TỰ HÀO LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM
        </h3>
        <img src="06-2.jpg">
        <p>
          Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.
        </p>
      </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row" style="padding-bottom: 50px">
      <div style="text-align: center">Footer</div>
    </div>
  </div>
  </body>

</html>
