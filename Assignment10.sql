-- Create appropriate indexes to solve following problems.

-- Note : use “sales” database to solve below queries.
SHOW DATABASES;
USE sales_db;
SHOW TABLES;


-- 1. Create an index that will enable a user to pull orders for ‘1990-10-03’ out of the Orders table quickly.

SELECT * FROM orders;

CREATE INDEX idx_orders_odate ON orders(odate);
SHOW INDEXES FROM orders;


-- 2. If the Orders table has already been created, how can you force the onum field to be 
--    unique (assume all current values are unique)?

SELECT * FROM orders;

CREATE UNIQUE INDEX idx_unique ON orders(onum);
SHOW INDEXES FROM orders;


-- 3. Create an index that would permit salesperson to retrieve his orders.

SELECT * FROM orders;

CREATE INDEX idx_orders_snum ON orders(snum);
SHOW INDEXES FROM orders;


-- 4. Let us assume that each salesperson is to have only one customer of a given rating, 
--    and that this is currently the case. Create an index that enforces it.

SELECT * FROM customers;
SELECT * FROM orders;

CREATE UNIQUE INDEX idx_orders_current ON customers(cnum, snum, rating);
SHOW INDEXES FROM customers;


-- 5. Create an index to speed up searching order on a given date by given customer.

SELECT * FROM orders;
SELECT * FROM customers;

CREATE INDEX idx_orders_sp ON orders(onum, odate);
SHOW INDEXES FROM orders;


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
