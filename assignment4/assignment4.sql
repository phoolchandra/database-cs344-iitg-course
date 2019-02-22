create index indccid on course_student (cid);
create index indcid on course_student (marks);
create index cidmarks on course_student (cid,marks);	
create index sname_sid on student (sname, sid);


-- Ans 1
select s.sid,s.sname
from course_student cs
use index (sidmarks)
inner join student as s use index (sname_sid) on s.sid=cs.sid
where cid = 1 and marks > (
select avg(marks) 
from course_student use index (indccid) 
where cid=2
);


-- Ans 2
create view v as select c.cid, c.cname, cs.sid from  
course c
inner join course_student cs on cs.cid=c.cid

select cid 
from v 
where sid = 2


-- Ans 3
delimiter $$
create trigger valid_marks before insert on course_student
	for each row 
	begin 
	  if new.marks < 0 then
	      set new.marks = 0;
	  elseif new.marks > 100 then
	  set new.marks = 100;
	  end if;
	end $$
	
delimiter ;	  -- make space between delimiter and space 
insert into course_student (cid,sid,marks) values (3,6,-10);      

-- Ans 4
alter table course_student add attnd int(10) default 75;
update course_student set attnd = 80;



-- Ans 7
create view grades_view as 
select t.grades, cs.cid, cs.sid from
course_student cs
inner join 
(select IF(marks>70,"A", IF(marks>40, "B", "F")) as grades, sid,cid 
from course_student) t on cs.cid=t.cid and cs.sid=t.sid


-- Ans 9
ALTER TABLE course_student add g varchar(10) default "D";

 delimiter $$
 
 CREATE TRIGGER grade_s before INSERT ON course_student
     FOR EACH ROW FOLLOWS valid_marks
     BEGIN
        IF NEW.marks < 40 THEN
           SET NEW.g = "F";
        ELSEIF NEW.marks < 70 THEN
           SET NEW.g = "B";
        ELSEIF NEW.marks < 101 THEN
           SET NEW.g ="A";
        END IF;
     END $$ 
  delimiter ;

  select * from course_student;

   insert into course_student (sid,cid,marks,attnd) values (2,'CS340',50,80);

   select * from course_student;

   -- 

-- ans 5
create index indsid on student (sid)
create index indsid on course_student (sid)	
   SELECT * FROM student as s
	WHERE NOT EXISTS (
		SELECT e.cid FROM course_student as e
		use index(indsid)
		WHERE e.sid = 1
		AND cid NOT  IN (
			SELECT e.cid FROM course_student as e
			use index(indccid)
			WHERE e.sid = s.sid 
		)
	) and sid != 1;


/*7*/
CREATE VIEW A_grades AS SELECT "A" as grade,COUNT(sid) FROM course_student WHERE cid = 2 && marks>=70;
CREATE VIEW B_grade AS SELECT "B" as grade,COUNT(sid) FROM course_student WHERE cid = 2 && marks<70 && marks>=40;
CREATE VIEW F_grade AS SELECT "F" as grade,COUNT(sid) FROM course_student WHERE cid = 2 && marks<40;

SELECT * FROM A_grade
UNION
SELECT * FROM B_grade
UNION
SELECT * FROM F_grade
where sid = 2; 

-- ans 7

CREATE VIEW A_g AS SELECT "A" as grade,sid,cid FROM course_student WHERE marks>=70;
CREATE VIEW B_g AS SELECT "B" as grade,sid,cid FROM course_student WHERE marks<70 && marks>=40;
CREATE VIEW F_g AS SELECT "F" as grades,sid,cid FROM course_student WHERE marks<40;

SELECT * FROM A_g
where sid = 2
UNION
SELECT * FROM B_g
where sid = 2
UNION
SELECT * FROM F_g
where sid = 2; 





-- NO/*8*/

CREATE VIEW t as
SELECT CASE    
    WHEN marks BETWEEN 0  AND 39 THEN 'F'  
    WHEN marks BETWEEN 40 AND 69 THEN 'B'  
    WHEN marks BETWEEN 70 AND 100 THEN 'A'  
  END AS grade  
  FROM course_student;

SELECT t.grade, count(*)  
FROM  t 
GROUP BY t.grade;

-- ans 7
CREATE VIEW v_gr1 AS (
  SELECT sid, cid, marks 
  FROM course_student
);

SELECT cid, CASE    
    WHEN marks BETWEEN 0 AND 39 THEN 'F Grade'  
    WHEN marks BETWEEN 40 AND 69 THEN 'B Grade'  
    WHEN marks BETWEEN 70 AND 100 THEN 'A Grade'  
  END AS grade  
FROM v_gr1 WHERE sid=2;

-- ans 8
INSERT INTO v_gr1  VALUES (4, 6, 20);