-- Note : To solve below queries use “sales” database
SHOW DATABASES;
USE sales_db;

-- 1. Write a query that lists each order number followed by the name of the customer who 
--    made the order.

SELECT * FROM orders;
SELECT * FROM customers;

SELECT o.onum, c.cname FROM customers c 
INNER JOIN orders o ON 
o.cnum=c.cnum;


-- 2. Write a query that gives the names of both the salesperson and the customer for 
--    each order along with the order number.

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM salespeople;
 
SELECT c.cname, s.sname, o.onum FROM customers c 
INNER JOIN orders o ON c.snum=o.snum 
INNER JOIN salespeople s ON s.snum=o.snum;



-- 3. Write a query that produces all customers serviced by salespeople with a commission 
--    above 12%. Output the customer’s name, the salesperson’s name, and the 
--    salesperson’s rate of commission.

SELECT * FROM customers;
SELECT * FROM salespeople;

SELECT c.cname, s.sname, CONCAT(ROUND(s.comm*100), "%") AS comm FROM customers c 
INNER JOIN salespeople s ON c.snum=s.snum 
WHERE s.comm > 0.12;



-- 4. Write a query that calculates the amount of the salesperson’s commission on each 
--    order by a customer with a rating above 100.

SELECT * FROM salespeople;
SELECT * FROM orders;
SELECT * FROM customers;

SELECT o.onum, o.snum, ROUND(o.amt*s.comm, 2) AS COMMISSION FROM orders o 
INNER JOIN salespeople s ON o.snum=s.snum 
INNER JOIN customers c ON o.snum=c.snum WHERE c.rating > 100;



-- 5. Write a query that produces all pairs of salespeople who are living in the same 
--    city. Exclude combinations of salespeople with themselves as well as duplicate rows 
--    with the order reversed.

SELECT * FROM salespeople;
SELECT * FROM salespeople;

SELECT s1.sname, s2.sname FROM salespeople s1 
INNER JOIN salespeople s2 ON s1.city = s2.city WHERE s1.sname != s2.sname;


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

-- Note : To solve below queries use “spj” database

SHOW DATABASES;
USE spj;


-- 1. Display the Supplier name and the Quantity sold.

SELECT * FROM j;
SELECT * FROM p;
SELECT * FROM s;
SELECT * FROM sp;

SELECT s.sname, sp.qty FROM s INNER JOIN sp ON s.`s#`= sp.`s#`;


-- 2. Display the Part name and Quantity sold.

SELECT * FROM j;
SELECT * FROM p;
SELECT * FROM s;
SELECT * FROM sp;

SELECT p.pname, sp.qty FROM p INNER JOIN sp ON p.`p#` = sp.`p#`;


-- 3. Display the Job name and Quantity sold.

SELECT * FROM j;
SELECT * FROM p;
SELECT * FROM s;
SELECT * FROM sp;

SELECT j.jname, sp.qty FROM j INNER JOIN sp ON j.`j#` = sp.`j#`;


-- 4. Display the Supplier name, Part name, Job name and Quantity sold.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT s.sname, p.pname, j.jname, sp.qty FROM sp 
INNER JOIN s ON sp.`s#` = s.`s#` 
INNER JOIN p ON sp.`p#` = p.`p#` 
INNER JOIN j ON sp.`j#` = j.`j#`;


-- 5. Display the Supplier name, Supplying Parts to a Job in the same City.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT s.sname FROM s 
INNER JOIN sp ON s.`s#` = sp.`s#` 
INNER JOIN p ON p.`p#` = sp.`p#` 
INNER JOIN j ON j.`j#` = sp.`j#` 
WHERE s.city = p.city AND p.city = j.city;


-- 6. Display the Part name that is ‘Red’ is color, and the Quantity sold.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT p.pname, sp.qty FROM p 
INNER JOIN sp ON p.`p#` = sp.`p#` WHERE 
p.color = 'RED';


-- 7. Display all the Quantity sold by Suppliers with the Status = 20.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT s.sname, sp.qty FROM s 
INNER JOIN sp ON s.`s#` = sp.`s#` 
WHERE s.status = 20;


-- 8. Display all the Parts and Quantity with a Weight > 14.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT p.`p#`, p.pname, sp.qty FROM p INNER JOIN sp ON p.`p#` = sp.`p#` WHERE p.weight > 14;



-- 9. Display all the Job names and City, which has bought more than 500 Parts.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT j.jname, j.city FROM j INNER JOIN sp ON j.`j#` = sp.`j#` WHERE sp.qty > 500;



-- 10. Display all the Part names and Quantity sold that have a Weight less than 15.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT p.`p#`, p.pname, sp.qty FROM p INNER JOIN sp ON p.`p#` = sp.`p#` WHERE p.weight < 15;


-- 11. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.


SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT s.`s#`, sname FROM s WHERE status = (SELECT status FROM s WHERE sname='CLARK');


-- 12. Display all the Parts which have more Weight than any Red parts.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT p.`p#`, p.pname FROM p WHERE weight > (SELECT MIN(weight) FROM p WHERE color = 'Red');


-- 13. Display all the Jobs going on in the same city as the job ‘TAPE’.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT j.`j#`, j.jname FROM j WHERE city = (SELECT city FROM j WHERE jname = 'TAPE');


-- 14. Display all the Parts with Weight less than any the Green parts.

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT p.`p#`, p.pname FROM p WHERE weight < (SELECT MAX(weight) FROM p WHERE color = 'Green');


-- 15. Display the name of the Supplier who has sold the maximum Quantity (in onesale).

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT s.sname FROM s INNER JOIN sp ON s.`s#` = sp.`s#` WHERE sp.qty = (SELECT MAX(qty) FROM sp);


-- 16. Display the name of the Supplier who has sold the maximum overall Quantity (sum of Sales).

SELECT * FROM s;
SELECT * FROM p;
SELECT * FROM j;
SELECT * FROM sp;

SELECT s.sname, SUM(qty) FROM s INNER JOIN sp ON s.`s#` = sp.`s#` GROUP BY s.sname;
SELECT s.sname, SUM(qty) FROM s INNER JOIN sp ON s.`s#` = sp.`s#` GROUP BY s.sname ORDER BY SUM(qty);
SELECT s.sname, SUM(qty) FROM s INNER JOIN sp ON s.`s#` = sp.`s#` GROUP BY s.sname ORDER BY SUM(qty) DESC;
SELECT s.sname, SUM(qty) FROM s INNER JOIN sp ON s.`s#` = sp.`s#` GROUP BY s.sname ORDER BY SUM(qty) DESC LIMIT 1;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------



