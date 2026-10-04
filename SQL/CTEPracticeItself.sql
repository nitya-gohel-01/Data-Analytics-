CREATE DATABASE CTE_Practice;
GO

USE CTE_Practice;
GO

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    Experience INT
);

INSERT INTO Employees
(EmployeeID, EmployeeName, Department, City, Salary, Experience)
VALUES
(1, 'Amit',  'IT',      'Ahmedabad', 60000, 2),
(2, 'Raj',   'HR',      'Mumbai',    45000, 1),
(3, 'Jay',   'IT',      'Ahmedabad', 75000, 4),
(4, 'Neha',  'Sales',   'Delhi',     50000, 3),
(5, 'Ravi',  'IT',      'Pune',      65000, 3),
(6, 'Priya', 'HR',      'Ahmedabad', 55000, 2),
(7, 'Karan', 'Sales',   'Mumbai',    70000, 5),
(8, 'Meera', 'Finance', 'Delhi',     80000, 6),
(9, 'Arjun', 'Finance', 'Pune',      60000, 4),
(10,'Pooja', 'IT',      'Mumbai',    90000, 7),
(11,'Vikas', 'Sales',   'Ahmedabad', 48000, 2),
(12,'Anita', 'Finance', 'Mumbai',    75000, 5),
(13,'Rahul', 'HR',      'Pune',      50000, 3),
(14,'Sneha', 'IT',      'Delhi',     70000, 4),
(15,'Manish','Sales',   'Pune',      55000, 3);

SELECT *
FROM Employees; 