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
 
 