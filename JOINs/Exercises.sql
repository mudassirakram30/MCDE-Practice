use bikestores;
--Write a query that lists every product with its brand name, using production.products and production.brands.

SELECT 
 p.product_name,
 p.product_id,
 b.brand_id
FROM production.products AS p
INNER JOIN production.brands AS b
ON p.brand_id = b.brand_id;

-- Using a LEFT JOIN, write a query that finds every store with zero staff currently assigned to it.
SELECT * FROM sales.staffs;
SELECT * FROM sales.stores;
SELECT
 s.store_name,
 st.staff_id
FROM sales.stores AS s
LEFT JOIN sales.staffs AS st
ON s.store_id = st.store_id 
WHERE st.staff_id IS NULL;

--Explain, in your own words, why the following query returns every product regardless of stock level, and rewrite it so that it only returns products with fewer than 5 units in stock at store 1:
--SELECT p.product_name, s.quantity
--FROM production.products AS p
--LEFT JOIN production.stocks AS s
    --ON p.product_id = s.product_id AND s.quantity < 5 AND s.store_id = 1;

SELECT p.product_name, s.quantity
FROM production.products AS p
INNER JOIN production.stocks AS s
ON p.product_id = s.product_id
AND s.quantity < 5
AND s.store_id = 1;

--Write a self join on sales.staffs that lists every manager along with a count placeholder column showing 1 for each employee they manage (you will replace this with a real COUNT in Chapter 3); for now, just produce one row per employee-manager pair.

SELECT 
 e.first_name + ' ' + e.last_name AS Employee,
 m.first_name + ' ' + m.last_name AS Manager,
 1 AS employee_count
FROM sales.staffs AS e
 INNER JOIN sales.staffs AS m
ON e.manager_id = m.staff_id;

--Write a three-table join across sales.orders, sales.order_items, and production.products that lists every item in order #1, including product name and quantity.

SELECT * FROM sales.order_items;
SELECT * FROM sales.orders;
SELECT 
 p.product_name,
 oi.quantity
FROM production.products AS p
INNER JOIN sales.order_items AS oi
ON p.product_id = oi.product_id 
WHERE oi.order_id = 1;


