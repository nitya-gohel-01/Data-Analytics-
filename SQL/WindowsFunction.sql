CREATE DATABASE WindowFunctionsPractice;
GO

USE WindowFunctionsPractice;
GO

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    JoiningDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmployeeID, EmployeeName, Department, City, JoiningDate, Salary)
VALUES
(101, 'Rahul', 'IT', 'Ahmedabad', '2021-01-15', 90000),
(102, 'Amit', 'IT', 'Mumbai', '2022-03-20', 80000),
(103, 'Karan', 'IT', 'Pune', '2023-06-10', 80000),
(104, 'Neha', 'IT', 'Ahmedabad', '2024-02-05', 70000),
(105, 'Priya', 'HR', 'Mumbai', '2021-07-12', 85000),
(106, 'Pooja', 'HR', 'Pune', '2022-09-18', 75000),
(107, 'Riya', 'HR', 'Ahmedabad', '2023-04-25', 75000),
(108, 'Sneha', 'HR', 'Mumbai', '2024-01-10', 65000),
(109, 'Vikas', 'Sales', 'Delhi', '2020-11-05', 95000),
(110, 'Arjun', 'Sales', 'Ahmedabad', '2021-08-14', 85000),
(111, 'Rohit', 'Sales', 'Mumbai', '2022-05-22', 85000),
(112, 'Mehul', 'Sales', 'Pune', '2023-10-30', 70000),
(113, 'Jay', 'Finance', 'Delhi', '2020-02-15', 100000),
(114, 'Nikhil', 'Finance', 'Mumbai', '2021-05-19', 90000),
(115, 'Dhruv', 'Finance', 'Ahmedabad', '2022-12-01', 90000),
(116, 'Harsh', 'Finance', 'Pune', '2024-03-15', 75000);

CREATE TABLE Sales
(
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    EmployeeID INT,
    Department VARCHAR(30),
    Product VARCHAR(50),
    Category VARCHAR(30),
    Region VARCHAR(30),
    SalesAmount DECIMAL(10,2),
    Quantity INT
);

INSERT INTO Sales
(SaleID, SaleDate, EmployeeID, Department, Product, Category, Region, SalesAmount, Quantity)
VALUES
(1,  '2025-01-05', 101, 'IT',      'Laptop',   'Electronics', 'West', 65000, 2),
(2,  '2025-01-12', 102, 'IT',      'Monitor',  'Electronics', 'West', 30000, 3),
(3,  '2025-01-20', 103, 'IT',      'Keyboard', 'Electronics', 'North', 10000, 5),
(4,  '2025-02-05', 101, 'IT',      'Laptop',   'Electronics', 'West', 70000, 2),
(5,  '2025-02-15', 102, 'IT',      'Monitor',  'Electronics', 'North', 35000, 4),
(6,  '2025-02-25', 103, 'IT' ,     'Mouse',    'Electronics', 'North', 8000,  8),
(7,  '2025-03-05', 104, 'IT',      'Laptop',   'Electronics', 'West', 75000, 2),
(8,  '2025-03-15', 101, 'IT',      'Tablet',   'Electronics', 'South', 45000, 3),

(9,  '2025-01-08', 105, 'HR',      'Chair',    'Furniture', 'West', 12000, 5),
(10, '2025-01-18', 106, 'HR',      'Desk',     'Furniture', 'North', 25000, 3),
(11, '2025-01-28', 107, 'HR',      'Chair',    'Furniture', 'South', 15000, 6),
(12, '2025-02-10', 105, 'HR',      'Desk',     'Furniture', 'West', 30000, 4),
(13, '2025-02-20', 106, 'HR',      'Chair',    'Furniture', 'North', 18000, 7),
(14, '2025-03-10', 107, 'HR',      'Desk',     'Furniture', 'South', 35000, 4),

(15, '2025-01-06', 109, 'Sales',   'Phone',    'Electronics', 'North', 50000, 5),
(16, '2025-01-16', 110, 'Sales',   'Laptop',   'Electronics', 'West', 80000, 2),
(17, '2025-01-26', 111, 'Sales',   'Phone',    'Electronics', 'South', 45000, 4),
(18, '2025-02-06', 109, 'Sales',   'Laptop',   'Electronics', 'North', 90000, 2),
(19, '2025-02-16', 110, 'Sales',   'Phone',    'Electronics', 'West', 55000, 5),
(20, '2025-02-26', 111, 'Sales', 'Laptop', 'Electronics', 'South', 85000, 2),
(21, '2025-03-06', 109, 'Sales', 'Phone', 'Electronics', 'North', 60000, 6),
(22, '2025-03-16', 110, 'Sales', 'Laptop', 'Electronics', 'West', 95000, 2),

(23, '2025-01-10', 113, 'Finance', 'Printer',  'Electronics', 'North', 40000, 4),
(24, '2025-01-20', 114, 'Finance', 'Scanner',  'Electronics', 'West', 30000, 3),
(25, '2025-01-30', 115, 'Finance', 'Printer',  'Electronics', 'South', 45000, 5),
(26, '2025-02-10', 113, 'Finance', 'Scanner',  'Electronics', 'North', 35000, 3),
(27, '2025-02-20', 114, 'Finance', 'Printer',  'Electronics', 'West', 50000, 5),
(28, '2025-03-10', 115, 'Finance', 'Scanner',  'Electronics', 'South', 40000, 4);

-- Windows Function Practice

-- LEVEL 1 :

-- 1.

SELECT EmployeeName , Salary ,
SUM(Salary) 
OVER() 
AS Total_Salary
FROM Employees;

-- 2.

SELECT EmployeeName , Salary ,
SUM(Salary) 
OVER(PARTITION BY Department) 
AS Total_Salary
FROM Employees;

-- 3.

SELECT SalesAmount , 
SUM(SalesAmount) 
OVER() 
AS Total_Sales
FROM Sales;

-- 4.

SELECT SaleID , Department , SalesAmount ,
SUM(SalesAmount) 
OVER(PARTITION BY Department)
FROM Sales;

-- 5.

SELECT * ,
AVG(Salary)
OVER() 
AS Average_Salary
FROM Employees;

-- 6.

SELECT * ,
AVG(Salary)
OVER(PARTITION BY Department)
AS Average_Salary
FROM Employees;

-- 7.

SELECT * , COUNT(*)
OVER()
AS Total_Employees
FROM Employees;

-- 8.

SELECT * ,
COUNT(*)
OVER(PARTITION BY Department) 
AS Total_Employee
FROM Employees;

-- 9.

SELECT * ,
MAX(Salary) 
OVER()
AS Highest_Salary ,
MIN(Salary) 
OVER()
AS Lowest_Salary
FROM Employees;

-- 10.

SELECT * ,
MAX(Salary) 
OVER(PARTITION BY Department)
AS Highest_Salary ,
MIN(Salary) 
OVER(PARTITION BY Department)
AS Lowest_Salary
FROM Employees;

-- LEVEL 2 :

-- 11.

SELECT * ,
ROW_NUMBER() 
OVER(ORDER BY Salary DESC)
AS Unique_Id
FROM Employees;

-- 12.

SELECT * ,
ROW_NUMBER()
OVER(
    PARTITION BY Department 
    ORDER BY Salary DESC
)
AS Unique_No
FROM Employees;

-- 13.

SELECT * ,
RANK()
OVER(ORDER BY Salary DESC)
AS Rank_Employee
FROM Employees;

-- 14.

SELECT * ,
RANK()
OVER(
    PARTITION BY Department 
    ORDER BY Salary DESC
)
AS Rank_Employee
FROM Employees;

-- 15.

SELECT * ,
ROW_NUMBER()
OVER(
    PARTITION BY Department 
    ORDER BY Salary DESC
) 
AS Row_Number_Function,
RANK()
OVER(
    PARTITION BY Department 
    ORDER BY Salary DESC
)
AS Rank_Function,
DENSE_RANK() 
OVER(
    PARTITION BY Department 
    ORDER BY Salary DESC
)
AS Dense_Rank_Function
FROM Employees;

-- 16.

SELECT * ,
NTILE(4) 
OVER(ORDER BY Salary DESC)
AS Group_No
FROM Employees;

-- 17.

SELECT * ,
PERCENT_RANK() 
OVER(ORDER BY Salary DESC)
AS Percentage_Wise_Rank
FROM Employees;

-- 18.

SELECT * ,
CUME_DIST()
OVER(ORDER BY Salary DESC)
AS Cumulative_Distribution
FROM Employees;

-- LEVEL 3 :

-- 19.

SELECT SaleDate ,
SUM(SalesAmount)
OVER(
    ORDER BY SaleDate 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
AS Running_Total
FROM Sales;

-- 20.

SELECT SaleDate ,
SUM(SalesAmount)
OVER(
    PARTITION BY Department 
    ORDER BY SaleDate 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
AS Running_Total_Department_Wise
FROM Sales;

-- 21.

SELECT * ,
AVG(SalesAmount)
OVER(
    ORDER BY SaleDate 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
AS Average_Sales_Amount
FROM Sales;

-- 22.

SELECT * ,
MAX(SalesAmount)
OVER(
    ORDER BY SaleDate
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
AS Maximum_Sales_Amount
FROM Sales;

-- 23.


