-- Use ALTER statement to solve following problems.

SHOW DATABASES;
USE classwork_db;
SHOW TABLES;


-- 1. Write a SQL statement to add a column region to the table DEPT.

DESC dept;
SELECT * FROM dept;

ALTER TABLE dept ADD COLUMN region VARCHAR(50);

SELECT * FROM dept;
DESC dept;

-- 2. Write a SQL statement to add a dummy_ID as the first column of the table DUMMY.

DESC dummy;
SELECT * FROM dummy;

ALTER TABLE dummy ADD COLUMN dummy_ID INT FIRST;

SELECT * FROM dummy;
DESC dummy;

-- 3. Write a SQL statement to add a column position after grade to the table SALGRADE.

DESC salgrade;
SELECT * FROM salgrade;

ALTER TABLE salgrade ADD COLUMN position INT AFTER grade;

SELECT * FROM salgrade;
DESC salgrade;

-- 4. Write a SQL statement to change the data type of the column sal to float in the table EMP.

DESC emp;
SELECT * FROM emp;

ALTER TABLE emp MODIFY sal FLOAT;

SELECT * FROM emp;
DESC emp;

-- 5. Write a SQL statement to drop the column region from the table DEPT.

DESC dept;
SELECT * FROM dept;

ALTER TABLE dept DROP COLUMN region;

SELECT * FROM dept;
DESC dept;

-- 6. Write a SQL statement to change the name of the column job to designation from 
--    EMP table, keeping the data type and size same.

DESC emp;
SELECT * FROM emp;

ALTER TABLE emp CHANGE COLUMN job designation VARCHAR(40);

SELECT * FROM emp;
DESC emp;

--------------------------------------------------------------------------------------------------------------------------------------


-- Implement following constraints as given in question.

-- Note: use “sales” database to solve below queries.

SHOW DATABASES;
USE sales_db;
SHOW TABLES;

-- 1. Write a SQL statement to add a primary key for the columns SNUM in the SALESPEOPLE table.

DESC salespeople;
ALTER TABLE salespeople ADD CONSTRAINT PRIMARY KEY (snum);
DESC salespeople;


-- 2. Write a SQL statement to add a primary key for the columns CNUM in the CUSTOMERS table.

DESC customers;
ALTER TABLE customers ADD CONSTRAINT PRIMARY KEY (cnum);
DESC customers;


-- 3. Write a SQL statement to add a foreign key on SNUM column of CUSTOMERS
--    table referencing to the primary key SNUM of SALESPEOPLE table.

DESC customers;
DESC salespeople;

ALTER TABLE customers ADD CONSTRAINT FOREIGN KEY (snum) REFERENCES salespeople(snum);

DESC customers;
DESC salespeople;


-- 4. Create DEPT table with deptno as Primary Key.

SHOW TABLES;
CREATE TABLE dept (deptno INT PRIMARY KEY);
DESC dept;
SHOW TABLES;


-- 5. Create EMP table with empno as Primary Key. Ensure that mgr is foreign key for EMP(empno) and deptno as 
--    foreign key for DEPT table primary key. If dept is deleted, all its employees should be auto deleted. 
--    If deptno of any dept is modified, corresponding rows of EMP should be auto modified.

SHOW TABLES;
CREATE TABLE emp(empno INT PRIMARY KEY, mgr INT, FOREIGN KEY (mgr) REFERENCES emp(empno), deptno INT, FOREIGN KEY (deptno) REFERENCES dept(deptno) ON DELETE CASCADE ON UPDATE CASCADE);
DESC emp;
SHOW TABLES;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


