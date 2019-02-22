drop database if exists univ;
create database univ;
use univ;

drop table if exists department; 
drop table if exists student; 
drop table if exists courses; 
drop table if exists lecturer; 
drop table if exists course_student; 
drop table if exists course_lecturer; 
create table department(
	did int(10) not null primary key auto_increment,
	dname varchar(255) unique not null
	);

create table student(
  sid int(10) not null primary key auto_increment,
  sname varchar(255) not null,
  did int(10) not null,
  foreign key (did) references department (did)
);

create table course(
  cid int(10) not null auto_increment,
  cname varchar(255) unique not null,
  did int(10) not null,
  primary key (cid,did),
  foreign key (did) references department (did)
);

create table lecturer(
  lid int(10) not null auto_increment,
  lname varchar(255) not null,
  did int(10) not null,
  primary key(lid,did) ,
  foreign key (did) references department (did)
);

create table course_student(
  sid int(10) not null,
  cid int(10) not null,
  marks int(10) not null default 0,
  constraint foreign key (cid) references course (cid),
  constraint foreign key (sid) references student (sid)
);

create table course_lecturer(
  lid int(10) not null,
  cid int(10) not null,
  did int(10) not null,
  foreign key (cid,did) references course (cid,did),
  foreign key (lid,did) references lecturer (lid,did)
);

insert into department values(1,"bsb");
insert into department (did,dname) values(2,"ce");
insert into department (did,dname) values(3,"cl");
insert into department (did,dname) values(4,"cse");
insert into department (did,dname) values(5,"mnc");
insert into department (did,dname) values(6,"ec");
insert into department (did,dname) values(7,"ece"),
	(8,"me"),
	(9,"dd");

insert into student values (1,"sheru",2);
insert into student (sname,did) values("avinash",4);
insert into student (sname,did) values("kevin",4);	
insert into student (sname,did) values("phoolchandra",4);
insert into student (sname,did) values("savinay",4),
	("ajay",3),
	("amartaya",7),
	("manish",2),
	("shivam",8),
	("uddesya",5),
  ("priyanshu", 4);

insert into course values (1,"CS101",4);
insert into course (cname,did)values ("CS201",4);
insert into course (cname,did)values ("CS203",4);
insert into course (cname,did)values ("CS344",4);
insert into course (cname,did)values ("CE322",2);
insert into course (cname,did)values ("CS222",4);
insert into course (cname,did)values ("CE202",2);
insert into course (cname,did)values ("EC202",2),
("MA101",5),
("MA225",5),
("MA201",5);  



insert into lecturer values (1,"stephen",4);
insert into lecturer (lname,did) values ("ros",4);	
insert into lecturer (lname,did) values ("arvind khurana",1);
insert into lecturer (lname,did) values ("kedi singh",2);
insert into lecturer (lname,did) values ("tony jacob",6); 

insert into course_student (cid,sid,marks) values (5,1,60);
insert into course_student (cid,sid,marks) values (6,1,80);
insert into course_student (cid,sid,marks) values (1,5,90),
  (2,5,30),
  (5,4,70),
  (7,4,90),
  (8,4,95),
  (8,4,90),
  (4,2,75),
  (4,4,60),
  (4,5,80),
  (6,3,50),
  (5,3,55);
insert into course_student (cid,sid,marks) values (1,6,200);
insert into course_lecturer (lid,cid,did) values (1,1,4); -- enter lecturere department id
  
