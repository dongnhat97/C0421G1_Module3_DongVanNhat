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
SELECT C.customer_id, C.customer_name, CT.contract_id, CType.c_type_name,
CT.date_make_contract, CT.date_end_contract
FROM contract CT
RIGHT JOIN customer C ON CT.customer_id = C.customer_id
INNER JOIN customer_type CType ON CType.type_id = C.customer_type_id
LEFT JOIN service S ON S.service_id = CT.service_id
LEFT JOIN contract_detail CTD ON CT.contract_id = CTD.contract_id
LEFT JOIN accompanied_service ACS ON CTD.accompanied_id = ACS.accompanied_id;


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
