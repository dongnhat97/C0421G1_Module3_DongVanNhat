USE `classicmodels`;
alter table `customers` add index idx_customerName (customerName);
explain
select * 
from `customers` where customerName = 'Land of Toys Inc.' ;
-- explain để kiểm tra phải truy vấn qua bao hiêu row , bỏ explain thì xem được thoong tin khách hàng bthuong