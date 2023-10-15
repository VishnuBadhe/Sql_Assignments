-- 1. Write a query to get unique department ID from employee table.

SHOW DATABASES;
USE hr_db;
SHOW TABLES;
SELECT * FROM employees;
SELECT DISTINCT `DEPARTMENT_ID` FROM employees;




-- 2. Write a query to get all employee details from the employee table order by first name, 
--    descending.

SELECT * FROM employees;
SELECT * FROM employees ORDER BY `FIRST_NAME` DESC;




-- 3. Write a query to get the employee ID, names (first_name, last_name), salary in 
--    ascending order of salary.

SELECT * FROM employees;
SELECT `EMPLOYEE_ID`, CONCAT_WS(" ", `FIRST_NAME`, `LAST_NAME`) NAME, SALARY FROM employees ORDER BY salary;





-- 4. Display first name and join date of the employees who is either IT Programmer or 
--    Sales Man.

SELECT * FROM employees;
SELECT `FIRST_NAME`, `HIRE_DATE` FROM employees WHERE `JOB_ID` = "IT_PROG" OR `JOB_ID` = "SA_MAN";





-- 5. Display details of employee with ID 150 or 160.

SELECT * FROM employees;
SELECT * FROM employees WHERE `EMPLOYEE_ID` = 150 OR `EMPLOYEE_ID` = 160;




-- 6. Display first name, salary, commission pct, and hire date for employees with salary 
--    less than 10000.

SELECT * FROM employees;
SELECT FIRST_NAME,SALARY,COMMISSION_PCT,HIRE_DATE FROM employees WHERE SALARY < 10000;




-- 7. Display employees where the first name or last name starts with S.

SELECT * FROM employees;
SELECT * FROM employees WHERE FIRST_NAME LIKE "S%" OR LAST_NAME LIKE "S%"; 



-- 8. Display details of jobs in the descending order of the title.

SHOW TABLES;
SELECT * FROM jobs;
SELECT * FROM jobs ORDER BY JOB_TITLE DESC;




-- 9. Display details of the employees where commission percentage is null and salary in 
--    the range 5000 to 10000 and department is 30.

SELECT * FROM employees;
SELECT * FROM employees WHERE COMMISSION_PCT IS NULL AND SALARY BETWEEN 5000 AND 10000 AND DEPARTMENT_ID = 30; 




-- 10. Display employees first_name,email who are working in “Executive” department.

SELECT * FROM employees;
SELECT FIRST_NAME, EMAIL, CASE
WHEN DEPARTMENT_ID = 90 THEN "EXECUTIVE"
END AS EXECUTIVE 
FROM employees WHERE DEPARTMENT_ID = 90;




-- 11. Display unique contry_id from locations table.

SHOW TABLES;
SELECT * FROM locations;
SELECT DISTINCT COUNTRY_ID FROM locations;




-- 12. Display all employees whose have job_id IT_PROG and FI_ACCOUNT.

SELECT * FROM employees;
SELECT * FROM employees WHERE JOB_ID = "IT_PROG" OR JOB_ID = "FI_ACCOUNT";




-- 13. Display all countries in ascending order.

SHOW TABLES;
SELECT * FROM countries;
SELECT * FROM countries ORDER BY COUNTRY_NAME;


---------------------------------------------------------------------------------------------------------------