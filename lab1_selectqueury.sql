-- 1. Display all the information of table Jobs
SELECT * FROM jobs;

-- 2. Find min and max salary of the Job table with Job title ‘President’
SELECT max_salary FROM jobs WHERE JOB_TITLE = 'President';

-- 3. Find those employees whose Salaries are greater than 20000 from Employees table
SELECT first_name, last_name, job_id FROM employees WHERE salary > 20000;

-- 4. Find the Jobs whose salary is higher than or equal to $15000 from Employees table
SELECT job_id FROM employees WHERE salary >= 15000;

-- 5. Find the details of employees whose last name is 'Snares'
SELECT employee_id, first_name, last_name, department_id FROM employees WHERE last_name = 'Snares';

-- 6. Find the details of employees who work in the department 57
SELECT first_name, last_name, department_id, employee_id FROM employees WHERE department_id = 57;

-- 7. Find the PHONE_NUMBER of the DEPARTMENT_ID=80 and MANAGER_ID=100 of Employees table
SELECT phone_number FROM employees WHERE department_id = 80 AND manager_id = 100;

-- 8. Find the Employees with the First name “John”, “NEENA”, and “Lency”
SELECT * FROM employees WHERE first_name IN ('John', 'NEENA', 'Lency');

-- 9. Find the list of cities with country ID ‘IT’ from locations table
SELECT city FROM locations WHERE country_id = 'IT';

-- 10. Find the list of cities except country ID ‘IN’ and ‘CH’ from locations table
SELECT city FROM locations WHERE country_id NOT IN ('IN', 'CH');

-- 11. Find the list of jobs whose min salary is greater than 8000 and less than 15000 from job table
SELECT job_id FROM jobs WHERE min_salary > 8000 AND min_salary < 15000;

-- 12. Find list of phone numbers with DEPARTMENT_ID ‘90’ but not with job_id ‘IT_PROG’ from Employees table
SELECT phone_number FROM employees WHERE department_id = 90 AND job_id != 'IT_PROG';

-- 13. Find the list of employees who are hired after '12-Dec-07' from employee table
SELECT * FROM employees WHERE hire_date > '12-DEC-07';

-- 14. Find the list of employees who are hired after '12-Dec-07' in Department with DEPARTMENT_ID=100
SELECT * FROM employees WHERE hire_date > '12-DEC-07' AND department_id = 100;

-- 15. Find the list of employees who are hired after '12-Dec-07' but not in Department with DEPARTMENT_ID=100
SELECT * FROM employees WHERE hire_date > '12-DEC-07' AND department_id != 100;

-- 16. Find the list of employees whose COMMISSION_PCT=0 and they do not belong to DEPARTMENT_ID 90 or 100
SELECT * FROM employees WHERE commission_pct = 0 AND department_id NOT IN (90, 100);

-- 17. Find the employees who are hired in the year 2010
SELECT * FROM employees WHERE hire_date BETWEEN '01-JAN-10' AND '31-DEC-2010';

-- 18. Find the list of jobs whose min salary is greater than 8000 and less than 15000 from job table
SELECT job_title FROM jobs WHERE min_salary > 8000 AND min_salary < 15000;

-- 19. Find employee whose ID are greater than 100 and less than 150 and their department_id is greater than 90 and less than 100 along with their F_name, Last_name & Job ID
SELECT first_name, last_name, job_id FROM employees WHERE employee_id > 100 AND employee_id < 150 AND department_id > 90 AND department_id < 100;

-- 20. Find total salary along with salary & commission_pct. Total salary formula = salary + (commission_pct * salary)
SELECT salary, commission_pct, salary + (salary * commission_pct) AS total_salary FROM employees;
