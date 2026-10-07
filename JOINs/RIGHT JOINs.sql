Use bikestores;

--RIGHT JOINs

--RIGHT JOIN wo JOIN hai jo RIGHT table ki sari rows return karta hai, 
--aur LEFT table se sirf matching rows ko combine karta hai.
--Agar LEFT table mein match nahi milta, to LEFT table ke 
--columns mein NULL aata hai.
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;
SELECT 
c.first_name,
c.last_name,
o.order_id,
o.order_date
FROM sales.customers AS c
RIGHT JOIN sales.orders AS o
ON c.customer_id = o.customer_id;

--Question 2
SELECT * FROM sales.order_items;
SELECT 
p.product_name,
p.product_id,
oi.order_id,
oi.quantity 
FROM production.products AS p
RIGHT JOIN sales.order_items AS oi
ON p.product_id = oi.product_id;

--Question 3
SELECT * FROM sales.stores;
SELECT * FROM sales.orders;
SELECT
s.store_name,
s.store_id,
o.order_id,
o.order_date
FROM sales.stores AS s 
RIGHT JOIN sales.orders AS o 
ON s.store_id = o.store_id;

--Question 4 
SELECT 
p.product_name,
p.list_price,
c.category_name
FROM production.categories AS c
RIGHT JOIN production.products AS p
ON p.category_id = c.category_id;

--Question 5
SELECT 
p.product_name,
b.brand_name,
p.list_price
FROM production.brands AS b
RIGHT JOIN production.products AS p
ON p.brand_id = b.brand_id;