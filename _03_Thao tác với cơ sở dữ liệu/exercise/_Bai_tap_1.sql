SELECT * FROM quanlysinhvien.class;
select * from quanlysinhvien.`subject`;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ 
select * from quanlysinhvien.student where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * 
from quanlysinhvien.class
 where StartDate>= '2008-12-01 00:00:00' and StartDate <= '2009-01-01 00:00:00';

--  Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * 
from quanlysinhvien.`subject` 
where Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
 SET SQL_SAFE_UPDATES = 0;
 update  Student set ClassId = 2 where StudentName = 'hung' ;
 select * from quanlysinhvien.student;
 
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
 select s.StudentName, su.SubName, m.Mark 
 from student s
 inner join mark m on s.StudentId = m.SubId inner join `subject` su on su.SubId = m.SubId
 order by mark desc;
