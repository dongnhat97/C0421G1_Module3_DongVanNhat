drop database if exists demo;
create database demo;
 use demo;
 create table Products(
 Id int primary key auto_increment,
 productCode int ,
 productName varchar(50),
 productPrice int,
 productAmount int,
 productDescription varchar(50),
 productStatus varchar(50)
 );
 
 insert into Products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
 value (155,'iphone',10,3,'pro','khả dụng'),
        (145,'ipad',9,5,'kute','khả dụng'),
        (133,'nokia',5,2,'new','cháy hàng ');
  
  -- Tạo uineque index 
  explain select *
  from Products
  where productCode = 133;
  create index idx_productCode on 
  products (productcode);
  
  -- xóa index thì phải on table 
  drop index idx_productCode on 
  products;
  
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idex_two on 
products(productPrice,productName);

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_products as 
select productCode, productName, productPrice,productStatus
from products;
 select productName
 from v_products;
 
 -- Tiến hành sửa đổi view
 set sql_safe_updates = 0;
 update v_products 
 set productName = 'cháo lòng'
 where productName = 'ipad';
 
 -- Tiến hành xoá view
 drop view v_products;
 
 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 delimiter //
 create procedure pr_seclect()
 begin
 select*
 from Products;

 end;
 // delimiter ;

call  pr_seclect(); 

-- Tạo store procedure thêm một sản phẩm mới 
delimiter //
create procedure pr_insert(`code` int, product varchar(50), price int , amount int,`Description`varchar(50), `status` varchar(50))
begin
insert into Products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
value (`code`,product,price,amount,`Description`,`status`);
end;
// delimiter ;
drop procedure pr_insert ;

call pr_insert(66,'audi',10000,2,'supper pro','new');
 
 
    --  Tạo store procedure sửa thông tin sản phẩm theo id   
    delimiter //
   create procedure pr_update(idd int,`code` int, product varchar(50), price int , amount int,`Description`varchar(50), `status` varchar(50))
   begin
   update products
   set  productCode = `code`, productName = product ,  productPrice= price,productAmount =amount,productDescription=`Description`,productStatus = `status`
   where id = idd;
   end;
   // delimiter ;
   
   call  pr_update(1,678,'mec',2000,3,'xuat sắc','100%');
 
 
   -- Tạo store procedure xoá sản phẩm theo id
    delimiter //
    create procedure pr_delete(id_delete int)
    begin
    delete
    from Products
    where id = id_delete;
    end;
    // delimiter ;
    
    call pr_delete (1)
   