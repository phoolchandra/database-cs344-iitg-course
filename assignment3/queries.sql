-- ans 6
select did,count(lid)
from lecturer
group by did



-- ans 7
select DISTINCT student.sid,student.sname 
from student join course_student on student.sid = course_student.sid
 where student.sid not in (
select sid from course_student where course_student.cid in (
select cid from course_lecturer where  course_lecturer.lid =1 )
);


-- ans 8
SELECT AVG(marks), s.did, cid 
FROM student s 
INNER JOIN course_student ON s.sid =course_student.sid 
GROUP BY cid, s.did;


-- 9
select f1.marks, f1.dept, f2.course from
(select max(marks) as marks, dept
from (
 select avg(marks) as marks, s.did as dept, cid as course
 from student s 
 inner join course_student as t1 on s.sid = t1.sid
 group by cid, s.did
) as T group by dept) as f1
inner join 
(select avg(marks) as marks, s.did as dept, cid as course from student s 
 inner join course_student as t2 on s.sid = t2.sid group by cid, s.did
) as f2 on f1.marks = f2.marks and f1.dept = f2.dept;




-- ans 10
select count(sid) from course_student where cid = 2 and marks >=70
union select count(sid) from course_student WHERE cid = 2 and marks<70 && marks>=40
union select count(sid) from course_student WHERE cid = 2 and marks<40;





