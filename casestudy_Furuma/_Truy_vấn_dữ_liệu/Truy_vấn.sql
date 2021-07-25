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
CT.start_contract, CT.end_contract, S.cost_retal + CTD.amount * ACS.price as Tong_tien
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
-- sửa lại thuộc tính bài 15 

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019. 
SET SQL_SAFE_UPDATES = 0;
delete 
from employee E
where E.id_employee not in (
select id_employee  
from contract 
where start_contract between '2017-01-01' and '2019-12-31'
group by e.id_employee
is not null
) ;

-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật
--  những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.  
  update customer set id_customer_type = 1 
  where id_customer_type = 2 and exists(
  select*, CTD.amount * ACS.price as Tong_tien
  from customer C 
  inner join customer_type CType on CType.id_customer_type = C.id_customer_type
  inner join contract CT on C.id_customer=CT.id_customer
  inner join contract_detail CTD on CTD.id_contract = CT.id_contract
  inner join Accompanied_service ACS on ACS.id_Acc_service = CTD.id_Acc_service 
  where  year(start_contract) = 2019
  group by C.id_customer
  having Tong_tien <10000
  );



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
update Accompanied_service  set price = price*2 where exists (
select*, count(CTD.id_Acc_service) 
from contract CT 
inner join contract_detail CTD on CT.id_contract = CTD.id_contract
inner join Accompanied_service ACS on CTD.id_Acc_service = ACS.id_Acc_service
where year(start_contract) = 2019
group by ACS.id_Acc_service
having count(CTD.id_Acc_service) <10
);



-- 20.-- 	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao
--  gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select S.id_employee , C.id_customer , S.employee_name,  C.customer_name , S.email , C.email, C.customer_date,S.employee_date
from employee S
inner join contract CT on CT.id_employee = S.id_employee
inner join


