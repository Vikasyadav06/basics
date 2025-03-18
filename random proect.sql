SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name , age , gender
 FROM parks_and_recreation.employee_demographics;
 
 SELECT first_name , age ,age + 10 , gender
 FROM parks_and_recreation.employee_demographics;
 
 #=()used for writing comments
 
# pemdas(prentasis,exponent ,multiplication, division , addition , substraction)

SELECT distinct  first_name , gender 
 FROM parks_and_recreation.employee_demographics;
 
 # WHERE STATEMENT 
 
 SELECT * 
 FROM employee_salary
where salary <=50000
 ;
 
select *from employee_demographics
 where birth_date >'1985-01-01' and gender ='male'
 ;
 
# LIKE STATEMENT 
-- % = ANYTHING
-- _= SPECIFIC VARIABLE 

select *from employee_demographics
where last_name like  'bre%'
;

## group by 

select *from employee_demographics;

select gender , sum(age),count(age)
from employee_demographics
group by gender
;

-- order by 

select *
from employee_demographics
order by gender 
;

-- having vs where 
select gender ,avg (age)
from employee_demographics
group by gender 
having avg(age)>40
;


 SELECT occupation,avg(salary)
 FROM employee_salary
 where occupation like '%manager'
 group by occupation
 having avg(salary)>70000
;

-- limit & aliasing

select *
from employee_demographics
order by age desc
limit 4
;

select gender,avg (age) 
from employee_demographics
group by gender;

-- join = used for join two tables with same columns

select *
from employee_demographics as dem
;

select *
from employee_salary as sal
;

select *
from employee_demographics
join employee_salary
on employee_demographics.employee_id=employee_salary.employee_id
;


select *
from employee_demographics
right join employee_salary
on employee_demographics.employee_id=employee_salary.employee_id
;

-- joining multiple table 
select *
from employee_demographics
join employee_salary
on employee_demographics.employee_id=employee_salary.employee_id
join parks_departments
on employee_salary.dept_id=parks_departments.department_id
;

select *
from parks_departments;

-- unions = used for joining rows 

select first_name,last_name 
from employee_demographics
union 
select first_name,last_name 
from employee_salary;


select first_name,last_name ,'old man' as label
from employee_demographics
where age >40 and gender='male'
union 
select first_name,last_name ,'old lady' as label 
from employee_demographics
where age >40 and gender='female'
union
select first_name,last_name ,'highly paid ' as label 
from employee_salary
where salary >70000 
order by first_name asc
;

-- string function  

select last_name, length(last_name)
from employee_demographics
order by 2  ;

select first_name, upper(last_name)
from employee_demographics
;

-- substring

select last_name, 
left(last_name,3),
right(last_name,3)
from employee_demographics
;

select birth_date,
substring(birth_date,3,2) as birth_year
from employee_demographics
;
-- replace
select first_name,replace(first_name,'a','r')
from employee_demographics
;

-- concat
select first_name, last_name,
concat(first_name,' ', last_name)
from employee_demographics
;

-- locate 
select first_name,locate('jer', first_name)
from employee_demographics
;

-- case statement
select first_name , last_name,age,

case
when age<=30 then 'young'
when age between 30 and 50 then 'adult'
when age>= 50 then " old "
end as age_bracket

from employee_demographics
;

-- my way 
select first_name , occupation ,salary ,
case
when salary <=50000 then "5% increment"
when salary >=50000 then "7% increment"
when occupation = "finance" then "10% bonus"
end as pay_slip_changes
from employee_salary;

-- correct way 

select first_name , occupation ,salary ,
case
when salary <50000 then salary+(salary*0.05)
when salary >50000 then salary+(salary*0.07)
end as pay_slip_changes ,
case
when dept_id =6 then salary * .10
end as bonus_added
from employee_salary;

-- subqueries
select*
from employee_demographics
where employee_id in (select employee_id 
from employee_salary
where dept_id = 1
 )
 ;
