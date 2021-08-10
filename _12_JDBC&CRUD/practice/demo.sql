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
create table permision (
id int primary key,
`name` varchar(45)
);
create table user_permision (
id int,
permision_id int,
primary key (id, permision_id),
foreign key (id) references users (id),
foreign key (permision_id) references permision (id)
);

insert into Permision(id, `name`) values(1, 'add');
insert into Permision(id, `name`) values(2, 'edit');
insert into Permision(id, `name`) values(3, 'delete');
insert into Permision(id, `name`) values(4, 'view');

 

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


-- hàm hiển thị 
delimiter //
create procedure sp_selectAll()
begin
select id, `name`, email, country
from users;
end; 
// delimiter ; 
call sp_selectAll();
-- Hàm create 
delimiter //
create procedure sp_create( new_name varchar(30),new_email varchar(50), new_country varchar(50))
begin
insert into users(`name`,email,country)
value(new_name,new_email,new_country);
end; 
// delimiter ;

call sp_create ('Nhật','pro@gmail.com','Hà Tĩnh');
--  Hàm update
delimiter //
create procedure sp_update (new_id int, new_name varchar(50),new_email varchar(50),new_country varchar(50))
begin
update users
set `name`= new_name,email=new_email,country=new_country
where id  = new_id;
end
// delimiter ; 

call sp_update(4,'Tăng ku HÀ ','hameomeo@gmail.com','Lào');
-- Hàm delete 
delimiter //
create procedure sp_delete(new_id int )
begin
delete
from users
where id = new_id ;
end;
// delimiter  

call sp_delete(5)
