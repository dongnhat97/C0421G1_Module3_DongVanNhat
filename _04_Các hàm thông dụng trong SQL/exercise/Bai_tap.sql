use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất. 
SELECT *
FROM `subject`
WHERE credit= (SELECT MAX(credit) FROM subject );

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.subId, s.subName , s.Credit,s.`Status`, max(m.mark) as 'Điểm cao nhất'
from `subject`s join Mark m on s.subId = m.subId;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần 
select s.StudentId,s.StudentName,s.Address,s.Phone,s.`Status`, m.Mark, avg(m.Mark) as 'DTB'
from Student s join Mark m on s.StudentId = m.StudentId
group by s.studentId, s.StudentName
order by DTB DESC;

   


