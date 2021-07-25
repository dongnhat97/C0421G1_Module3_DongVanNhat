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
 ('Vũ Trọng Phụng',5,4,4,'1993-08-01','566277677',30,'0918077533','trongphung@gmail.com','Hà Tĩnh'),
 ('Tô Bảo Ngọc',5,3,2,'1998-08-12','56627321',28,'0918077433','baongoc@gmail.com','Đà Nẵng'),
 ('Hoàng Cu Sơn',5,2,1,'1995-08-02','56627321',20,'0918077433','cuson@gmail.com','Đà Nẵng');
 
 -- Thêm dữ liệu bảng khách hàng
 --    3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
-- tên trùng nhau.
-- Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
-- Platinium
 insert into Customer(id_customer_type,customer_name,customer_date,identity_Card,number_phone,email,address)
 value(4,'Đào Bá Lộc','2000-12-08','184265562','0898065729','lockute@gmail.com','Quảng Trị'),
 (2,'Nguyễn Văn Giàu','1980-02-18','187115562','0978065123','taogiauqua@gmail.com','Đà Nẵng'),
 (1,'Thanh Văn Hà','1995-02-22','227115562','0938065663','thanhha@gmail.com','Quảng Ngãi'),
 (4,'Nguyễn Công Bằng','2005-02-22','312115562','0918065567','congminh@gmail.com','Hà Nội'),
 (1,'Võ Quốc Toản','2004-12-12','123115569','0948065236','quoctoan@gmail.com','Vinh'),
 (3,'Đào Bá Lộc','2004-12-12','123115569','0948065236','quoctoan@gmail.com','Nghệ An'),
 (3,'Hồ Ngọc Hà','1984-01-12','123115555','0948065299','ngocha@gmail.com','Sài Gòn');
 
 -- Thêm dữ liệu bảng dịch vụ 
 insert into Service (service_name,area,floors,max_person,cost_retal,id_rental_type,id_service_type,status_service)
 value('Villa Vip Pro',35,5,8,25,2,1,'Còn phòng'),
     ('House Vip',25,4,5,20,2,2,'Còn phòng'),
     ('Room Romatic',18,2,3,12,1,3,'Còn phòng'),
     ('Room Love',12,2,3,21,3,3,'Hết Phòng '),
     ('Villa Beach',55,8,10,50,4,1,'Khả dụng');
     
-- Thêm dữ liệu bảng Hợp đồng 
insert into Contract (id_employee,id_customer,id_service,start_contract,end_contract,deposit)
value (1,2,3,'2019-10-12','2019-11-08',5),
      (2,3,3,'2019-12-12','2019-12-20',6),
      (3,2,2,'2018-03-12','2018-05-20',7),
      (4,2,4,'2018-05-12','2018-08-20',7),
      (5,1,4,'2020-05-12','2020-08-20',3),
      (5,1,4,'2021-03-12','2021-05-20',4),
      (2,1,4,'2017-03-12','2017-05-20',4);

-- Thêm dữ liệu dịch vụ đi kèm
insert into Accompanied_service(acc_servie_name,price,unit,status_available)
value('Giặt đồ',2,'$','Khả dụng'),
     ('Massage Yoni',20,'$','Không đủ nhân lực'),
     ('Quẩy bar',30,'$','Khả dụng'),
     ('Ăn sáng',8,'$','Khả dụng'),
     ('Đón tiễn',8,'$','Khả dụng'),
     ('Bóng cười',2,'$','Khả dụng'),
     ('Tennis',12,'$','Khả dụng');
     
-- Thêm dữ liệu dịch vụ chi tiết      
 insert into contract_detail(id_contract,id_Acc_service,amount)
 value(1,1,4),
      (2,2,1),
      (4,3,2),
      (5,4,3),
      (6,3,5),
      (2,5,2),
      (3,7,1);
      
      
