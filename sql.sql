create database college_wctm;
use college_wctm ;

create table student(
rollno int primary key ,
name varchar(100),
marks int not null,
grade varchar (50),
city varchar(50)
);

insert into student
(rollno,name,marks,grade,city) value
(11,"anil",78,"B","DELHI"),
(12,"sunil",28,"A","punjab"),
(13,"kunal",78,"C","assam"),
(14,"anjul",68,"B","surat"),
(15,"anilali",48,"D","goa"),
(16,"null",58,"A","mumbai");

drop table student ;

select*from student;
select rollno,name , city from student;

select *from student where grade ="B";
select *from student where marks > 80;
select* from student 
where marks+20>80;

select *from student where grade ="B" and marks > 50;

select *from student where grade ="B" or marks > 50;

select *from student where marks between 40 and 60;

select *from student where city in ("goa" ,"mumbai");

select *from student where city not in ("goa" ,"mumbai");

select *from student limit 2;
select *from student where grade="a" limit 2;

select *from student order by grade asc; 
select*from student order by marks desc limit 4;
