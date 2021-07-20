drop database if exists sale_management;
create database sale_management;
use sale_management;
create table customer(
customer_id int primary key not null auto_increment,
customer_name varchar(30) not null,
customer_age int not null);

create table `order`(
order_id int primary key not null auto_increment,
customer_id int,
order_date datetime not null,
order_total_price int,
foreign key (customer_id) references customer(customer_id)
);

create table product(
product_id int primary key not null auto_increment,
product_name varchar(30) not null,
product_price int not null
);

create table order_detail(
product_id int,
order_id int,
order_quantity int not null,
primary key (product_id, order_id),
foreign key (product_id) references product(product_id),
foreign key (order_id) references `order`(order_id)
);
-- thêm ở bảng customer 
insert into Customer
value(1, 'Minh Quan',10),
	 (2, 'Ngoc Oanh',20),
     (3, 'Hong Ha',50);
  
  -- thêm dữ liệu ở bảng product
insert into Product ( product_name,product_price)
value  ('may giat',3),
       ('dieu hoa',5),
       ('ti vi',4),
       ('tu lanh',6),
       ('bep dien',8);
    
-- thêm dữ liệu ở bảng order
insert into `order` (customer_id, order_date)
value (1, '2006-03-21');
insert into `order` (customer_id, order_date)
value (2, '2006-03-23');
insert into `order` (customer_id, order_date)
value (1, '2006-03-16');


-- thêm dữ liệu bảng order_deta
insert into order_detail  ( product_id,order_id,order_quantity)
value  (1,1,3),
       (1,3,7),
	   (1,2,2),
       (2,1,1);

    