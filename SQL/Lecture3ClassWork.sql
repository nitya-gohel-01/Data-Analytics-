create database companyDB;

use companyDB;

create table customer
(
	id int primary key,
	user_name varchar(50) not null,
	age int,
	country varchar(50) not null,
	amount_spend int
);

insert into customer
values 
(1, 'Rahul' , 25 , 'India' , 15000),
(2, 'Priya', 28, 'India', 22000),
(3, 'Amit', 32, 'India', 18000),
(4, 'Neha', 24, 'India', 12000),
(5, 'John', 35, 'USA', 30000),
(6, 'Sarah', 29, 'UK', 25000),
(7, 'David', 41, 'Canada', 35000),
(8, 'Emma', 27, 'Australia', 20000),
(9, 'Rohan', 30, 'India', 28000),
(10, 'Sophia', 33, 'USA', 32000); 


select * from customer;

select user_name , age 
from customer;

select * from customer
where age > 30 and country = 'India';

select * from customer
where country = 'India' and user_name like '%A';

select * from customer
where amount_spend between 20000 and 30000;

select * from customer
order by age desc;

select * from customer
where age > 30 
order by amount_spend;

select top 2 * from customer
where age > 30 
order by amount_spend desc;