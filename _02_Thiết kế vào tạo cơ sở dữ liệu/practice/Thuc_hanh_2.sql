create database QuanLyDiemThi;
use QuanLyDiemThi;
CREATE TABLE HocSinh(
    id_HS VARCHAR(20) PRIMARY KEY,
    ten_HS VARCHAR(50),
    ngay_Sinh DATETIME,
    lop VARCHAR(20),
    GT VARCHAR(20)
);
CREATE TABLE MonHoc(
    ma_MH VARCHAR(20) PRIMARY KEY,
    ten_MH VARCHAR(50)
);
CREATE TABLE BangDiem(
    id_HS VARCHAR(20),
    ma_MH VARCHAR(20),
    diem_Thi INT,
    ngay_KT DATETIME,
    PRIMARY KEY (id_HS, ma_MH),
    FOREIGN KEY (id_HS) REFERENCES HocSinh(id_HS),
    FOREIGN KEY (ma_MH) REFERENCES MonHoc(ma_MH)
);
CREATE TABLE GiaoVien(
    id_GV VARCHAR(20) PRIMARY KEY,
    ten_GV VARCHAR(20),
    sdt VARCHAR(10)
);
ALTER TABLE MonHoc ADD id_GV VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (id_GV) REFERENCES GiaoVien(id_GV);
-- drop database quanlydiemthi;