use bikestores;

--Self JOINs
--SELF JOIN wo JOIN hai jismein ek hi table ko usi table 
--ke saath JOIN kiya jata hai, taake usi table ki different rows 
--ke darmiyan relationship ya comparison find ki ja sake.

--Question 1

SELECT 
e.first_name + ' ' + e.last_name AS 'Employee Name',
m.first_name + ' ' + m.last_name AS 'Manager Name'
FROM 
	sales.staffs AS e
LEFT JOIN sales.staffs  AS m
ON e.manager_id = m.staff_id;

--Question 2
SELECT * FROM sales.customers;
SELECT
c1.first_name + ' ' + c1.last_name AS 'Customer A',
c2.first_name + ' ' + c2.last_name AS 'Customer B',
c1.city
FROM 
sales.customers AS c1
LEFT JOIN sales.customers AS c2
ON c1.city = c2.city AND c1.customer_id < c2.customer_id;

--Question 3
SELECT * FROM sales.staffs;

SELECT 
s1.first_name + ' ' + s1.last_name AS 'Employee A',
s2.first_name + ' ' + s2.last_name AS 'Employee B',
s1.store_id
FROM sales.staffs AS s1
LEFT JOIN sales.staffs AS s2
ON s1.store_id = s2.store_id AND s1.staff_id < s2.staff_id;

--Question 4

SELECT 
c1.first_name + ' ' + c1.last_name AS 'Customer A',
c2.first_name + ' ' + c2.last_name AS 'Customer B',
c1.city,
c1.state
FROM sales.customers AS c1
INNER JOIN sales.customers AS c2
ON c1.city = c2.city AND c1.state = c2.state AND 
c1.customer_id < c2.customer_id;

--Question 5

SELECT 
e.first_name + ' ' + e.last_name AS 'Employee',
m.first_name + ' ' + m.last_name AS 'Manager',
mm.first_name + ' ' + mm.last_name AS 'Manager Manager'
FROM sales.staffs AS e
INNER JOIN sales.staffs AS m ON
e.manager_id = m.staff_id 
INNER JOIN sales.staffs AS mm 
ON m.manager_id = mm.staff_id;

--Question 6
SELECT * FROM sales.customers;

SELECT 
c1.first_name + ' ' + c1.last_name AS 'Customer A',
c2.first_name + ' ' + c2.last_name AS 'Customer B',
c1.zip_code 
FROM sales.customers AS c1 
INNER JOIN sales.customers AS c2
ON c1.zip_code = c2.zip_code AND c1.customer_id < c2.customer_id;

--Question 7

SELECT 
s1.first_name + ' ' + s1.last_name AS 'Employee A',
s2.first_name + ' ' + s2.last_name AS 'Employee B',
s1.store_id
FROM sales.staffs AS s1
LEFT JOIN sales.staffs AS s2
ON s1.store_id = s2.store_id 
AND s1.staff_id < s2.staff_id;

--Question 8

SELECT 
e.first_name + ' ' + e.last_name AS 'Employee',
m.first_name + ' ' + m.last_name AS 'Manager',
mm.first_name + ' ' + mm.last_name AS 'Manager Manager',
e.store_id 
FROM sales.staffs AS e
INNER JOIN sales.staffs AS m
ON e.manager_id = m.staff_id 
INNER JOIN sales.staffs AS mm
ON m.manager_id = mm.staff_id;
