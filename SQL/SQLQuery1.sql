CREATE DATABASE SalesPracticeDB;
GO
USE SalesPracticeDB;
GO

CREATE TABLE Customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 city VARCHAR(50),
 customer_type VARCHAR(20)
);
CREATE TABLE Products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50),
 category VARCHAR(30),
 price DECIMAL(10,2)
);

CREATE TABLE Orders (
 order_id INT PRIMARY KEY,
 customer_id INT,
 product_id INT,
 quantity INT,
 order_date DATE,
 status VARCHAR(20),
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
 FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers
(customer_id, customer_name, city, customer_type)
VALUES
(1, 'Rahul', 'Ahmedabad', 'Regular'),
(2, 'Priya', 'Surat', 'Premium'),
(3, 'Amit', 'Rajkot', 'Regular'),
(4, 'Neha', 'Ahmedabad', 'Premium'),
(5, 'Karan', 'Vadodara', 'Regular'),
(6, 'Pooja', 'Surat', 'Premium'),
(7, 'Rohan', 'Ahmedabad', 'Regular'),
(8, 'Sneha', 'Rajkot', 'Premium');

INSERT INTO Products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Monitor', 'Electronics', 18000),
(106, 'Mouse', 'Accessories', 800);

INSERT INTO Orders
(order_id, customer_id, product_id, quantity, order_date, status)
VALUES
(1001, 1, 101, 1, '2026-01-05', 'Completed'),
(1002, 2, 102, 2, '2026-01-10', 'Completed'),
(1003, 3, 103, 3, '2026-01-15', 'Pending'),
(1004, 4, 101, 1, '2026-02-02', 'Completed'),
(1005, 5, 104, 2, '2026-02-08', 'Completed'),
(1006, 6, 105, 1, '2026-02-12', 'Cancelled'),
(1007, 7, 106, 5, '2026-02-18', 'Completed'),
(1008, 8, 102, 1, '2026-03-01', 'Completed'),
(1009, 1, 103, 2, '2026-03-05', 'Completed'),
(1010, 2, 105, 2, '2026-03-10', 'Completed'),
(1011, 3, 106, 4, '2026-03-15', 'Completed'),
(1012, 4, 104, 3, '2026-03-20', 'Pending');

/*Q1 — WHERE
Display all customers who live in Ahmedabad.
Topics:
 SELECT
 FROM
 WHERE*/
select * from Customers
where city='Ahmedabad';



/* Q2 — JOIN + WHERE
Display the customer name, product name, quantity, and order status for all
completed orders.
Tables required:
 Customers
 Orders
 Products
Topics:
 INNER JOIN
 WHERE */
SELECT Customers.customer_name,Products.product_name,Orders.quantity,Orders.status
from Customers
inner join Orders
on Customers.customer_id=Orders.customer_id
inner join Products
on Orders.product_id=Products.product_id
where status='Completed';


/* Q3 — GROUP BY + ORDER BY
For each product category, calculate the total quantity sold. Display the
categories from highest quantity sold to lowest.
Topics:
 JOIN
 GROUP BY
 SUM()
 ORDER BY */
select Products.category,
sum(Orders.quantity) as total_quantity_sold
from Products
inner join Orders
on Products.product_id=Orders.product_id
group by category
order by quantity desc;



/* Q4 — GROUP BY + HAVING
Find customers whose total purchased quantity is greater than 3. Display the
customer name and total quantity purchased.
Topics:
 JOIN
 GROUP BY
 SUM()
 HAVING */



/* Q5 — JOIN + GROUP BY + HAVING + ORDER BY
Create a sales report showing each customer's name, city, number of completed
orders, and total sales amount. Display only customers whose total sales amount
is greater than ₹20,000, and sort the result from highest sales to lowest.
Use:
Sales Amount = quantity × price
Topics:
 JOIN
 WHERE
 GROUP BY
 HAVING
 ORDER BY
 Aggregate functions */