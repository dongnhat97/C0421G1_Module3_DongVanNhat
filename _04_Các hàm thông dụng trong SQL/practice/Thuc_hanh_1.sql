use quanlysinhvien;
-- Hiển thị số lượng sinh viên ở từng nơi 
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

-- Tính điểm trung bình các môn học của mỗi học viên
 select s.StudentId, s.StudentName, avg(mark)
 from student s 
 inner join Mark m on s.StudentId = m.StudentId
 group by  s.StudentId, s.StudentName;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15 