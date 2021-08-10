drop database if exists demo;
create database demo;
use demo;
create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users (id,`name`,email,country)
value (1,'Nhật','Nhatpro2gmal','Hà Tĩnh');

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

call sp_id (4) 

