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
       
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order    
   select order_id, order_date, order_total_price
   from `order`;
   
--  Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
  select customer_name, product_name
  from customer c inner join `order` o on c.customer_id = o.customer_id
  inner join order_detail od on o.order_id = od.order_id
  inner join product p on od.product_id = p.product_id;
   
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào    
   select * from customer c where not exists ( select * from `order` o where o.customer_id = c.customer_id);
   
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng 
-- tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) 
select o.order_id, o.order_date,  od.order_quantity * p.product_price as 'Tong gia tien san pham'
from `order` o inner join order_detail od on o.order_id = od.order_id
inner join product p on od.product_id = p.product_id
order by order_date asc;
