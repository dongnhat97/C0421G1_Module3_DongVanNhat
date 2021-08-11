drop database if exists furuma_resort;
create database furuma_resort;
use furuma_resort;
-- Bảng position 
create table position (
position_id int primary key auto_increment,
position_name varchar(50)
);
-- Bảng  education_degree
create table education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(50)
);
-- Bảng division
create table division (
division_id int primary key auto_increment,
division_name varchar(50)
);

-- Bảng customer_type
create table customer_type (
customer_type_id int primary key auto_increment,
customer_type_name varchar(50)
);

-- Bảng service_type  
create table service_type (
service_type_id int primary key auto_increment,
service_type_name varchar(50)
);

-- Bảng rent_type 
create table rent_type (
rent_type_id int primary key auto_increment,
rent_type_name varchar(50),
rent_type_cost double
);


-- Bảng role 
create table `role`(
role_id int primary key auto_increment,
role_name varchar(50)
);


-- Bảng User
create table `user`(
user_name varchar(50) primary key,
password_name varchar(50)
);
-- Bảng User_role
create table user_role (
 user_role_id int primary key auto_increment,
 user_name varchar(50),
 role_id int,
 foreign key(role_id) references `role`(role_id),
 foreign key(user_name) references `user`(user_name)
); 
 
 -- Bảng employee
 create table employee(
 employee_id int primary  key auto_increment,
 employee_name varchar(50),
 employee_birthday date,
 employee_id_car varchar(50),
 employee_salary double,
 employee_phone varchar(50),
 employee_email varchar(50),
 employee_address varchar(50),
 position_id int,
 education_degree_id int,
 division_id int,
 user_name varchar(50),
 foreign key(position_id) references `position`(position_id),
 foreign key(education_degree_id) references education_degree(education_degree_id),
 foreign key(division_id) references division(division_id),
 foreign key(user_name) references `user`(user_name)
 );
 -- Hiển thị  
 select * 
 from employee; 
 
 --  Bảng customer --------------------------------------------------------------------------------------------
 create table customer(
 customer_id int primary key auto_increment,
 customer_code varchar(50),
 customer_type_id int,
 customer_name varchar(50),
 customer_birthday date,
 customer_gender int,
 customer_id_car varchar(50),
 customer_phone varchar(50),
 customer_email varchar(50),
 customer_address varchar(50),
 foreign key(customer_type_id) references customer_type(customer_type_id) 
 );
 -- insert 
insert into customer (customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_car,customer_phone,customer_email,customer_address) 
 value('code vip',2,'Le văn Dẹp','2000-12-08',1,'184265562','0898065729','depdeptrai@gmail.com','Quảng Trị');
 -- search
 select*
 from customer
 where customer_id = 3;
 -- update
 
 update customer
 set customer_code = 'vina', customer_type_id = 1, customer_name ='Ha', customer_birthday = '1997-08-28', customer_gender=1,customer_id_car='09999', customer_phone ='0997268322',customer_email='nhapdepzai@',customer_address='Hai phong'
where customer_id = 1; 
 
 
 
 --  Bảng service ---------------------------------------------------------------------------------
 create table service (
 service_id int primary key auto_increment,
 service_code varchar(50),
 service_name varchar(50),
 service_area int,
 service_cost double,
 service_max_people int,
 rent_type_id int,
 service_type_id int,
 standard_room varchar(50),
 description_other_convenience varchar(50),
 pool_area double,
 number_of_floors int,
 foreign key(rent_type_id) references rent_type(rent_type_id),
 foreign key(service_type_id) references  service_type(service_type_id)
 );
 
 -- Bảng contract 
 create table contract  (
 contract_id int primary key auto_increment,
 contract_start_date datetime,
 contract_end_date datetime,
 contract_deposit double,
 contract_total_money double,
 employee_id int,
 customer_id int,
 service_id int 
 );
 
 -- -- Bảng attach_service
create table attach_service(
attach_service_id int primary key auto_increment,
attach_service_name varchar(50),
attach_service_cost double,
attach_service_unit varchar(50),
attach_service_status varchar(50)
); 

-- Bang contract_detail
create table contract_detail(
contract_detail_id int primary key auto_increment,
contract_id int,
attach_service_id int,
quantity int,
foreign key(contract_id) references contract(contract_id),
foreign key(attach_service_id) references attach_service(attach_service_id)
); 
 

