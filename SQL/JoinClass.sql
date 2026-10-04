create database join_practice;

use join_practice;

create table customers
(
 id int primary key ,
 name varchar(10) ,
 age int,
 address varchar(10)
);

create table orders
(
 oid int primary key ,
 customer_id int ,
 item varchar(10),
 amount int

);

insert into customers values
(1,'Kirtan',21,'Pbr'),
(2,'Nitya',20,'Pbr'),
(3,'Riya',21,'Pbr'),
(4,'Dhruvika',21,'Pbr');

insert into orders values
(1,1,'Pizza',250),
(2,2,'Dossa',120),
(3,5,'Wrap',150),
(4,7,'Burger',270);

-- Join Queries :

-- 1 Inner Join

SELECT * FROM 
customers
INNER JOIN
orders
on customers.id = orders.customer_id;

-- 2 Left Join

SELECT * FROM 
customers
LEFT JOIN
orders
on customers.id = orders.customer_id;

-- 3 Right Join 

SELECT * FROM 
customers
RIGHT JOIN
orders
on customers.id = orders.customer_id;

-- 4 Full Join

SELECT * FROM 
customers
INNER JOIN
orders
on customers.id = orders.customer_id;