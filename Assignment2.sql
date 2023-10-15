-- 1. Write a query that produces all rows from the Customers table for which the 
--    salesperson’s number is 1001.

SELECT * FROM customers;
SELECT * FROM Customers WHERE snum=1001;




-- 2. Write a select command that produces the rating followed by the name of each 
--    customer in San Jose.

SELECT * FROM customers;
SELECT cname,rating FROM customers WHERE city="san Jose";




-- 3. Write a query that will produce the snum values of all salespeople from the Orders 
--    table (with the duplicate values suppressed).

SELECT * FROM orders;
SELECT DISTINCT snum FROM orders;




-- 4. Write a query that will give you all orders for more than Rs. 1,000.

SELECT * FROM orders;
SELECT * FROM orders WHERE amt > 1000;




-- 5. Write a query that will give you the names and cities of all salespeople in London with 
--    a commission above 0.10.

SELECT * FROM salespeople;
SELECT sname FROM salespeople where comm > 0.10;




-- 6. Write a query on the Customers table whose output will exclude all customers with a 
-- rating <= 100, unless they are located in Rome.

SELECT * FROM customers;
SELECT * FROM customers WHERE NOT rating <= 100  OR city = "Rome";




-- 7. What will be the output from the following query?
-- Select * from Orders
-- where (amt < 1000 OR
-- NOT (odate = "1990-10-03"
-- AND cnum > 2003)) 

Select * from Orders
where (amt < 1000 OR
NOT (odate = "1990-10-03"
AND cnum > 2003));

-- Output:

+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)





-- 8. What will be the output of the following query?
-- Select * from Orders
-- where NOT ((odate = "1990-10-03" OR snum >1006) AND amt >= 1500);

Select * from Orders
where NOT ((odate = "1990-10-03" OR snum >1006) AND amt >= 1500);

-- Output:

+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)





-- 9. What is a simpler way to write this query?
-- Select snum, sname, city, comm from Salespeople
-- Where (comm >= .12 or comm <= .14);

Select snum, sname, city, comm from Salespeople
Where (comm >= .12 or comm <= .14);

-- Output:

+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
5 rows in set (0.00 sec)





-- 10. Write a query that selects all of the customers serviced by Peel or Motika. 
--     (Hint: the snum field relates the two tables to one another).

SELECT * FROM orders;
SELECT * FROM customers;

SELECT *,CASE
WHEN snum = 1001 THEN "peel"
WHEN snum = 1004 THEN "Motika"
END AS `serviceby`
FROM customers WHERE snum = 1001 OR snum = 1004;





-- 11. Write a query that selects all orders except those with zeroes or NULLs in the amt 
--     field.


SELECT * FROM orders;
SELECT * FROM orders WHERE amt IS NOT NULL OR amt != 0;


----------------------------------------------------------------------------------------------------




