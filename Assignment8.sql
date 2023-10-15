-- Note : To solve below queries use “hr” database

SHOW DATABASES;
USE hr_db;
SHOW TABLES;


-- 1. Display department name and manager first name.

SELECT * FROM departments;
SELECT * FROM employees;

SELECT d.DEPARTMENT_NAME, e.FIRST_NAME FROM departments d INNER JOIN employees e ON d.MANAGER_ID = e.EMPLOYEE_ID;


-- 2. Display department name, manager name, and city.

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM locations;

SELECT d.DEPARTMENT_NAME, CONCAT_WS(" ", e.FIRST_NAME, e.LAST_NAME) AS Name, l.city FROM departments d 
LEFT JOIN employees e ON d.MANAGER_ID = e.EMPLOYEE_ID 
INNER JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID; 


-- 3. Display country name, city, and department name.

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM locations;

SELECT c.COUNTRY_NAME, l.CITY, d.DEPARTMENT_NAME FROM countries c 
INNER JOIN locations l ON c.COUNTRY_ID = l.COUNTRY_ID 
INNER JOIN departments d ON d.LOCATION_ID = l.LOCATION_ID;


-- 4. Display job title, department name, employee last name, starting date for all jobs from 
--    1993 to 1998.

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;
SELECT * FROM job_history;


SELECT e.LAST_NAME, j.JOB_TITLE, d.DEPARTMENT_NAME, jh.START_DATE FROM job_history jh 
RIGHT JOIN employees e ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID;


SELECT e.LAST_NAME, j.JOB_TITLE, d.DEPARTMENT_NAME, jh.START_DATE FROM job_history jh 
RIGHT JOIN employees e ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID
WHERE YEAR(jh.START_DATE) BETWEEN 1993 AND 1998;


-- 5. Display job title and average salary of employees.

SELECT * FROM jobs;
SELECT * FROM employees;

SELECT j.JOB_TITLE, AVG(salary) FROM jobs j 
INNER JOIN employees e ON j.JOB_ID = e.JOB_ID GROUP BY j.JOB_TITLE;


-- 6. Display job title, employee name, and the difference between maximum salary for the 
--    job and salary of the employee.

SELECT * FROM jobs;
SELECT * FROM employees;

SELECT j.JOB_TITLE, CONCAT_WS(" ", FIRST_NAME, LAST_NAME) AS Name, (j.MAX_SALARY - e.SALARY) AS "Salary Difference" FROM employees e 
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID; 



-- 7. Display last name, job title of employees who have commission percentage and 
--    belongs to department 30.

SELECT * FROM jobs;
SELECT * FROM employees;

SELECT e.LAST_NAME, j.JOB_TITLE FROM employees e 
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID 
WHERE e.COMMISSION_PCT IS NOT NULL AND e.DEPARTMENT_ID = 30;


-- 8. Display details of jobs that were done by any employee who is currently drawing 
--    more than 15000 of salary.

SELECT * FROM jobs;
SELECT * FROM employees;

SELECT e.EMPLOYEE_ID, e.FIRST_NAME, j.* FROM employees e 
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID 
WHERE SALARY > 15000;


-- 9. Display department name, manager name, and salary of the manager for all 
--    managers whose experience is more than 5 years.

SELECT * FROM departments;
SELECT * FROM employees;

SELECT d.DEPARTMENT_NAME, CONCAT_WS(" ", FIRST_NAME, LAST_NAME) AS Name, e.SALARY FROM departments d 
INNER JOIN employees e ON d.MANAGER_ID = e.MANAGER_ID 
WHERE TIMESTAMPDIFF(YEAR, e.HIRE_DATE, DATE(NOW())) > 5;



-- 10. Display employee name if the employee joined before his manager.

SELECT * FROM employees;

SELECT CONCAT_WS(" ", e1.FIRST_NAME, e1.LAST_NAME) AS "Employee Name" FROM employees e1 
INNER JOIN employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID 
WHERE e2.HIRE_DATE > e1.HIRE_DATE;


-- 11. Display employee name, job title for the jobs employee did in the past where the job 
--     was done less than six months.

SELECT * FROM employees;
SELECT * FROM jobs;

SELECT CONCAT_WS(" ", e.FIRST_NAME, e.LAST_NAME) AS "Employee Name", j.JOB_TITLE FROM employees e 
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID 
INNER JOIN job_history jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
WHERE TIMESTAMPDIFF(MONTH, jh.START_DATE, jh.END_DATE) < 6;   -- DOUBT less than or greater than 6 months


-- 12. Display employee name and country in which he is working.

SELECT * FROM employees;
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT CONCAT_WS(" ", e.FIRST_NAME, e.LAST_NAME) AS "Employee Name", c.COUNTRY_NAME FROM employees e 
INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
INNER JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID 
LEFT JOIN countries c ON c.COUNTRY_ID = l.COUNTRY_ID;



-- 13. Display department name, average salary and number of employees with 
--     commission within the department.

SELECT * FROM employees;
SELECT * FROM departments;

SELECT d.DEPARTMENT_NAME, AVG(e.SALARY), COUNT(e.EMPLOYEE_ID) FROM employees e 
INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE e.COMMISSION_PCT > 0.00 
GROUP BY d.DEPARTMENT_NAME;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
