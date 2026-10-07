Use bikestores;

--Task 1:  List all products with their name, model year, and list price.

SELECT 
product_name,model_year,list_price
FROM production.products;

--Task 2:  Find all products whose list price is greater than 1000. Show product name and price.
SELECT 
product_name,
list_price
FROM production.products
WHERE list_price > 1000;

--Task 3:  List all customers from the state of New York (NY).

SELECT 
first_name,
last_name,
state
FROM sales.customers
WHERE state = 'NY';

--Task 4:  Find all orders placed in the year 2017.

SELECT * FROM sales.orders;

SELECT 
order_id, 
order_date 
FROM sales.orders 
WHERE YEAR(order_date) = 2017;

--Task 5:  List products whose name contains the word 'Trek'.

SELECT product_name
FROM production.products
WHERE product_name LIKE '%Trek%';

--Task 6:  Find all products priced between 500 and 1500.

SELECT list_price
FROM production.products 
WHERE list_price BETWEEN 500 AND 1500;

--Task 7: List all distinct cities where customers are located.
SELECT DISTINCT city
FROM sales.customers;

--Task 8:  Find all orders that have NOT been shipped yet.

SELECT order_id, order_date 
FROM sales.orders 
WHERE shipped_date IS NULL;

--Task 9:  List the top 10 most expensive products, sorted by price descending.

SELECT TOP 10 product_name, list_price 
FROM production.products
ORDER BY list_price DESC;

--Task 10:  List all customers sorted by last name (A–Z), then first name (A–Z).
SELECT first_name, last_name
FROM sales.customers
ORDER BY last_name ASC, first_name ASC;

--Task 11:  Find the 5 cheapest products that were produced in model year 2018.

SELECT Top 5 product_name, list_price, model_year
FROM production.products
WHERE model_year = 2018
ORDER BY list_price ASC ;

SELECT first_name, last_name
FROM sales.customers
WHERE customer_id IN (
    SELECT customer_id FROM sales.orders WHERE order_status = 4
);

SELECT first_name, last_name
FROM sales.customers AS c
WHERE EXISTS (
    SELECT 1
    FROM sales.orders AS o
    WHERE o.customer_id = c.customer_id
    AND o.order_status = 4
);
--%A (A pr end ho) A% (A se shro ho) %A% ( name main kahin bhi A ho ) A_i (A + exactly 1 character + i)

SELECT city, COUNT(*) AS customer_count
FROM sales.customers
GROUP BY city;

--SQL mein `SELECT` required columns ko retrieve karta hai, 
--jabke `AS` column ko temporary readable naam (alias) deta hai. 
--`DISTINCT` duplicate values/rows ko remove karta hai, 
--aur `GROUP BY` data ko groups mein divide karke `COUNT`, `SUM`, `AVG` jaisi aggregate calculations ke liye use hota hai. 
--`ORDER BY` result ko sort karta hai, default `ASC` hota hai aur `DESC` se descending order milta hai. 
--`TOP` SQL Server mein limited rows return karta hai, 
--jabke `OFFSET ... FETCH` rows ko skip karke next specific rows return karta hai aur pagination ke liye useful hai. 
--`WHERE` rows ko filter karta hai; `AND` mein dono conditions true honi chahiye, `OR` mein koi ek condition true honi chahiye, 
--aur `NOT` condition ko reverse karta hai. `BETWEEN` inclusive range filter karta hai, 
--`IN` multiple specified values mein se kisi value ko check karta hai, 
--aur `NOT IN` un values ko exclude karta hai. 
--`LIKE` text patterns search karta hai, jisme `%` zero ya multiple characters 
--aur `_` exactly one character represent karta hai. 
--`NULL` missing ya unknown value ko represent karta hai, isliye NULL check karne ke liye `IS NULL` ya `IS NOT NULL` use hota hai; 
--`= NULL` correct nahi hota.

SELECT city, COUNT(*) AS customer_count
FROM sales.customers
GROUP BY city;

-- Write a query that selects product_name, list_price, and a calculated column price_in_thousands (list_price divided by 1000) from production.products.
SELECT product_name, list_price,
list_price / 1000 AS price_in_thousand
FROM production.products;

--Write a query that returns the distinct list of state values from sales.customers.
SELECT DISTINCT state 
FROM sales.customers;

-- Write a query that returns the 5 cheapest products, showing product_name and list_price, sorted appropriately.
SELECT Top 5 product_name, list_price
FROM production.products 
ORDER BY list_price ASC;

-- Write a query that returns products priced between 200 and 600, where the category is either 1 or 6. Use BETWEEN and IN together.

SELECT list_price, category_id 
FROM production.products
WHERE category_id IN( 1 , 6)
AND list_price BETWEEN 200 AND 600;

-- The following query is meant to find affordable mountain or road bikes (categories 1 and 6) under $1000, but it has a bug. Identify it and rewrite it correctly:
SELECT product_name, category_id, list_price
FROM production.products
WHERE category_id IN( 1 , 6)  AND list_price < 1000;

--Write a query that finds all customers whose email ends in .com and whose last_name starts with the letter "M".
SELECT first_name, last_name, email
FROM sales.customers
WHERE email LIKE '%.com' AND
last_name LIKE 'M%' ;

--Write a query that returns the 11th through 20th most expensive products using OFFSET...FETCH.
SELECT product_name, list_price 
FROM production.products
ORDER BY list_price DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

--Think About It: A junior engineer writes WHERE discount <> NULL to find order items with a defined discount, and the query returns zero rows even though the table clearly has non-null discount values. Explain why, using three-valued logic, and write the correct version.
SELECT * FROM
sales.order_items 
WHERE discount IS NOT NULL;

--Question 1
SELECT product_name, category_id, list_price
FROM production.products 
WHERE category_id IN( 1 , 2 , 6 ) AND
list_price BETWEEN 300 AND 800 
ORDER BY list_price DESC;

--Question 2 
SELECT first_name, last_name, email
FROM sales.customers 
WHERE first_name LIKE 'A%' AND
last_name LIKE '%n' AND 
email LIKE '%.com' ;

--Question 3
SELECT order_id,product_id,discount
FROM sales.order_items 
WHERE discount IS NOT NULL;

--Question 4
SELECT Top 5 product_name, list_price 
FROM production.products 
ORDER BY list_price DESC;

--Question 5
SELECT product_name, category_id, list_price 
FROM production.products
WHERE category_id IN ( 1 , 6)
AND list_price > 500
ORDER BY list_price DESC
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;