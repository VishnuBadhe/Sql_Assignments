-- Create user by name sunbeam in root login

SELECT user, host FROM mysql.user;
CREATE USER 'sunbeam' IDENTIFIED BY 'sunbeam';

-- Note: To solve below queries use ‘classwork’ database.

SHOW DATABASES;
USE classwork_db;



-- 1. Give UPDATE privilages on BOOKS table to sunbeam.

SHOW GRANTS FOR sunbeam;
GRANT UPDATE ON books TO sunbeam;
SHOW GRANTS FOR sunbeam;


-- 2. Give sunbeam the right to SELECT the data from BOOKS,EMP,DEPT tables.

SHOW GRANTS FOR sunbeam;
GRANT SELECT ON books TO sunbeam;
GRANT SELECT ON emp TO sunbeam;
GRANT SELECT ON dept TO sunbeam;
SHOW GRANTS FOR sunbeam;


-- 3. Give INSERT privilage on EMP table to sunbeam

SHOW GRANTS FOR sunbeam;
GRANT INSERT ON emp TO sunbeam;
SHOW GRANTS FOR sunbeam;


-- 4. Give DELETE privileges on DEPT table to sunbeam

SHOW GRANTS FOR sunbeam;
GRANT DELETE ON dept TO sunbeam;
SHOW GRANTS FOR sunbeam;


-- 5. Take the UPDATE privilege on BOOKS table away from sunbeam.

SHOW GRANTS FOR sunbeam;
REVOKE UPDATE ON books FROM sunbeam;
SHOW GRANTS FOR sunbeam;


-- 6. Take the INSERT privilege on EMP table away from sunbeam.

SHOW GRANTS FOR sunbeam;
REVOKE INSERT ON emp FROM sunbeam;
SHOW GRANTS FOR sunbeam;


-- 7. Take the DELETE privilege on DEPT table away from sunbeam.

SHOW GRANTS FOR sunbeam;
REVOKE DELETE ON dept FROM sunbeam;
SHOW GRANTS FOR sunbeam;


-- 8. Take the SELECT privilege on BOOKS,EMP,DEPT tables away from sunbeam.

SHOW GRANTS FOR sunbeam;
REVOKE SELECT ON books FROM sunbeam;
REVOKE SELECT ON emp FROM sunbeam;
REVOKE SELECT ON dept FROM sunbeam;
SHOW GRANTS FOR sunbeam;


------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
