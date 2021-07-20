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
order_total_price int not null,
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