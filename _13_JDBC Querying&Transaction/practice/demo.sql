drop database if exists demo;
create database demo;
use demo;
-- Bảng user  
create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
-- Bảng Permision 
create table Permision(
permision_id int(11) primary key,
name varchar(50)
);
-- User_Permision
create table User_Permision(
permision_id int(11),
id int(11),
foreign key(id) references users(id),
foreign key(permision_id) references Permision(permision_id)
);
 

-- Thêm dữ liệu bảng User 
insert into users (id,`name`,email,country)
value (1,'Nhật','Nhatpro2gmal','Hà Tĩnh');

-- Thêm dữ liệu bảng permision
insert into Permision(id, `name`) 
values(1, 'add');
insert into Permision(id, `name`) 
values(2, 'edit');
insert into Permision(id, `name`) 
values(3, 'delete');
insert into Permision(id, `name`) 
values(4, 'view'); 

SET SQL_SAFE_UPDATES = 0;
update users 
set `name` = 'Hoahiii',email='hello',country= 'Ha Tinh'
where id = 3;

delete 
from users 
where id = 1;

select id, `name`, email, country
from users 
where country =  'Ha Tinh';

select id, `name`, email, country
from users 
order by `name`;

delimiter //
create procedure sp_id(p_id int)
begin
select id, `name`, email, country
from users 
where id = p_id;
end;
// delimiter ; 

call sp_id (4); 


