-- TASK :

USE join_practice;

--1

SELECT c.customer_id ,
c.customer_name ,
c.city,
o.order_id,
o.product_name,
o.amount
FROM customers AS c
INNER JOIN 
orders AS o
ON c.customer_id=o.customer_id;

--2

SELECT c.customer_name , c.city , 
o.product_name , o.amount
FROM customers AS c
INNER JOIN
orders AS o
ON c.customer_id = o.customer_id;

--3 

SELECT c.customer_id , c.customer_name ,
o.order_id , o.product_name , o.amount
FROM customers AS c
LEFT JOIN 
orders AS o
ON c.customer_id = o.customer_id;

--4

SELECT c.customer_id , c.customer_name , c.city
FROM customers AS c 
LEFT JOIN 
orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS null;

--5

SELECT o.order_id ,
o.customer_id ,
c.customer_name,
o.product_name,
o.amount
FROM customers AS c
RIGHT JOIN 
orders AS o
ON o.customer_id = c.customer_id;

--6

SELECT o.order_id ,
o.customer_id ,
o.product_name,
o.amount
FROM customers AS c
RIGHT JOIN 
orders AS o
ON o.customer_id = c.customer_id
WHERE c.customer_id is null;

--7

SELECT c.customer_id,
c.customer_name,
o.order_id ,
o.product_name,
o.amount
FROM customers AS c
FULL JOIN 
orders AS o
ON o.customer_id = c.customer_id;

--8

SELECT c.customer_id ,
o.order_id ,
o.product_name,
o.amount
FROM customers As c
INNER JOIN
orders AS o
ON c.customer_id = o.customer_id
WHERE o.amount>10000;

--9

SELECT c.customer_name ,
c.city ,
o.order_id ,
o.product_name ,
o.amount 
FROM customers AS c 
INNER JOIN
orders AS o
ON c.customer_id=o.customer_id
WHERE c.city='Delhi';

--10

SELECT c.customer_id ,
c.customer_name ,
SUM(o.amount) AS Total_Amount
FROM customers As c
LEFT JOIN
orders As o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name;

--12

SELECT
c.customer_id ,
c.customer_name , 
COUNT(o.order_id)
FROM customers AS c 
LEFT JOIN
orders AS o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name;

--13

SELECT c.customer_name , 
AVG(o.amount) AS Average_Order_Amount
FROM customers AS c 
INNER JOIN 
orders AS o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id)>=1;

--14

SELECT TOP 1 
c.customer_name ,
o.order_id ,
o.product_name ,
o.amount
FROM customers AS c
JOIN 
orders AS o
ON c.customer_id=o.customer_id
ORDER BY o.amount DESC;

SELECT 
c.customer_name ,
o.order_id ,
o.product_name ,
o.amount
FROM customers AS c
JOIN 
orders AS o
ON c.customer_id=o.customer_id
WHERE o.amount = (SELECT MAX(amount) FROM orders);

--15

SELECT TOP 1 
c.customer_name ,
o.order_id ,
o.product_name ,
o.amount
FROM customers AS c
JOIN 
orders AS o
ON c.customer_id=o.customer_id
ORDER BY o.amount ;

SELECT 
c.customer_name ,
o.order_id ,
o.product_name ,
o.amount
FROM customers AS c
JOIN 
orders AS o
ON c.customer_id=o.customer_id
WHERE o.amount = (SELECT MIN(amount) FROM orders);

--16

SELECT c.customer_id ,
c.customer_name ,
COUNT(o.order_id) AS No_Of_Orders,
SUM(o.quantity) AS Total_Quantity,
SUM(o.amount) AS Total_Amount
FROM customers AS c 
LEFT JOIN 
orders AS o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name;

--17

SELECT c.customer_name ,
SUM(o.amount) AS Total_Spent
FROM customers AS c
LEFT JOIN
orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 20000;

--18

SELECT c.customer_id ,
c.customer_name ,
COUNT(o.order_id) AS Total_Orders
FROM customers AS c
INNER JOIN
orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT(o.order_id) > 1;

--19

SELECT * FROM 
customers AS c 
FULL JOIN
orders AS o
ON c.customer_id = o.customer_id;

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.amount,
    CASE
        WHEN c.customer_id IS NOT NULL 
             AND o.order_id IS NOT NULL
            THEN 'Customer Has Order'

        WHEN c.customer_id IS NOT NULL 
             AND o.order_id IS NULL
            THEN 'Customer Has No Order'

        WHEN c.customer_id IS NULL 
             AND o.order_id IS NOT NULL
            THEN 'Order Has No Customer'
    END AS Record_Status
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.customer_id = o.customer_id
ORDER BY
    c.customer_id,
    o.order_id;

--20

SELECT c.customer_id ,
c.customer_name ,
c.city ,
o.order_id ,
o.product_name ,
o.quantity ,
o.amount ,
o.quantity * o.amount AS Total_Amount
FROM customers AS c
INNER JOIN
orders AS o
ON c.customer_id=o.customer_id;

