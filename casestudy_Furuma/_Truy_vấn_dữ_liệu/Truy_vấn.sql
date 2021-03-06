use furama_Management;
 -- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
SELECT *
FROM employee
WHERE (employee_name like '%_%_ K%' or employee_name like  '%_%_ H%'  or employee_name like '%_%_ T%')
AND CHAR_LENGTH (employee_name) <= 15 ;

-- 3 .	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. 
SELECT*
FROM customer
WHERE ((year(CURDATE())-year(customer_date)) BETWEEN 18 AND 50) AND address IN ('Đà Nẵng','Quảng Trị');


-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được
--  sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. 

SELECT C.id_customer, C.customer_name, CType.customer_type_name, COUNT(CT.id_contract) AS use_number
FROM customer C
INNER JOIN contract CT ON C.id_customer = CT.id_customer
INNER JOIN customer_type CType ON C.id_customer_type = CType.id_customer_type
WHERE CType.customer_type_name = 'Diamond'
GROUP BY C.id_customer
ORDER BY use_number;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
--  cho tất cả các Khách hàng đã từng đặt phỏng (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 
-- (sửa) 
SELECT C.id_customer, C.customer_name, CT.id_contract, CType.customer_type_name,
CT.start_contract, CT.end_contract, S.cost_retal +coalesce(CTD.amount * ACS.price,0)  as Tong_tien
FROM contract CT
RIGHT JOIN customer C ON CT.id_customer = C.id_customer
INNER JOIN customer_type CType ON CType.id_customer_type = C.id_customer_type
LEFT JOIN service S ON S.id_service = CT.id_service
LEFT JOIN contract_detail CTD ON CT.id_contract = CTD.id_contract
LEFT JOIN accompanied_service ACS ON CTD.id_Acc_service = ACS.id_Acc_service;


-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3). 
-- (sửa) 
select S.id_service, S.service_name, S.area, S.cost_retal, SType.service_type_name
from service S
left join service_type SType on S.id_service_type = SType.id_service_type
where not exists (select * from contract C where C.id_service = S.id_service
and start_contract between '2019-01-01' and '2019-03-31');

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại 
-- dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019. 
SELECT S.id_service, S.service_name, S.area, S.cost_retal, SType.service_type_name
FROM service S
INNER JOIN service_type SType ON S.id_service_type = SType.id_service_type
INNER JOIN  contract CT  ON CT.id_service = S.id_service
WHERE year(CT.start_contract) = 2018
AND CT.id_service NOT IN (
SELECT id_service
FROM contract
WHERE YEAR (start_contract) = '2019'
);
        
-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- Cách 1 dùng distinct 
select distinct customer_name 
from customer;
-- Cách 2 dùng union
select customer_name
from customer
union
select customer_name
from customer;
-- cách 3 dùng group by
select customer_name
from  customer
group by customer_name;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
 select month(start_contract), count(id_contract) as so_hopdong
 from contract
 where year(start_contract) = 2019
 group by(month(start_contract));
 
 -- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong,
 -- NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
 SELECT C.id_contract, C.start_contract,C.end_contract,C.deposit, COUNT(CD.id_contract_detail) AS accompanied_number
FROM contract_detail CD
RIGHT JOIN contract C ON C.id_contract = CD.id_contract
GROUP BY contract_id;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang 
-- là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
SELECT ACS.id_Acc_service, ACS.acc_servie_name, C.customer_name, CType.customer_type_name
FROM accompanied_service ACS
INNER JOIN contract_detail CD ON ACS.id_Acc_service = CD.id_Acc_service
INNER JOIN contract CT ON  CD.id_contract = CT.id_contract
INNER JOIN customer C ON CT.id_customer = C.id_customer
INNER JOIN customer_type CType ON CType.id_customer_type = C.id_customer_type
WHERE CType.customer_type_name = 'Diamond'  AND address IN ('Vinh', 'Quảng Ngãi');

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, 
-- SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết),TienDatCoc của tất cả các dịch vụ
--  đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
-- CÒN THIẾU 
select CT.id_contract, E.employee_name, C.customer_name, C.number_phone, S.service_name, count(CTD.id_Acc_service) ,C.deposit
from Contract CT
INNER JOIN employee E ON E.id_employee = CT.id_employee
INNER JOIN customer C ON C.id_customer = CT.id_customer
INNER JOIN service S ON S.id_service = CT.id_service
INNER JOIN contract_detail CD ON CT.id_contract = CD.id_contract
WHERE  (CT.start_contract BETWEEN '2019-10-01' AND '2019-12-31')
AND S.id_service NOT IN (
SELECT id_service
FROM contract
WHERE start_contract BETWEEN '2019-01-01' AND '2019-06-30'
)
GROUP BY CT.id_contract;

-- 13.	Hiển thị th-- ông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)
SELECT ACS.id_Acc_service,ACS.acc_servie_name, COUNT(CD.id_Acc_service) AS user_times
FROM contract_detail  CD
INNER JOIN accompanied_service ACS ON ACS.id_Acc_service = CD.id_Acc_service
GROUP BY ACS.id_Acc_service
HAVING COUNT(CD.id_Acc_service) >= ALL (
SELECT COUNT(CD.id_Acc_service)
FROM contract_detail  CD
INNER JOIN accompanied_service ACS ON ACS.id_Acc_service = CD.id_Acc_service
GROUP BY ACS.id_Acc_service);


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. 
SELECT ACS.id_Acc_service,ACS.acc_servie_name, COUNT(CD.id_Acc_service) AS user_times
FROM contract_detail  CD
INNER JOIN accompanied_service ACS ON ACS.id_Acc_service = CD.id_Acc_service
GROUP BY ACS.id_Acc_service
HAVING COUNT(CD.id_Acc_service) = 1;
    
   
 -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan,
--  SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019. 
SELECT E.id_employee, E.employee_name, L.level_name, S.section_name, E.number_phone, E.address, COUNT(CT.id_contract) AS contract_numbers
FROM employee E
INNER JOIN `level` L ON L.id_level = E.id_level
INNER JOIN section S ON S.id_section = E.id_section
INNER JOIN contract CT ON CT.id_employee = E.id_employee
WHERE CT.start_contract BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY E.id_employee
HAVING COUNT(CT.id_contract) <= 3;


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019. 
SET SQL_SAFE_UPDATES = 0;
delete 
from employee E
where E.id_employee not in (
select id_employee  
from contract 
where start_contract between '2017-01-01' and '2019-12-31'
-- group by e.id_employee
is not null
) ;

-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật
--  những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.  
-- bước 1 : Tạo bảng tạm chứa những câu lệnh điều kiện 
  CREATE TEMPORARY TABLE IF NOT EXISTS temp(
  select c.id_customer,sum(S.cost_retal +coalesce(CTD.amount * ACS.price,0))  as Tong_tien
  from customer C 
  inner join contract CT on C.id_customer=CT.id_customer
  inner join Service S on CT.id_service = S.id_service
  inner join contract_detail CTD on CTD.id_contract = CT.id_contract
  inner join Accompanied_service ACS on ACS.id_Acc_service = CTD.id_Acc_service 
  where  year(start_contract) = 2019 and C.id_customer_type = (select id_customer_type from customer_type where customer_type_name = 'Platinium')
  group by C.id_customer
  having sum(S.cost_retal +coalesce(CTD.amount * ACS.price,0)) <10000
  );
-- bước 2 , update 
  update customer set id_customer_type = (select id_customer_type from customer_type where customer_type_name = 'Diamond')
  where id_customer in (
  select id_customer
  from temp
  );
  DROP TABLE temp;



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).
set foreign_key_checks = 0;
delete 
from customer where id_customer in (                          --  dùng inner join mà delete hay update thì phải tạo bảng tạm 
select id_customer
from contract c											
where year (start_contract) < 2016 
is not null
);


-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
CREATE TEMPORARY TABLE IF NOT EXISTS temp2 (
SELECT ACS.id_Acc_service , price, sum(CTD.id_Acc_service) as use_time
FROM Accompanied_service ACS
INNER JOIN contract_detail CTD on CTD.id_Acc_service = ACS.id_Acc_service
INNER JOIN contract CT on CT.id_contract = CTD.id_contract
WHERE year(start_contract) = 2019
GROUP BY id_Acc_service
HAVING sum(CTD.id_Acc_service) < 5
);

update Accompanied_service set price = price*2
where price in (
select price
from temp2
);
drop table temp2; 



-- 20.-- 	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao
--  gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select id_employee , employee_name,  email , employee_date
from employee 
union
select  id_customer , customer_name, email, customer_date 
from customer;  

-- 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ
--  là “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”
create view V_NHANVIEN AS
select distinct E.id_employee ,address
from
employee E
inner join contract CT on CT.id_employee = E.id_employee
where start_contract = '2019-12-12' and address like '%Hải Châu%';

-- 22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.
update V_NHANVIEN 
set address = 'Liên Chiểu';

-- 23.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1 
delimiter //
create procedure Sp_1 (id int)
begin
delete
from customer
where id_customer = id;
end;
// delimiter ;

call Sp_1 (2);

-- 24.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ 
-- của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure Sp_2(new_id_employee int,
new_id_customer int,
new_id_service int,
new_start_contract date,
new_end_contract date,
new_deposit int)
begin
if new_id_employee in ( select id_employee from employee) 
 and new_id_customer in (select id_customer from customer)
 and new_id_service in (select id_service from service)
then
insert into contract(id_employee,id_customer,id_service,start_contract,end_contract,deposit)
value(new_id_employee,new_id_customer,new_id_service,new_start_contract,new_end_contract,new_deposit);
else select 'khong the them vao hop dong' ;
end if;
end;

// delimiter ;
drop procedure Sp_2;

call Sp_2 (2,3,4,'2011-08-28','2011-09-28',50);
call Sp_2 (10,3,4,'2011-08-28','2011-09-28',50);

-- 25.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản
--  ghi còn lại có trong bảng HopDong ra giao diện console của database
set @result = 0;
drop trigger if exists tr_1;
delimiter //
create trigger tr_1	
after delete
on contract for each row
begin
	set @result =  concat('so hop dong con lai',(select count(id_contract)
				from contract));
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = @result;
end;
// delimiter ;
delete
from contract
where id_contract = 2 ;

-- 26.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật,
--  nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database
drop trigger if exists tr_2;
 delimiter //
create trigger tr_2
before update 
on contract for each row
begin
declare thong_bao varchar(200);
set thong_bao = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
if datediff(new.end_contract,old.start_contract) <2 --  
then SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = thong_bao;
end if;
end;
// delimiter ;
set SQL_SAFE_UPDATES = 0;
update contract 
set end_contract = '2019-10-15'
where id_contract = 1;

-- 28.	Tạo Store procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là
--  “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu)
--  và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.

delimiter //

CREATE PROCEDURE Sp_3()
BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM service
WHERE id_service IN (
SELECT id_service
FROM (
SELECT S.id_service
FROM service S
INNER JOIN service_type SType ON S.id_service_type = SType.id_service_type
INNER JOIN contract CT ON CT.id_service = S.id_service
WHERE SType.service_type_name = 'Room' AND
CT.start_contract BETWEEN '2015-01-01' AND '2019-12-31'
) AS temp
);
END;
// delimiter ;
DROP PROCEDURE Sp_3;
CALL Sp_3();


-- 27.	Tạo user function thực hiện yêu cầu sau:
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng
--  mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
--  không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này.
-- a :
DELIMITER  //
DROP function IF EXISTS func_1;
CREATE FUNCTION func_1 ()
RETURNS INT
DETERMINISTIC
BEGIN
declare result INT;
SET result = (
SELECT COUNT(id_service)
FROM
(SELECT S.id_service, CT.id_contract, SUM(S.cost_retal) as total_payment, COUNT(ct.id_service)
FROM contract CT
INNER JOIN service S ON CT.id_service = S.id_service
GROUP BY S.id_service
HAVING SUM(S.cost_retal) > 2) AS count_temp
);
RETURN result;
END;
// DELIMITER ;
SELECT func_1();

-- b :

DROP function IF EXISTS func_2;
DELIMITER  //
CREATE FUNCTION func_2 (p_customer_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
declare result INT;
SET result = (
SELECT DATEDIFF(end_contract,start_contract) AS date_diff
FROM contract
WHERE id_customer = p_customer_id
ORDER BY date_diff DESC
LIMIT 1
);
RETURN result;
END;
// DELIMITER ;
SELECT func_2(3);


