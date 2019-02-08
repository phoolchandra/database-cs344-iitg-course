-- Ans a
select sname
from student
where sid in (
select sid
from course_student
where cid in(
select cid
from courses
where cname="CS344"
));


-- Ans b
select sname
from student
where sid in (
select sid
from course_student
where cid in(
select cid
from course_lecturer
where lid in(
 select lid
from lecturer
where lname="stephen"
)
));



-- Ans c
select cname
from courses
where did not in (
  select did
  from student
  where sname="phoolchandra"
) and cid in (
select cid
from course_student
where sid=(
select sid
from student
where sname="phoolchandra"
)
);

-- Ans d
insert into course_student (cid,sid) values (10,4);

-- Ans e
delete from courses where cid=7;




-- Ans f
select cname
from courses
where cid in
(
	select cid 
	from course_student
	where sid = 4
);

-- Ans g
select sname, sid as roll_no
from student
where sid in
(
select sid
from course_student
where cid in
(
  select cid 
  from course_student
  where sid = 1
) and sid != 1
);


-- ans h
select cname, cid
from courses
where cid in
(
  select cid
  from course_student
  where sid in
  (
     select sid
     from student
     where did not in
     (
         select did
         from department
         where dname = "cse"
     )
  )
) and did in
(
   select did
   from department
   where dname = "cse"
);


-- ans i
-- here i did not take the attribute of marks in cousre_student table
--  because marks attribute is additional not mentioned in questio
-- so here i am leavin exercise for you


-- ans j
insert into course_lecturer (lid,cid,did) values (1,1,4);