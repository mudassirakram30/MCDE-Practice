-- SQL JOINs

-- `JOIN` do tables ki rows ko ek doosre ke saath combine karta hai,
-- ye usually kisi matching condition ki bunyaad par hota hai,
-- jaise Foreign Key aur Primary Key ka relationship.

-- INNER JOIN

-- `INNER JOIN` sirf un rows ko return karta hai
-- jahan dono tables mein matching record mojood ho.

-- LEFT JOIN

-- `LEFT JOIN` LEFT table ki har row ko return karta hai,
-- aur RIGHT table se sirf matching rows ko combine karta hai.

-- Agar RIGHT table mein matching record na mile,
-- to RIGHT table ke columns mein `NULL` aata hai.

-- Ye kisi table mein un records ko find karne ka standard tareeqa bhi hai
-- jinka related record doosri table mein mojood nahi hai.

-- RIGHT JOIN

-- `RIGHT JOIN`, `LEFT JOIN` ka mirror hota hai.

-- Ye RIGHT table ki sari rows ko return karta hai,
-- aur LEFT table se sirf matching rows ko combine karta hai.

-- Agar LEFT table mein match na mile,
-- to LEFT table ke columns mein `NULL` aata hai.

-- Aksar RIGHT JOIN ki jagah LEFT JOIN use kiya jata hai,
-- kyunki tables ka order change karke same result hasil kiya ja sakta hai.

-- FULL OUTER JOIN

-- `FULL OUTER JOIN` dono tables ki sari rows ko return karta hai.

-- Jahan matching rows hoti hain,
-- unko combine kar deta hai.

-- Jahan match nahi hota,
-- doosri table ke columns mein `NULL` aata hai.

-- Ye especially tab useful hota hai
-- jab do independently maintained tables ke data ko compare ya reconcile karna ho.

-- CROSS JOIN

-- `CROSS JOIN` pehli table ki har row ko
-- doosri table ki har row ke saath combine karta hai.

-- Isse har possible combination generate hota hai.

-- Ismein `ON` clause nahi hota.

-- Agar pehli table mein 5 rows hain
-- aur doosri table mein 4 rows hain,

-- to result mein:
-- 5 × 4 = 20 rows aayengi.

-- SELF JOIN

-- `SELF JOIN` mein ek table ko
-- usi table ke saath JOIN kiya jata hai.

-- Usually same table ko do different aliases diye jate hain.

-- Ye same table ki different rows ke darmiyan relationship find karne ke liye use hota hai.

-- Example:
-- Employee aur Manager ka relationship.

-- FROM sales.staffs AS e
-- JOIN sales.staffs AS m
--     ON e.manager_id = m.staff_id

-- Yahan:
-- e = Employee
-- m = Manager

-- Dono same `sales.staffs` table hain.

-- One-to-Many Relationship aur Row Multiplication

-- Jab ek table ko doosri table ke saath
-- one-to-many relationship par JOIN kiya jata hai,

-- to "one" side ki ek row
-- multiple rows mein repeat ho sakti hai.

-- Example:
-- Ek customer ke 3 orders hain.

-- JOIN ke baad customer ki row
-- 3 baar appear ho sakti hai.

-- Ye normal JOIN behavior hai,
-- lekin `COUNT()` ya `SUM()` use karte waqt
-- iska khayal rakhna zaroori hai.

-- Agar iska khayal na rakha jaye,
-- to results unnecessarily multiply ho sakte hain.

-- Is problem ko Fan-Out Problem kaha jata hai.

-- Multiple JOINs

-- Multiple tables ko ek query mein JOIN kiya ja sakta hai.

-- Har JOIN ek relationship ko follow karta hai.

-- Example:

-- Customers
--     ↓
-- Orders
--     ↓
-- Order Items
--     ↓
-- Products

-- Yani hum ek relationship ke baad
-- next relationship ko follow karte hue
-- multiple tables ko chain kar sakte hain.
