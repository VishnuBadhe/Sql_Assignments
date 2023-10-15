-- Use sub-query to solve following problems.

-- Note : To solve below queries use “sales” database

SHOW DATABASES;
USE sales_db;
SHOW TABLES;



-- 1. Write a query that uses a subquery to obtain all orders for the customer named 
--    Cisneros. Assume you do not know his customer number (cnum).

SELECT * FROM orders;
SELECT * FROM customers;

SELECT onum, odate FROM orders WHERE cnum = (SELECT cnum FROM customers WHERE cname = "Cisneros");


-- 2. Write a query that produces the names and ratings of all customers who have above average orders.

SELECT * FROM customers;
SELECT * FROM orders;

SELECT c.cname, c.rating FROM customers c 
INNER JOIN orders o ON c.cnum = o.cnum 
WHERE o.amt > (SELECT AVG(amt) FROM orders);



-- 3. Write a query that selects the total amount in orders for each salesperson for whom
--    this total is greater than the amount of the largest order in the table.

SELECT * FROM orders;

SELECT snum, SUM(amt) AS "Total Amount" FROM orders GROUP BY snum; 
SELECT snum, SUM(amt) AS "Total Amount" FROM orders GROUP BY snum HAVING "Total Amount" > (SELECT MAX(amt) FROM orders); 


-- 4. Write a query that selects all customers whose ratings are equal to or greater than ANY of Serres’.

SELECT * FROM customers;
SELECT * FROM salespeople;

SELECT cname FROM customers WHERE rating >= (SELECT MIN(rating) FROM customers WHERE snum = (SELECT snum FROM salespeople WHERE sname = "Serres"));


-- 5. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.

SELECT * FROM salespeople;
SELECT * FROM customers;

SELECT sname FROM salespeople WHERE city != ALL(SELECT city FROM customers);


-- 6. Write a query that selects all orders for amounts greater than any for the customers in London.

SELECT * FROM orders;
SELECT * FROM customers;

SELECT onum, amt FROM orders WHERE amt > ANY (SELECT amt FROM orders WHERE cnum = ANY (SELECT cnum FROM customers WHERE city = "London"));


-- 7. Extract all the orders of Motika.

SELECT * FROM orders;
SELECT * FROM salespeople;

SELECT onum FROM orders WHERE snum = (SELECT snum FROM salespeople WHERE sname = "Motika");


-- 8. Find all the order attribute to salespeople servicing customers in London.

SELECT * FROM orders;
SELECT * FROM salespeople;
SELECT * FROM customers;

SELECT * FROM orders WHERE snum IN (SELECT snum FROM customers WHERE city = "London");


-- 9. Find names and numbers of all salesperson who have more than one customer.

SELECT * FROM salespeople;
SELECT * FROM customers;

SELECT COUNT(cnum), (SELECT sname FROM salespeople WHERE snum = c.snum) AS Name FROM customers c GROUP BY Name HAVING COUNT(cnum) > 1;


-- 10. Find salespeople number, name and city who have multiple customers.

SELECT * FROM salespeople;
SELECT * FROM customers;

SELECT snum, sname, city FROM salespeople s WHERE (SELECT COUNT(cnum) FROM customers c WHERE s.snum = c.snum GROUP BY sname) > 1;


-- 11. Select customers who have a greater rating than any other customer in Rome.

SELECT * FROM customers;

SELECT cnum, cname FROM customers WHERE rating > (SELECT MIN(rating) FROM customers WHERE city = "Rome");


-- 12. Select all orders that had amounts that were greater than atleast one of the orders from ‘1990-10-04’.

SELECT * FROM orders;

SELECT onum, amt FROM orders WHERE amt > ANY (SELECT amt FROM orders WHERE odate = "1990-10-04");


-- 13. Find all orders with amounts smaller than any amount for a customer in San Jose.

SELECT * FROM orders;
SELECT * FROM customers;

SELECT onum, amt FROM orders WHERE amt < (SELECT MAX(amt) FROM orders WHERE cnum IN (SELECT cnum FROM customers WHERE city = "San Jose"));


-- 14. Select those customers whose rating are higher than every customer in Paris.

SELECT * FROM customers;

SELECT cnum, cname FROM customers WHERE rating > ANY (SELECT rating FROM customers WHERE city = "Paris");


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

