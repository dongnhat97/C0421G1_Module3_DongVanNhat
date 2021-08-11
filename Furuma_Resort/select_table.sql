use furuma_resort;
-- Thêm vị trí  
insert into position (position_name)
value ('lễ tân'),('phục vụ'),('chuyên viên'),('giám sát'),('quản lý'),('giám đốc');

-- Thêm trình độ  
insert  into education_degree (education_degree_name)
 value ('Trung cấp'),('Cao đẳng'),('Đại học'),('sau Đại học');
 
 -- Thêm bộ phận 
  insert into division (division_name)
 value ( 'sale_marketing'),('hành chính'),('phục vụ'),('quản lý');
 
 -- Thêm loại khách hàng 
 insert into customer_type (customer_type_name)
 value('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');
 
 -- Thêm loại dịch vụ 
 insert into service_type (service_type_name) 
 value('villa'),('house'),('room');
 
 -- thêm kiểu thuê 
  insert into rent_type (rent_type_name) 
 value('Hour'),('day'),('month'),('year');
 
 --  Loại khách hàng 
  insert into customer_type (customer_type_name)
 value('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');
 
 
 
 
 
 -- Thêm customer
insert into Customer (customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_car,customer_phone,customer_email,customer_address)
value(4,'Đào Bá Lộc','2000-12-08',1,'184265562','0898065729','lockute@gmail.com','Quảng Trị'),
 (2,'Nguyễn Văn Giàu','1980-02-18',1,'187115562','0978065123','taogiauqua@gmail.com','Đà Nẵng'),
 (1,'Thanh Văn Hà','1995-02-22',2,'227115562','0938065663','thanhha@gmail.com','Quảng Ngãi'),
 (4,'Nguyễn Công Bằng','2005-02-22',1,'312115562','0918065567','congminh@gmail.com','Hà Nội'),
 (1,'Võ Quốc Toản','2004-12-12',1,'123115569','0948065236','quoctoan@gmail.com','Vinh'),
 (3,'Đào Bá Lộc','2004-12-12',2,'123115569','0948065236','quoctoan@gmail.com','Nghệ An'),
 (3,'Hồ Ngọc Hà','1984-01-12',2,'123115555','0948065299','ngocha@gmail.com','Sài Gòn'); 