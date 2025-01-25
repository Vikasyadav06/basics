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

select *from student
where grade ="B";
select *from student 
where marks > 80;

select* from student 
where marks+20>80;

select *from student 
where grade ="B" and marks > 50;

select *from student 
where grade ="B" or marks > 50;

select *from student 
where marks between 40 and 60;

select *from student 
where city in ("goa" ,"mumbai");

select *from student 
where city not in ("goa" ,"mumbai");

select *from student limit 2;
select *from student where grade="a" limit 2;

select *from student 
order by grade asc; 
select*from student 
order by marks desc limit 4;

select avg(marks)
from student;

select grade,count(rollno) 
from student group by grade ; 

select grade,avg(marks) 
from student group by grade ; 

select city ,avg (marks)
from student
group by city order by city ;

select city , count(name)
from student 
group by city
having max(marks)>50 ;


select city 
from student 
where grade ="B"
GROUP BY CITY
HAVING max(MARKS) >50
;

set sql_safe_updates = 0;


update student
set city ="mumbai"
where city ="delhi";

update student 
set grade ="A"
where marks >=70;

delete from student
where rollno=15;



create table dept (
id int primary key,
name varchar(50)
);  

insert into dept 
value 
(101,"english"),
(102, "hindi");

update dept
set id =103
where id =102;

select*from dept;

create table teacher (
id int primary key,
name varchar (50) ,
dept_id int,
foreign key (dept_id) references dept(id) 
on update cascade 
on delete cascade
); 

insert into teacher value
(01,"raj",101),
(02, "shyam",102);

select*from teacher;

alter table teacher
add column age int not null default 21 ;

alter table teacher
drop column age ;

alter table teacher 
rename to teacher_info ;


