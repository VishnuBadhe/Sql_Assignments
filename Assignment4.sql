-- Note : To solve below queries use “hr” database
USE hr_db;


-- 1. Display first name and last name after converting the first letter of each name to 
--    upper case and the rest to lower case.

SHOW DATABASES;
USE hr_db;
SHOW TABLES;
SELECT * FROM employees;
SELECT FIRST_NAME, LAST_NAME FROM employees;
SELECT LEFT(FIRST_NAME,1),LEFT(LAST_NAME,1) FROM employees;
SELECT SUBSTRING(FIRST_NAME,2),SUBSTRING(LAST_NAME,2) FROM employees;
SELECT UPPER(LEFT(FIRST_NAME,1)), UPPER(LEFT(LAST_NAME,1)) FROM employees;
SELECT LOWER(SUBSTRING(FIRST_NAME,2)), LOWER(SUBSTRING(LAST_NAME,2)) FROM employees;
SELECT CONCAT(UPPER(LEFT(FIRST_NAME,1)),LOWER(SUBSTRING(FIRST_NAME,2))),  CONCAT(UPPER(LEFT(LAST_NAME,1)),LOWER(SUBSTRING(LAST_NAME,2))) FROM employees;
SELECT CONCAT(CONCAT(UPPER(LEFT(FIRST_NAME,1)),LOWER(SUBSTRING(FIRST_NAME,2))),' ',CONCAT(UPPER(LEFT(LAST_NAME,1)),LOWER(SUBSTRING(LAST_NAME,2)))) AS Name FROM employees;



-- 2. Display the first word in job title.

SELECT * FROM jobs;
HELP String Functions
SELECT SUBSTRING_INDEX(JOB_TITLE,' ',1) FROM jobs;


-- 3. Display the length of first name for employees where last name contain character ‘b’ 
--    after 3rd position.

SELECT * FROM employees;
HELP String Functions
HELP LENGTH
SELECT FIRST_NAME FROM employees;
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM employees;
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM employees WHERE SUBSTRING(LAST_NAME, 4) LIKE '%b%';


-- 4. Display first name in upper case and email address in lower case for employees 
--    where the first name and email address are same irrespective of the case.

SELECT FIRST_NAME,EMAIL FROM employees;
SELECT UPPER(FIRST_NAME),LOWER(EMAIL) FROM employees;
SELECT UPPER(FIRST_NAME),LOWER(EMAIL) FROM employees WHERE FIRST_NAME=EMAIL;



-- 5. Display first name, salary, and round the salary to thousands.

SELECT * FROM employees;
SELECT FIRST_NAME,SALARY FROM employees;
SELECT FIRST_NAME,ROUND(SALARY) FROM employees;
SELECT FIRST_NAME,ROUND(SALARY,-3) FROM employees;



-- 6. Display employee ID and the date on which he ended his previous job.

SELECT * FROM job_history;
SELECT EMPLOYEE_ID,END_DATE FROM job_history;



-- 7. Display first name and date of first salary of the employees.
--    (Consider 1st day of month as salary day) HINT: LAST_DAY.

SELECT * FROM employees;
SELECT FIRST_NAME,HIRE_DATE FROM employees;
HELP LAST_DAY
SELECT FIRST_NAME,LAST_DAY(HIRE_DATE) FROM employees;
/h ADDDATE
SELECT FIRST_NAME,ADDDATE(LAST_DAY(HIRE_DATE),1) AS FIRST_SALARY FROM employees;
-- OR SELECT FIRST_NAME,DATE_ADD(LAST_DAY(HIRE_DATE), INTERVAL 1 DAY) FIRST_SALARY FROM employees;



-- 8. Display first name and experience of the employees.

SELECT * FROM employees;
SELECT FIRST_NAME,HIRE_DATE FROM employees;
HELP TIMESTAMP
HELP TIMESTAMPDIFF
SELECT FIRST_NAME,TIMESTAMPDIFF(YEAR, HIRE_DATE, now()) AS YEAR_EXPR FROM employees;
SELECT FIRST_NAME,TIMESTAMPDIFF(YEAR, HIRE_DATE, now()) AS YEAR_EXPR, TIMESTAMPDIFF(MONTH, HIRE_DATE, now())%12 AS MONTH_EXPR FROM employees;SELECT FIRST_NAME,TIMESTAMPDIFF(YEAR, HIRE_DATE, now()) AS YEAR_EXPR, TIMESTAMPDIFF(MONTH, HIRE_DATE, now()) AS MONTH_EXPR FROM employees;


-- 9. Display first name of employees who joined in 2001.

SELECT * FROM employees;
SELECT FIRST_NAME FROM employees;
SELECT FIRST_NAME FROM employees WHERE YEAR(HIRE_DATE)=2001;



-- 10. Display employees who joined in the current year.

SELECT * FROM employees;
SELECT * FROM employees WHERE YEAR(HIRE_DATE)=YEAR(now());



-- 11. Display the number of days between system date and 1st January 2011.

SELECT * FROM employees;
HELP TIMESTMAP
HELP TIMESTAMPDIFF
SELECT TIMESTAMPDIFF(DAY, "2011-01-01", SYSDATE());


-- 12. Display number of employees joined after 15th of the month.

SELECT * FROM employees;
SELECT FIRST_NAME,HIRE_DATE FROM employees;
SELECT FIRST_NAME,HIRE_DATE FROM employees WHERE DAY(HIRE_DATE) > 15;
SELECT EMPLOYEE_ID FROM employees WHERE DAY(HIRE_DATE) > 15;
SELECT COUNT(EMPLOYEE_ID) FROM employees WHERE DAY(HIRE_DATE) > 15;


-- 13. Display third highest salary of employees.

SELECT * FROM employees;
SELECT FIRST_NAME,LAST_NAME,SALARY FROM employees;
SELECT DISTINCT SALARY FROM employees;
SELECT DISTINCT SALARY FROM employees ORDER BY SALARY;
SELECT DISTINCT SALARY FROM employees ORDER BY SALARY DESC;
SELECT DISTINCT SALARY FROM employees ORDER BY SALARY DESC LIMIT 2,1;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------


