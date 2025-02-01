-- Employee Data Queries - Haris (Roll # 23P-0573)

-- Query 1: Display first_name and last_name from the employees table
SELECT first_name, last_name
FROM employees;
-- This query selects and displays the 'first_name' and 'last_name' columns for all rows in the 'employees' table.

-- Query 2: Display Hire_date from employees table, naming it as Joining Date
SELECT hire_date AS joining_date
FROM employees;
-- This query selects the 'hire_date' column and renames it to 'joining_date' in the result set.

-- Query 3: Display the first_name, last_name of Employees together in one column named "FULL NAME"
SELECT first_name || ' ' || last_name AS FULL_NAME
FROM employees;
-- This query concatenates the 'first_name' and 'last_name' columns with a space in between and displays it as a single column named 'FULL_NAME'.

-- Query 4: List all Employees having annual salary greater than 20,000 and less than 30,000
SELECT *
FROM employees
WHERE salary BETWEEN 20000 AND 30000;
-- This query selects all columns from the 'employees' table where the 'salary' falls within the range of 20,000 and 30,000 (inclusive).

-- Query 5: List employee_id and first_name of employees from department # 60 to department #100
SELECT first_name, last_name
FROM employees
WHERE DEPARTMENT_ID IN ('60', '100');
--This query retrieves the 'first_name' and 'last_name' columns for employees in department 60 or 100.

-- Query 6: List all the employees with no commission
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;
-- This query selects all columns from the 'employees' table where the 'COMMISSION_PCT' column is NULL, indicating no commission.

-- Query 7: List all employees in order of their decreasing salaries
SELECT *
FROM employees
ORDER BY salary DESC;
-- This query selects all columns from the 'employees' table and orders the results in descending order based on the 'salary' column.

-- Query 8: Print an employee's name (first letter capital) and job_id (lowercase)
SELECT UPPER(first_name), LOWER(last_name)
FROM employees;
--This query is using the functions Upper and Lower to display first name with all caps and last name with all lower case

-- Query 9: For all employees employed for more than 1000 months, display the employee number, hire date, number of months employed, first Friday after hire date and last day of the month hired
SELECT employee_id,
       hire_date,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS months_between,
       NEXT_DAY(hire_date, 'Friday')      AS nextday,
       LAST_DAY(hire_date)               AS lastday
FROM EMPLOYEES
WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 1000;
-- This query selects the 'employee_id', 'hire_date', calculates months between hire date and current date, the next Friday after their hire date, and the last day of the month for employees who have worked more than 1000 months.

-- Query 10: Comparing the hire dates for all employees who started in 2003, display the employee number, hire date, and month started using the conversion and date functions
SELECT employee_id,
       hire_date,
       TO_CHAR(hire_date, 'Month') AS month_started
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2003';
--This query retrieves the 'employee_id' and 'hire_date', it extracts the month name from the hire date for employees hired in 2003.

-- Query 11: Find the next ‘Monday’ considering today’s date as the date.
SELECT NEXT_DAY(SYSDATE, 'Monday') AS nextday
FROM dual;
-- This query calculates the next Monday based on the current system date. 'dual' is a dummy table used to execute functions that don't require data from a specific table.

-- Query 12: List all Employees who have an ‘A’ in their last names.
SELECT *
FROM employees
WHERE last_name LIKE '%A%';
-- This query selects all columns from the 'employees' table where the 'last_name' contains the letter 'A'. The wildcard '%' matches any number of characters before and after A.

-- Query 13: Show all employees’ last three letters of their first name
SELECT first_name,
       SUBSTR(first_name, LENGTH(first_name) - 2, 3) AS substr_function
FROM employees;
--This query uses the function substr and length to find the last three letters of each first name in the table.
