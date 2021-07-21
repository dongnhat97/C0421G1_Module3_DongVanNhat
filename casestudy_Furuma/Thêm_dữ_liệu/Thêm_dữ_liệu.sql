use Furama_Management;
-- thêm vị trí 
insert into position (position_name)
value ('lễ tân'),('phục vụ'),('chuyên viên'),('giám sát'),('giám đốc');

-- thêm trình độ
 insert  into `level` (level_name)
 value ('Trung cấp'),('Cao đẳng'),('Đại học'),('sau Đại học');
 
 -- thêm bộ phận 
 insert into section (section_name)
 value ( 'sale_marketing'),('hành chính'),('phục vụ'),('quản lý');
 
 -- thêm dữ liệu loại khách
 insert into customer_type (customer_type_name)
 value('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');
 
 -- thêm dữ liệu kiểu thuê
 insert into rental_type (rental_type_name) 
 value('Hour'),('day'),('month'),('year');
 
 -- thêm dữ liệu loại dịch vụ
 insert into service_type (service_type_name) 
 value('villa'),('house'),('room');
 
 -- thêm dữ liệu bảng nhân viên
 insert into employee (employee_name,id_position,id_level,id_section,employee_date,identity_Card,salary,number_phone,email,address) 
 value('Ngô Tuấn Kiệt',1,1,2,'1998-12-03','175273648',8,'0987673567','kiet@gmail.com','Huế'),
 ('Văn Thanh Hà',2,3,3,'1995-11-03','266273648',6,'0898077533','thanhha@gmail.com','Hải Châu'),
 ('Trần Thị Diệp',1,3,4,'1991-10-11','566273648',7,'0978077666','vandiep@gmail.com','Quảng Nam'),
 ('Trần Trọng Tài',3,2,1,'1993-08-01','566277677',12,'0918077533','vandiep@gmail.com','Quảng Bình'),
 ('Vũ Trọng Phụng',5,4,4,'1993-08-01','566277677',30,'0918077533','vandiep@gmail.com','Hà Tĩnh');
 
 -- Thêm dữ liệu bảng khách hàng
 insert into Customer(id_customer_type,customer_name,customer_date,identity_Card,number_phone,email,address)
 value(2,'Đào Bá Lộc','2000-12-08','184265562','0898065729','lockute@gmail.com','Quảng Trị'),
 (1,'Nguyễn Văn Giàu','1980-02-18','187115562','0978065123','taogiauqua@gmail.com','Quảng Bình'),
 (3,'Thanh Văn Hà','1995-02-22','227115562','0938065663','thanhha@gmail.com','Kon Tum'),
 (4,'Nguyễn Công Bằng','2005-02-22','312115562','0918065567','congminh@gmail.com','Hà Tĩnh'),
 (4,'Võ Quốc Toản','2004-12-12','123115569','0948065236','quoctoan@gmail.com','Nghệ An');
 
