drop database if exists quan_ly_don_hang;
create database quan_ly_don_hang;
use quan_ly_don_hang;
create table phieu_xuat(
so_px int primary key not null auto_increment,
ngay_xuat datetime not null);

create table vat_tu(
ma_vt varchar(20) primary key not null,
ten_vt varchar(30) not null);

create table phieu_nhap(
so_pn int auto_increment primary key not null,
ngay_nhap datetime not null);

create table so_dien_thoai(
id int primary key not null auto_increment,
so_dt varchar(15) not null);

create table nha_cung_cap(
ma_nha_cc varchar(20) primary key not null,
ten_nha_cc varchar(20) not null,
dia_chi varchar(30) not null,
id_nha_cc int not null,
foreign key (id_nha_cc) references so_dien_thoai(id)
);

create table don_dat_hang(
so_dh int auto_increment primary key not null,
ngay_dh datetime not null
);

create table chi_tiet_phieu_xuat(
so_px int,
ma_vt varchar(20),
so_luong_xuat int not null,
dg_xuat varchar(20) not null,
primary key (so_px, ma_vt),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vt) references vat_tu(ma_vt));

create table chi_tiet_phieu_nhap(
dg_nhap varchar(20) not null,
so_luong_nhap int not null,
ma_vt varchar(20),
so_pn int, 
primary key (ma_vt, so_pn),
foreign key (ma_vt) references vat_tu(ma_vt),
foreign key (so_pn) references phieu_nhap(so_pn)
);

create table chi_tiet_don_dh(
ma_vt varchar(20),
so_dh int,
primary key (ma_vt, so_dh),
foreign key (ma_vt) references vat_tu(ma_vt),
foreign key (so_dh) references don_dat_hang(so_dh));
alter table don_dat_hang add ma_nha_cc varchar(20);
alter table don_dat_hang add constraint FK_ma_ncc foreign key (ma_nha_cc) references nha_cung_cap(ma_nha_cc);