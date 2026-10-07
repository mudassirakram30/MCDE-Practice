Use bikestores;

--INNER JOINS

--INNER JOIN wo JOIN hai jo do tables ki sirf matching rows return karta hai.

--Yani agar dono tables mein ON condition ke according 
--match milta hai, to row result mein aati hai. Agar 
--match nahi milta, to row return nahi hoti.

--Question 1 
SELECT 
c.first_name, 
c.last_name, 
o.order_id
FROM sales.customers AS c
INNER JOIN sales.orders AS o
ON c.customer_id = o.customer_id;

--Question 2 
SELECT * FROM sales.orders;
SELECT * FROM sales.stores;

SELECT 
o.order_id,
o.order_date,
s.store_name
FROM sales.orders AS o
INNER JOIN sales.stores AS s
ON o.store_id = s.store_id;

--Question 3 
SELECT * FROM sales.orders;
SELECT * FROM sales.staffs;

SELECT 
o.order_id, 
o.order_date,
s.first_name,
s.last_name 
FROM sales.orders AS o
INNER JOIN sales.staffs AS s
ON o.staff_id = s.staff_id;

--Question 4

SELECT * FROM production.products;
SELECT * FROM production.categories;

SELECT 
p.product_name,
p.list_price,
c.category_name
FROM production.products AS p
INNER JOIN production.categories AS c
ON p.category_id = c.category_id;

-- Question 5
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;
SELECT * FROM sales.staffs;

SELECT 
c.first_name,
c.last_name,
o.order_id,
o.order_date,
s.store_name
FROM sales.customers AS c
INNER JOIN sales.orders AS o
ON c.customer_id = o.customer_id 
INNER JOIN sales.stores AS s
ON o.store_id = s.store_id;

--Question 6 
SELECT * FROM production.products;

SELECT 
p.product_name,
b.brand_name,
p.list_price
FROM production.products AS p
INNER JOIN production.brands AS b
ON p.brand_id = b.brand_id 
WHERE p.list_price > 500;

--Question 7 
SELECT 
c.first_name,
c.last_name, 
o.order_id,
o.order_date 
FROM sales.customers AS c
INNER JOIN sales.orders AS o
ON c.customer_id = o.customer_id
WHERE YEAR(order_date) = 2017;

--Question 8 
SELECT 
p.product_name,
c.category_name,
p.list_price
FROM production.products AS p
INNER JOIN production.categories AS c
ON p.category_id = c.category_id 
WHERE c.category_name = 'Mountain Bikes'
ORDER BY p.list_price DESC;

--Question 9
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;
SELECT * FROM sales.stores;
SELECT 
c.first_name, 
c.last_name,
o.order_id,
o.order_date,
s.store_name
FROM sales.customers AS c
INNER JOIN sales.orders AS o
ON c.customer_id = o.customer_id 
INNER JOIN sales.stores AS s
ON o.store_id = s.store_id 
WHERE s.store_id = 1;

--Question 10

SELECT * FROM production.products;
SELECT * FROM production.categories;
SELECT 
p.product_name,
b.brand_name,
c.category_name,
p.list_price
FROM production.products AS p 
INNER JOIN production.brands AS b 
ON p.brand_id = b.brand_id 
INNER JOIN production.categories AS c
ON p.category_id = c.category_id 
WHERE p.list_price > 1000
AND c.category_name = 'Bikes' 
ORDER BY p.list_price DESC;