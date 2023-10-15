-- Note : To solve below queries use “sales” database
SHOW DATABASES;
USE sales_db;
SHOW TABLES;

-- 1. Write a query that counts the number of salespeople registering orders for each day. 
--    (If a salesperson has more than one order on a given day, he or she should be counted only once.)

SELECT * FROM orders;
SELECT odate,COUNT(DISTINCT snum) FROM orders GROUP BY odate; -- ANS
SELECT odate,SUM(COUNT(DISTINCT snum)) FROM orders GROUP BY odate; ---ERROR 1111 (HY000): Invalid use of group function


-- 2. Write a query on the Customers table that will find the highest rating in each city. Put 
--    the output in this form: For the city (city), the highest rating is : (rating).

SHOW TABLES;
SELECT * FROM customers;
SELECT city,rating FROM customers;
SELECT CONCAT("For the city ",city,", the highest rating is : ",MAX(rating)) AS HIGHEST_RATING_FOR_CITY FROM customers GROUP BY city;


-- 3 Write a query that totals the orders for each day and places the results in descending order.

SHOW TABLES;
SELECT * FROM orders;
SELECT amt FROM orders;
SELECT SUM(amt) FROM orders;
SELECT SUM(amt) FROM orders GROUP BY odate;
SELECT SUM(amt) FROM orders GROUP BY odate ORDER BY SUM(amt);
SELECT SUM(amt) FROM orders GROUP BY odate ORDER BY SUM(amt) DESC;


-- 4. Write a query that selects the total amount in orders for each salesperson for whom 
--    this total is greater than the amount of the largest order in the table.

SELECT * FROM orders;
SELECT * FROM salespeople;
SELECT snum,amt FROM orders;
SELECT snum,SUM(amt) FROM orders GROUP BY snum HAVING SUM(amt) > (SELECT MAX(amt) FROM orders);


-- 5. Write a query that selects the highest rating in each city.

SHOW TABLES;
SELECT * FROM customers;
SELECT city,rating FROM customers;
SELECT city,MAX(rating) FROM customers GROUP BY city;


-- 6. Largest order taken by each salesperson with order value more than Rs.3000.

SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM salespeople;
SELECT snum,amt FROM orders;
SELECT snum,MAX(amt) FROM orders GROUP BY snum HAVING MAX(amt) > 3000;


-- 7. Select each customer smallest order.

SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT cnum,amt FROM orders;
SELECT cnum,MIN(amt) FROM orders GROUP BY cnum;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
