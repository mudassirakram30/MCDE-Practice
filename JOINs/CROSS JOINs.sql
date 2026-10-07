Use bikestores;

--CROSS JOIN wo JOIN hai jo pehli table ki 
--har row ko doosri table ki har row ke saath 
--combine karta hai, yani all possible combinations generate karta hai.

--Question 1
SELECT
b.brand_name,
c.category_name 
FROM production.brands AS b
CROSS JOIN production.categories AS c;

--Question 2
SELECT 
b.brand_name,
c.category_name
FROM production.brands AS b
CROSS JOIN production.categories AS c
ORDER BY b.brand_name ASC;

--Question 3

SELECT 
b.brand_name,
c.category_name
FROM production.brands AS b
CROSS JOIN production.categories AS c
WHERE c.category_name = 'Mountain Bikes';

--Question 4
SELECT 
s.store_name,
p.category_name
FROM sales.stores AS s
CROSS JOIN production.categories AS p
ORDER BY s.store_name ASC,
p.category_name ASC;

--Question 5

SELECT 
s.store_name,
b.brand_name
FROM sales.stores AS s
CROSS JOIN production.brands AS b
WHERE s.store_name  != 'Santa Cruz Bikes'
ORDER BY b.brand_name DESC ;
