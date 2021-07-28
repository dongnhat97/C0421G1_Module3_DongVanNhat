drop database if exists Furama_Management;
create database Furama_Management;
use Furama_Management;
-- bảng ví trí  
create table position (
id_position int primary key auto_increment,
position_name varchar(50)
);

-- bảng trình độ ;
create table `level`(
id_level int primary key auto_increment,
level_name varchar(50)
);

-- bảng bộ phận 
create table section (
id_section int primary key auto_increment,
section_name varchar(50)
);

-- bảng loại khách 
create table customer_type  (
id_customer_type int primary key auto_increment,
customer_type_name varchar(50)
);

-- Bảng kiểu thuê 
create table rental_type (
id_rental_type int primary key auto_increment,
rental_type_name varchar (50)
);

-- bảng Loại dịch vụ 
create table service_type(
id_service_type int primary key auto_increment,
service_type_name varchar(50)
);

-- Bảng nhân viên 
create table employee (
id_employee int primary key auto_increment,
employee_name varchar(50),
id_position int,
id_level int,
id_section int,
employee_date date,
identity_Card varchar(50),
salary int,
number_phone varchar(50),
email varchar(50),
address varchar(50),
foreign key(id_position) references position (id_position),
foreign key(id_level) references `level` (id_level),
foreign key(id_section) references section (id_section)
);

-- Bảng khách hàng 
create table Customer (
id_customer int primary key auto_increment,
id_customer_type int,
customer_name varchar(50),
customer_date date,
identity_Card varchar(50),
number_phone varchar(50),
email varchar(50),
address varchar(50),
foreign key(id_customer_type) references customer_type (id_customer_type)
);

-- Bảng dịch vụ 
create table Service (
id_service int primary key auto_increment,
service_name varchar(50),
area int,
floors int,
max_person int,
cost_retal int,
id_rental_type int,
id_service_type int,
status_service varchar(50),
foreign key(id_rental_type) references rental_type (id_rental_type),
foreign key(id_service_type) references service_type(id_service_type)
);

-- Bảng hợp đồng 
create table Contract (
id_contract int primary key auto_increment,
id_employee int,
id_customer int,
id_service int,
start_contract date,
end_contract date,
deposit int,
foreign key(id_employee) references employee(id_employee) on update cascade on delete cascade,
foreign key(id_customer) references Customer(id_customer)on update cascade on delete cascade,
foreign key(id_service) references Service(id_service) on update cascade on delete cascade

);

-- Bảng dịch vụ đi kèm
create table Accompanied_service (
id_Acc_service int primary key auto_increment,
acc_servie_name varchar(50),
price int,
unit varchar(50),
status_available varchar(50)
);

-- bảng hợp đồng chi tiết 
create table contract_detail(
id_contract_detail int primary key auto_increment,
id_contract int,
id_Acc_service int,
amount int,
foreign key(id_contract) references Contract(id_contract) on update cascade on delete cascade,
foreign key(id_Acc_service) references Accompanied_service(id_Acc_service)

);

-- 

 