Use bikestores;

--FULL OUTER JOINs
--FULL OUTER JOIN wo JOIN hai jo dono tables ki tamam rows return karta hai.

--Jahan matching rows milti hain → unko combine karta hai.
--Jahan LEFT table ki row ka match nahi hota → RIGHT table ke columns NULL.
--Jahan RIGHT table ki row ka match nahi hota → LEFT table ke columns NULL.
--Question 1 
SELECT 
c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date
FROM sales.customers AS c 
FULL OUTER JOIN sales.orders AS o
ON c.customer_id = o.customer_id;

--Question 2

SELECT 
p.product_id,
p.product_name,
oi.order_id,
oi.quantity
FROM production.products AS p
FULL OUTER JOIN sales.order_items AS oi
ON p.product_id = oi.product_id;

--Question 3
SELECT 
s.store_id,
s.store_name,
o.order_id,
o.order_date
FROM sales.stores AS s
FULL OUTER JOIN sales.orders AS o
ON s.store_id = o.store_id;

--Question 4

SELECT 
p.product_id,
p.product_name,
c.category_id,
c.category_name
FROM production.products AS p
FULL OUTER JOIN production.categories AS c
ON C.category_id  = p.category_id;

--Qesution 5

SELECT 
p.product_name,
b.brand_name,
c.category_name,
p.list_price
FROM production.products AS p
FULL OUTER JOIN production.brands AS b
ON p.brand_id = b.brand_id 
FULL OUTER JOIN production.categories AS C
ON c.category_id = p.category_id;