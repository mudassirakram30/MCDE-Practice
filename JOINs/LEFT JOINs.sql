Use bikestores;

--LEFT JOINs
--LEFT JOIN wo JOIN hai jo LEFT table ki sari rows return 
--karta hai, aur RIGHT table se sirf matching rows ko combine karta hai.
--Agar RIGHT table mein match nahi milta, to uske columns mein NULL aata hai.

SELECT * FROM sales.customers;
SELECT * FROM sales.orders;
--Question 1
SELECT 
c.first_name,
c.last_name,
o.order_id 
FROM sales.customers AS c
LEFT JOIN sales.orders AS o
ON c.customer_id = o.customer_id;

--Question 2
SELECT * FROM production.products;
SELECT * FROM sales.order_items;
SELECT
p.product_name,
p.product_id,
oi.order_id
FROM production.products AS p
LEFT JOIN sales.order_items AS oi 
ON p.product_id = oi.product_id;

--Question 3
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;
SELECT 
c.customer_id,
c.first_name,
c.last_name
FROM sales.customers AS c
LEFT JOIN sales.orders AS o 
ON c.customer_id = o.customer_id
WHERE o.order_date IS NULL;

--Question 4

SELECT * FROM production.products;
SELECT * FROM production.categories;

SELECT 
p.product_name,
p.list_price,
c.category_name
FROM production.products AS p
LEFT JOIN production.categories AS c
ON p.category_id = c.category_id;

--Question 5
SELECT * FROM sales.orders;
SELECT 
s.store_name,
o.order_id,
o.order_date
FROM sales.stores AS s
LEFT JOIN sales.orders AS o
ON s.store_id = o.store_id;