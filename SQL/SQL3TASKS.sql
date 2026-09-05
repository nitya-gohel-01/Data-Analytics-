USE SalesAnalyticsDB;


SELECT * FROM sales_transaction;

--1

SELECT 
COUNT(transaction_id) AS Total_Transaction,
SUM(quantity) AS Total_Quantity_Sold,
SUM(quantity*unit_price) AS Total_Sales,
AVG(unit_price) AS Average_Unit_Price,
MIN(unit_price) AS Lowest_Unit_Price,
MAX(unit_price) AS Highest_Unit_Price
FROM sales_transaction;

--2

SELECT category,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold ,
SUM(quantity * unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_Unit_Price
FROM sales_transaction
GROUP BY category
ORDER BY Total_Sales DESC;

--3

SELECT sales_person ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
GROUP BY sales_person
ORDER BY Total_Sales DESC;
	
--4

SELECT city ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
GROUP BY city
ORDER BY Total_Sales DESC;

--5

SELECT customer_type ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
GROUP BY customer_type
ORDER BY Total_Sales DESC;

--6

SELECT payment_mode ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
GROUP BY payment_mode
ORDER BY Total_Sales DESC;

--7

SELECT category,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
GROUP BY category
HAVING SUM(quantity*unit_price) > 300000;

--8

SELECT sales_person ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales 
FROM sales_transaction
GROUP BY sales_person
HAVING SUM(quantity*unit_price) > 500000
ORDER BY Total_Sales DESC;;

--9

SELECT product_name ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
GROUP BY product_name
HAVING SUM(quantity) > 5
ORDER BY Total_Quantity DESC;

--10

SELECT category, 
COUNT(transaction_id) AS Total_Transaction,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_UnitPrice
FROM sales_transaction
WHERE customer_type='Premium'
GROUP BY category
HAVING SUM(quantity*unit_price) > 200000;

--11

SELECT sales_person, 
COUNT(transaction_id) AS Total_Transaction,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales 
FROM sales_transaction
WHERE customer_type='VIP'
GROUP BY sales_person
HAVING SUM(quantity*unit_price) > 300000;

--12

SELECT city ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity , 
SUM(quantity*unit_price) AS Total_Sales
FROM sales_transaction
WHERE payment_mode IN ('Online','Card')
GROUP BY city
Having SUM(quantity*unit_price) > 300000;

--13

SELECT discount_percent , 
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_Unit_Price 
FROM sales_transaction
GROUP BY discount_percent
HAVING COUNT(transaction_id) >=2;

--14

SELECT sales_person , 
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_Unit_Price ,
MAX(unit_price) AS Highest_Unit_Price
FROM sales_transaction
WHERE category='Electronics'
GROUP BY sales_person
HAVING SUM(quantity*unit_price)>250000;

--15


SELECT city , 
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_Unit_Price 
FROM sales_transaction
WHERE category='Furniture'
AND quantity>2
GROUP BY city
HAVING SUM(quantity*unit_price)>50000;

--16

SELECT sales_person , 
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_Unit_Price
FROM sales_transaction
WHERE category='Appliances' 
AND payment_mode NOT IN ('Cash')
AND discount_percent<20
GROUP BY sales_person
HAVING SUM(quantity*unit_price)>100000;


--17

SELECT customer_type ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(unit_price) AS Average_Unit_Price ,
MAX(unit_price) AS Highest_Unit_Price
FROM sales_transaction
WHERE customer_type IN ('Premium','VIP')
GROUP BY customer_type
ORDER BY Total_Sales DESC;

--18

SELECT sales_person ,
COUNT(transaction_id) AS Total_Transaction ,
SUM(quantity) AS Total_Quantity_Sold , 
SUM(quantity*unit_price) AS Total_Sales ,
AVG(discount_percent) AS Average_Discount_Percentage
FROM sales_transaction
WHERE discount_percent>15
GROUP BY sales_person
HAVING COUNT(transaction_id) >= 2
ORDER BY Total_Sales DESC;

--19

INSERT INTO sales_transaction
(transaction_id,customer_name,product_name,category,quantity,unit_price,discount_percent,city,payment_mode,sales_person,customer_type)
VALUES
(1031,'Raj Mehta','MacBook Pro','Electronics',2,125000,10,'Mumbai','Online','Rahul','Premium');

SELECT * FROM sales_transaction
WHERE transaction_id=1031;

--20

SELECT sales_person , category ,
COUNT(transaction_id) AS Total_Transactions ,
SUM(quantity) AS Total_Quantity ,
SUM(quantity*unit_price) AS Total_Sales , 
AVG(unit_price) AS Average_Unit_Price , 
MIN(unit_price) AS Minimum_Unit_Price , 
MAX(unit_price) AS Maximum_Unit_Price ,
AVG(discount_percent) AS Average_Discount_Percentage
FROM sales_transaction
WHERE customer_type IN ('Premium','VIP')
AND payment_mode NOT IN ('Cash')
AND quantity>1 
AND discount_percent<20
GROUP BY sales_person , category 
HAVING SUM(quantity*unit_price) > 200000
ORDER BY SUM(quantity*unit_price) DESC;

-- Additional CRUD Challenge 

SELECT
COUNT(*) AS total_transactions,
SUM(quantity) AS total_quantity,
SUM(quantity * unit_price) AS total_sales_value,
AVG(unit_price) AS average_unit_price,
MAX(unit_price) AS highest_unit_price,
MIN(unit_price) AS lowest_unit_price
FROM sales_transaction
WHERE transaction_id = 1031;

UPDATE sales_transaction
SET discount_percent=12

WHERE transaction_id=1031;

SELECT * FROM sales_transaction
WHERE transaction_id=1031;

DELETE FROM sales_transaction
WHERE transaction_id=1031;