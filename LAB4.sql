--23P-0573 HARIS 

--1 Write a query to display the total salary of each department, grouped by department name.
select department_id ,  sum(salary) as total from   employees  group by department_id ;    

--2 Display the number of employees in each department where the count is more than 5.
select   department_id ,   count(department_id)  from employees group by department_id   having   count(department_id) > 5 ;

--3 Find the average salary of employees for each job role, but only show job roles where the average salary is greater than 5000.
select  job_id   , avg(salary)    from   employees    group by   job_id   having avg(salary)   > 5000;

--4 List the departments where the total salary expenditure exceeds $100,000.
select   department_id  , avg(salary)    from employees  group by    department_id     having  avg(salary)  >10000;

--5 Write a query to find the details of the employee with the highest salary in the company.
select first_name , last_name , department_id , salary 
from employees 
where salary =  (select max(SALARY) from employees);

--6 Find all employees whose salary is above the average salary of the entire company.
select  employee_id , first_name , last_name  ,salary  from employees   where salary > (select avg(salary) from employees);

--7 List the names and salaries of employees whose salary is less than the salary of the employee with the ID 100.
select first_name , last_name  , salary from employees    where salary < (select salary   from employees where employee_id ='100');


--8 Display the first name, last name, and job ID of employees whose job ID is the same as that of the employee with ID 200.
select first_name ,last_name  ,job_id   from employees where job_id=  (select job_id  from employees where employee_id='200');

--9 Write a query to find all employees who work in the same department as the employee with the highest salary.
select department_id   from employees     where salary = (select max(salary)  from employees);

--10 List all employees whose salary is more than any employee in department 50.
select employee_id, first_name , last_name   from employees   where     salary > any  (select salary from employees where department_id='50');

--11 Find all employees whose salary is less than the salary of all employees in department 90.
select  first_name , last_name , salary , employee_id from employees where salary <  any (select salary from employees  where department_id ='90');

--12 Display the details of employees whose job ID is among the job IDs in the &quot;Sales&quot; department.
select first_name  , last_name  
from employees  where job_id in
(select job_id  from  employees where department_id  =
(select department_id from departments  where department_name = 'SALES'));


--13 Write a query to list all employees whose salary is greater than the average salary in their own department.
select employee_id, first_name from employees  e   where salary >  (select avg(salary)   from EMPLOYEES  where department_id = e.DEPARTMENT_ID) ;


--14  Find the departments where the total salary expenditure is greater than the average total salary expenditure of all departments.
  select  department_id from EMPLOYEES e  where salary >  ( select avg(salary)    from EMPLOYEES  where  department_id = e.department_id); 
  
--15 List all employees who have been with the company for more years than the average  tenure of their respective department.
 select  first_name , last_name ,  employee_id, HIRE_DATE  from employees  e  where (sysdate - hire_date ) > (select avg(sysdate - hire_date) from EMPLOYEES  where employees.department_id = e.DEPARTMENT_ID);
 
 
 -- 16. Insert a backup of all employees from department 10 into a table called  `employee_backup`.
create table  employee_backup  as  select *from employees where 1=0;
select *from employee_backup;
insert into  employee_backup  select  *from employees where department_id='10';

--17 Update the salary of employees in department 20 by 5%, but only if their current salary is less than the average salary of department 20.
update employees  set salary =  salary * 0.5    where department_id='20' 
and  salary < (select avg(salary) from employees  where DEPARTMENT_ID='20');  

--18   Delete records from the `employee_backup` table where the employees no longer exist in the original `employees` table.
DELETE from  employee_backup   where employee_id not in   (select employee_id  from employees  );
 


--19 Insert into `employee_bonus` the employee ID and bonus amount (20% of their salary) for employees who have a salary greater than the average salary of the company.
create table  employee_bonus  as  select *from employees where 1=0;
INSERT INTO employee_bonus (employee_id, bonus_amount)
SELECT employee_id, salary * 0.20  -- 20% bonus
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);




--20 Update the job title of employees who have been with the company for more than 10 years, setting it to &#39;Senior&#39; before their current job title.
update employees  set JOB_ID = 'senior'   ||  job_id  where (sysdate - HIRE_DATE) /365 >10;