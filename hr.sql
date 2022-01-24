#Exercise on hr dataset
show databases;


create database hr;
use hr;

#Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
select * from employees;
select FIRST_NAME as First , LAST_NAME as Last from employees;

#Write a query to get unique department ID from employee table.
Select distinct(department_id) from employees;

# Write a query to get all employee details from the employee table order by first name, descending
select * from employees order by first_name desc;

#Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
select first_name,last_name,salary,salary *.15 as pf from employees;

#Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary
select employee_id,first_name,last_name,salary from employees order by salary;

#Write a query to get the total salaries payable to employees
select sum(salary) from employees;

#Write a query to get the maximum and minimum salary from employees table
select max(salary),min(salary) from employees;

#Write a query to get the average salary and number of employees in the employees table.
select avg(salary),count(*) from employees;

#Write a query to get the number of employees working with the company
select count(*) from employees;

#Write a query to get the number of jobs available in the employees table.
SELECT COUNT(distinct job_id) 
    FROM employees;
    
#Write a query get all first name from employees table in upper case.
select upper(first_name) from employees; 

# Write a query to get the first 3 characters of first name from employees table
SELECT SUBSTRING(first_name,1,3) 
     FROM employees;

#Write a query to calculate 171*214+625
select 171*214+625 result;

#Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table
select concat(first_name,' ', last_name) from employees;

#Write a query to get the length of the employee names (first_name, last_name) from employees table.
select trim(first_name) from employees;

#Write a query to check if the first_name fields of the employees table contains numbers
SELECT * FROM employees WHERE  first_name REGEXP  '[0-9]';
   
#Write a query to select first 10 records from a table
select * from employees limit 10;

#Write a query to get monthly salary (round 2 decimal places) of each and every employee.
SELECT first_name, last_name, round(salary/12,2) as 'Monthly Salary' 
   FROM employees;
   
#Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
select first_name,last_name,salary from employees where salary not between 10000 and 15000;

# Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order. 
select first_name,last_name,department_id from employees where department_id in(30,100) order by department_id asc;

# Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987
select first_name , last_name, hire_date from employees where hire_date like '1987%';

#Write a query to display the first_name of all employees who have both "b" and "c" in their first name
SELECT first_name FROM employees WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';

#Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, 
#and whose salary is not equal to $4,500, $10,000, or $15,000.
select distinct(job_id) from employees;
select last_name,job_id,salary from employees  where job_id in('IT_PROG','SH_CELRK') and salary not in(4500,10000, 15000);

#Write a query to display the last name of employees whose names have exactly 6 characters.
select last_name from employees where last_name like '______';

#Write a query to display the last name of employees having 'e' as the third character
select last_name from employees where last_name like '__e%';

#Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'
select * from employees where last_name in ('BLAKE','SCOTT','KING','FORD');

#Write a query to get the maximum salary of an employee working as a Programmer.
select max(salary) from employees where job_id='IT_PROG';

#Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(salary),count(*) 
FROM employees 
WHERE department_id = 90;

#Write a query to get the number of employees with the same job.
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

#Write a query to get the difference between the highest and lowest salaries.
select max(salary)-min(salary) difference from employees;

#Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY MIN(salary) DESC;

#Write a query to get the average salary for each job ID excluding programmer.
SELECT job_id, AVG(salary) 
FROM employees 
WHERE job_id <> 'IT_PROG' 
GROUP BY job_id;

#Write a query to find the name (first_name, last_name) and the salary of the employees who 
#have a higher salary than the employee whose last_name='Bull'.
select first_name,last_name,salary from employees where salary > (select salary from employees where last_name='Bull');

#Write a query to find the name (first_name, last_name) of all employees who works in the IT department
select * from departments;
SELECT first_name, last_name 
FROM employees 
WHERE department_id 
IN (SELECT department_id FROM departments WHERE department_name='IT');

#Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
select first_name,last_name from employees where manager_id in(select employee_id from employees 
where department_id in (select department_id from departments where location_id in (select location_id from locations where country_id='US')));

#Write a query to find the name (first_name, last_name) of the employees who are managers. 
SELECT first_name, last_name 
FROM employees 
WHERE (employee_id IN (SELECT manager_id FROM employees));

#Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select first_name,last_name,salary from employees where salary > (select avg(salary) from employees);

#Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade
select first_name,last_name,salary from employees where employees.salary = (select min_salary from jobs 
where employees.job_id=jobs.job_id);

#Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and 
#works in any of the IT departments.
select first_name,last_name,salary from employees where department_id in (select department_id from departments where department_name 
like 'IT%') and salary > (select avg(salary) from employees);

#Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
select first_name,last_name from employees where salary > (select salary from employees where last_name='BELL') order by first_name;

#Write a query to get 3 minimum salaries.
SELECT DISTINCT salary 
FROM employees a 
WHERE  3 >= (SELECT COUNT(DISTINCT salary) 
FROM employees b 
WHERE b.salary <= a.salary) 
ORDER BY a.salary DESC;

#Write a query to list the department ID and name of all the departments where no employee is working.
select * from departments where department_id not in (select department_id from employees);

#Write a query to select last 10 records from a table.
SELECT * FROM (
SELECT * FROM employees ORDER BY employee_id DESC LIMIT 10) sub 
ORDER BY employee_id ASC;

select* from employees limit 10;

#Write a query to find the 4th minimum salary in the employees table.
SELECT DISTINCT salary 
FROM employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT salary) 
FROM employees  e2 
WHERE e2.salary <= e1.salary);

# Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

#Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT first_name, last_name, department_id, department_name 
FROM employees 
JOIN departments USING (department_id);

#Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

#Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT e.employee_id 'Emp_Id', e.last_name 'Employee', 
m.employee_id 'Mgr_Id', m.last_name 'Manager' 
FROM employees e 
join employees m 
ON (e.manager_id = m.employee_id);



















