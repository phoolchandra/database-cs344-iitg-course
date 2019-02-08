drop database if exists univers;
create database univers;
use univers;

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

create table courses(
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
  primary key(lid,did),
  foreign key (did) references department (did)
);

create table course_student(
  sid int(10) not null,
  cid int(10) not null,
  constraint foreign key (cid) references courses (cid),
  constraint foreign key (sid) references student (sid)
);

create table course_lecturer(
  lid int(10) not null,
  cid int(10) not null,
  did int(10) not null,
  foreign key (cid,did) references courses (cid,did),
  foreign key (lid,did) references lecturer (lid,did)
);

insert into department 
values(1,"bsb"),
      (2,"ce"),
      (3,"cl"),
      (4,"cse"),
      (5,"mnc"),
      (6,"ec"),
      (7,"ece"),
      (8,"me"),
      (9,"dd");

insert into student 
values (1,"sheru",2),
       (2,"avinash",4),
       (3,"kevin",4),
       (4,"phoolchandra",4),
       (5,"savinay",4),
       (6,"ajay",3),
       (7,"amartaya",7),
       (8,"manish",2),
       (9,"shivam",8),
       (10,"uddesya",5),
       (11,"priyanshu",4);


insert into courses (cid,cname,did)
values (1,"CS101",4),
       (2,"CS201",4),
       (3,"CS203",4),
       (4,"CS344",4),
       (5,"CS222",4),
       (6,"CE322",2),
       (7,"CE202",2),
       (8,"EC202",2);  


insert into lecturer values (1,"stephen",4);
insert into lecturer (lname,did) values ("ros",4);	
insert into lecturer (lname,did) values ("arvind khurana",1);
insert into lecturer (lname,did) values ("kedi singh",2);
insert into lecturer (lname,did) values ("tony jacob",6); 

insert into course_student (cid,sid) values (5,1);
insert into course_student (cid,sid) values (6,1);
insert into course_student (cid,sid) values (1,5);
insert into course_student (cid,sid) values (2,5);
insert into course_student (cid,sid) values (5,4),
	(7,4);
insert into course_student (cid,sid) values (8,4);  
insert into course_student (cid,sid) values (4,2),
  (4,3),
  (4,4),
  (4,5);

insert into course_lecturer (lid,cid,did) values (1,1,4),
                                                 (1,2,4);