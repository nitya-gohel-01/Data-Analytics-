-- SQL Test 

-- Queries 

USE SQL_Advanced_Joins_Test;

-- Q1

SELECT c.customer_name ,
c.city ,
c.customer_segment ,
o.order_id ,
o.order_date ,
o.order_status
FROM Customers AS c
INNER JOIN
Orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_date LIKE '2025%';

-- Q2

SELECT customer_name ,
city , customer_segment
FROM Customers
WHERE state='Gujarat'
AND customer_segment IN ('Premium','Enterprise');

-- Q3

SELECT * FROM Products
WHERE unit_price BETWEEN 5000 AND 20000
ORDER BY unit_price DESC;

-- Q4

SELECT 
order_id , customer_id , product_id , quantity , order_date
FROM Orders
WHERE order_status='Completed' AND quantity>4;

-- Q5

SELECT TOP 5 product_name , category , unit_price  
FROM Products
ORDER BY unit_price DESC;

-- Q6

SELECT customer_segment ,
COUNT(customer_id) AS No_Of_Customers
FROM Customers
GROUP BY customer_segment;

-- Q7

SELECT product_id ,
SUM(quantity) AS Product_Sold_Quantity
FROM Orders 
GROUP BY product_id;

-- Q8

SELECT category ,
AVG(unit_price) AS Averaage_Unit_Price
FROM Products
GROUP BY category;

-- Q9

SELECT category
FROM Products
GROUP BY category
HAVING AVG(unit_price) > 10000;

-- Q10

SELECT customer_id ,
COUNT(order_id) AS No_Of_Orders
FROM Orders
GROUP BY customer_id 
HAVING COUNT(order_id)>=3;

-- Q11

SELECT c.customer_name ,
o.order_id ,
p.product_name ,
o.quantity ,
p.unit_price
FROM Customers AS c
INNER JOIN 
Orders AS o
ON c.customer_id = o.customer_id
INNER JOIN
Products AS p
ON o.product_id = p.product_id;


-- Q12

SELECT c.customer_name ,
p.product_name ,
p.category ,
o.quantity ,
p.unit_price ,
SUM(o.quantity * p.unit_price) AS Total_Value
FROM Customers AS c
INNER JOIN 
Orders AS o
ON c.customer_id = o.customer_id
INNER JOIN 
Products AS p
ON o.product_id = p.product_id
GROUP BY c.customer_name , p.product_name , p.category , o.quantity , p.unit_price;

-- Q13

SELECT c.customer_name ,
SUM(o.quantity * p.unit_price) AS Total_Sales
FROM Customers AS c
INNER JOIN 
Orders AS o
ON c.customer_id = o.customer_id
INNER JOIN
Products AS p
ON o.product_id = p.product_id
GROUP BY c.customer_name;

-- Q14

SELECT p.category ,
SUM(o.quantity*p.unit_price) AS Total_Sales
FROM Products AS p
JOIN 
Orders AS o 
ON p.product_id = o.product_id
GROUP BY p.category;

-- Q15

SELECT e.employee_name ,
e.department ,
COUNT(o.order_id) AS No_Of_Orders
FROM Employees As e
LEFT JOIN
Orders AS o
ON e.employee_id = o.sales_employee_id
GROUP BY e.employee_name , e.department;

-- Q16

SELECT e.employee_name
FROM Employees AS e
INNER JOIN 
Orders AS o
ON e.employee_id = o.sales_employee_id
GROUP BY e.employee_name
HAVING COUNT(o.order_id)>8;

-- Q17

SELECT c.customer_name ,
o.order_id ,
o.order_status
FROM Customers AS c
LEFT JOIN
Orders AS o
ON c.customer_id = o.customer_id;

-- Q18

SELECT c.customer_name
FROM Customers AS c
LEFT JOIN 
Orders AS o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Q19

SELECT p.product_name
FROM Products AS p
LEFT JOIN
Orders AS o
ON p.product_id=o.product_id
WHERE o.product_id IS NULL;

-- Q20

SELECT p.product_name ,
SUM(o.quantity) AS Total_Quantity
FROM Products AS p
LEFT JOIN
Orders AS o
ON p.product_id = o.product_id
GROUP BY p.product_name;

-- Q21

SELECT c.customer_name
FROM Customers AS c
JOIN 
Orders AS o 
ON c.customer_id = o.customer_id
JOIN
Products AS p
ON o.product_id = p.product_id
WHERE o.order_status='Completed'
GROUP BY c.customer_name
HAVING SUM(o.quantity*p.unit_price)>=150000;

-- Q22

SELECT c.customer_name ,
COUNT(o.order_id) AS No_Of_Completed_Orders ,
SUM(o.quantity*p.unit_price) AS Completed_Order_value
FROM Customers AS c
LEFT JOIN 
Orders AS o
ON c.customer_id = o.customer_id
LEFT JOIN 
Products AS p
ON o.product_id = p.product_id
WHERE o.order_status='Completed' OR o.order_status='Pending' 
GROUP BY c.customer_name;

-- Q23

SELECT TOP 5 c.customer_name,
SUM(o.quantity*p.unit_price) AS Total_Revenue
FROM Customers AS c
JOIN
Orders AS o 
ON c.customer_id = o.customer_id 
JOIN 
Products AS p 
ON o.product_id = p.product_id
WHERE o.order_status='Completed'
GROUP BY c.customer_name
ORDER BY SUM(o.quantity*p.unit_price) DESC;

-- Q24 SKIP BECAUSE IT'S QUESTION OF SUB-QUERY 

SELECT p.product_name ,
p.category
FROM Orders AS o
JOIN
Products AS p
ON o.product_id = p.product_id
GROUP BY p.product_name , p.category;

-- Q25

SELECT c.customer_name ,
o.order_id ,
o.order_status ,
p.paid_amount ,
p.payment_status
FROM Customers AS c
JOIN
Orders AS o
ON c.customer_id = o.customer_id
JOIN
Payments AS p
ON o.order_id = p.order_id; 

-- Q26

SELECT o.*
FROM orders AS o 
JOIN Payments AS p
ON o.order_id = p.order_id
WHERE o.order_status = 'Completed' 
AND p.payment_status = 'Pending';

-- Q27

SELECT c.customer_name
FROM Customers AS c
LEFT JOIN SupportTickets AS s
ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL;

-- Q28

SELECT c.customer_name
FROM Customers AS c
JOIN 
SupportTickets AS s
ON c.customer_id = s.customer_id
LEFT JOIN 
Orders AS o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Q29

SELECT e.employee_id ,
e.employee_name,
COUNT(s.ticket_id) AS No_Of_Ticket
FROM Employees AS e
LEFT JOIN
SupportTickets AS s
ON e.employee_id = s.employee_id
GROUP BY e.employee_id , e.employee_name;

-- Q30

SELECT e.employee_name ,
COUNT(s.ticket_id) AS No_Of_Ticket
FROM Employees AS e
JOIN 
SupportTickets AS s
ON e.employee_id = s.employee_id
GROUP BY e.employee_name
HAVING COUNT(s.ticket_id)>2;

-- Q31

SELECT c.customer_name , 
o.order_id ,
p.product_name ,
e.employee_name ,
e.department ,
o.quantity ,
SUM(o.quantity * p.unit_price) AS Total_Order_Value
FROM Customers AS c
JOIN 
Orders AS o
ON c.customer_id = o.customer_id
JOIN 
Products AS p
ON o.product_id = p.product_id
JOIN 
Employees AS e
ON o.sales_employee_id = e.employee_id
GROUP BY c.customer_name , o.order_id , p.product_name , e.employee_name , e.department , o.quantity ;

-- Q32 

SELECT e.employee_name ,
SUM(o.quantity * p.unit_price) AS Total_Revenue
FROM Employees AS e
JOIN 
Orders AS o 
ON e.employee_id = o.sales_employee_id
JOIN 
Products AS p 
ON o.product_id = p.product_id
WHERE o.order_status='Completed'
GROUP BY e.employee_name;

-- Q33

SELECT e.employee_name ,
SUM(o.quantity * p.unit_price) AS Total_Revenue
FROM Employees AS e
JOIN 
Orders AS o 
ON e.employee_id = o.sales_employee_id
JOIN 
Products AS p 
ON o.product_id = p.product_id
WHERE o.order_status='Completed'
GROUP BY e.employee_name
HAVING SUM(o.quantity * p.unit_price) > 500000;

-- Q34

SELECT c.city ,
SUM(o.quantity * p.unit_price) AS Total_sales
FROM Customers AS c
JOIN 
Orders AS o 
ON c.customer_id = o.customer_id
JOIN 
Products AS p 
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.city ;

-- Q35


SELECT c.city ,
SUM(o.quantity * p.unit_price) AS Total_sales
FROM Customers AS c
JOIN 
Orders AS o 
ON c.customer_id = o.customer_id
JOIN 
Products AS p 
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.city 
HAVING SUM(o.quantity * p.unit_price) > 300000 ;



-- Q36

SELECT c.customer_id ,
c.customer_name ,
o.order_id ,
s.ticket_id
FROM Customers AS c
FULL OUTER JOIN 
Orders AS o
ON c.customer_id = o.customer_id 
FULL OUTER JOIN 
SupportTickets AS s
ON c.customer_id = s.customer_id;

-- Q37
SELECT DISTINCT
       c.customer_id,
       c.customer_name
FROM Customers AS c
FULL OUTER JOIN Orders AS o
    ON c.customer_id = o.customer_id
FULL OUTER JOIN SupportTickets AS s
    ON c.customer_id = s.customer_id
WHERE o.customer_id IS NULL
   OR s.customer_id IS NULL;

-- Q38

SELECT o.order_id , e.*
FROM Orders AS o
RIGHT JOIN 
Employees AS e
ON o.sales_employee_id = e.employee_id;

-- Q39

SELECT c.customer_segment ,
p.category
FROM Customers AS c
CROSS JOIN 
Products AS p;

-- Q40

SELECT e.employee_name ,
p.category
FROM Employees AS e
CROSS JOIN 
Products AS p
ORDER BY e.employee_name , p.category;

-- Q41

SELECT p.category ,
COUNT(DISTINCT c.customer_id) AS No_Of_Customers
FROM Customers AS c
JOIN 
Orders AS o
ON c.customer_id = o.customer_id	
JOIN
Products AS p 
ON o.product_id = p.product_id 
GROUP BY p.category;

-- Q42

SELECT p.category ,
COUNT(DISTINCT c.customer_id) AS No_Of_Customers
FROM Customers AS c
JOIN 
Orders AS o
ON c.customer_id = o.customer_id	
JOIN
Products AS p 
ON o.product_id = p.product_id 
GROUP BY p.category
HAVING COUNT(DISTINCT c.customer_id) >=5 ;

-- Q43

SELECT c.customer_name , 
COUNT(DISTINCT p.product_id) AS No_Of_Different_Product
FROM Customers AS c
JOIN 
Orders As o
ON c.customer_id = o.customer_id 
JOIN
Products AS p
ON o.product_id = p.product_id 
GROUP BY c.customer_name 
HAVING COUNT(DISTINCT p.product_id) >= 3;

-- Q44

SELECT c.customer_segment ,
AVG(o.quantity * p.unit_price) AS Total_Order_Value
FROM Customers AS c
JOIN 
Orders AS o
on c.customer_id = o.customer_id
JOIN 
Products AS p
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_segment ;

-- Q45

SELECT c.customer_segment ,
AVG(o.quantity * p.unit_price) AS Total_Order_Value
FROM Customers AS c
JOIN 
Orders AS o
on c.customer_id = o.customer_id
JOIN 
Products AS p
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_segment 
HAVING AVG(o.quantity * p.unit_price) > 50000;

-- Q46

SELECT e.employee_name ,
e.department ,
COUNT(o.order_id) AS No_Of_Completed_Orders ,
SUM(o.quantity) AS Total_Quantity_Sold ,
SUM(o.quantity * p.unit_price) AS Total_Revenue ,
AVG(o.quantity * p.unit_price) AS Average_Order_Value
FROM Employees AS e
JOIN 
Orders AS o
ON e.employee_id = o.sales_employee_id 
JOIN 
Products AS p
ON o.product_id = p.product_id 
WHERE o.order_status = 'Completed'
GROUP BY e.employee_name , e.department;

-- Q47 

SELECT TOP 1 e.employee_name ,
SUM(o.quantity * p.unit_price) AS Highest_Revenue
FROM Employees AS e
JOIN 
Orders AS o
ON e.employee_id = o.sales_employee_id 
JOIN 
Products AS p
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY e.employee_name
ORDER BY Highest_Revenue DESC; 

-- Q48

SELECT p.product_name , 
p.category ,
p.stock_quantity ,
SUM(o.quantity) AS Total_Quantity_Ordered ,
SUM(o.quantity * p.unit_price) AS Total_Sales_Value ,
COUNT(DISTINCT c.customer_id) AS No_Of_Customers 
FROM Products AS p
LEFT JOIN 
Orders AS o
ON p.product_id = o.product_id 
LEFT JOIN 
Customers AS c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_name , p.category , p.stock_quantity; 

-- Q49

-- Q50
