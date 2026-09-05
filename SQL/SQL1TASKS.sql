create database SalesAnalyticsDB;

use SalesAnalyticsDB;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INT,
    country VARCHAR(50),
    amount_spend INT
);

INSERT INTO customers (id, user_name, age, country, amount_spend)
VALUES
(1, 'Rahul', 19, 'India', 5000),
(2, 'Priya', 24, 'India', 12000),
(3, 'Amit', 31, 'USA', 25000),
(4, 'Sneha', 42, 'UK', 48000),
(5, 'Rohan', 55, 'Canada', 75000),
(6, 'Neha', 28, 'Australia', 18000),
(7, 'Vikas', 67, 'Germany', 95000),
(8, 'Anjali', 36, 'India', 32000),
(9, 'Karan', 23, 'USA', 8000),
(10, 'Pooja', 47, 'UK', 55000),
(11, 'Arjun', 29, 'Canada', 22000),
(12, 'Meera', 61, 'Australia', 85000),
(13, 'Sahil', 20, 'Germany', 6000),
(14, 'Kavita', 39, 'India', 40000),
(15, 'Nikhil', 52, 'USA', 68000),
(16, 'Divya', 26, 'UK', 15000),
(17, 'Manish', 72, 'Canada', 120000),
(18, 'Riya', 33, 'Australia', 27000),
(19, 'Harsh', 44, 'Germany', 62000),
(20, 'Isha', 58, 'India', 90000);

SELECT * FROM customers;

SELECT user_name , age , country from customers;

SELECT user_name , country , amount_spend from customers;

SELECT * FROM customers
where amount_spend > 50000;

SELECT * FROM customers
where age<30;

SELECT * FROM customers
where country='India';

SELECT * FROM customers
where amount_spend < 20000;

SELECT * FROM customers
where age < 30 AND amount_spend > 30000;

SELECT * FROM customers
where country='India' AND amount_spend>40000;

SELECT * FROM customers
where country='India' OR country='USA';

SELECT * FROM customers
where country IN ('India','USA');

SELECT * FROM customers
where country IN ('India','USA') and amount_spend>50000;

SELECT * FROM customers
where country NOT IN ('India');

SELECT * FROM customers
where country != 'India';

SELECT * FROM customers
order by amount_spend;

SELECT * FROM customers
order by amount_spend DESC;

SELECT user_name , age , country , amount_spend from customers
order by age;

SELECT * FROM customers
where age BETWEEN 25 AND 40 AND (amount_spend>30000 AND country IN ('India','USA'))
order by amount_spend DESC;

SELECT * FROM customers 
where age>=30 and amount_spend>40000 and country!='India' 
order by amount_spend DESC;
