
CREATE DATABASE CTE_Practice ;

USE CTE_Practice;

CREATE TABLE Employees
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    manager_id INT NULL
);

INSERT INTO Employees
(employee_id, employee_name, department, city, salary, joining_date, manager_id)
VALUES
(1, 'Amit', 'IT', 'Ahmedabad', 65000, '2021-01-15', NULL),
(2, 'Rahul', 'IT', 'Mumbai', 85000, '2020-06-10', 1),
(3, 'Karan', 'IT', 'Pune', 85000, '2021-11-22', 2),
(4, 'Anjali', 'IT', 'Delhi', 70000, '2023-05-25', 2),
(5, 'Priya', 'HR', 'Delhi', 55000, '2022-03-20', NULL),
(6, 'Neha', 'HR', 'Ahmedabad', 75000, '2021-08-12', 5),
(7, 'Sneha', 'HR', 'Pune', 60000, '2023-02-15', 5),
(8, 'Vikas', 'Finance', 'Mumbai', 90000, '2019-04-18', NULL),
(9, 'Pooja', 'Finance', 'Delhi', 70000, '2022-01-05', 8),
(10, 'Rohit', 'Finance', 'Ahmedabad', 90000, '2020-09-10', 8),
(11, 'Mehul', 'Sales', 'Ahmedabad', 62000, '2022-07-11', NULL),
(12, 'Nisha', 'Sales', 'Mumbai', 78000, '2021-12-01', 11),
(13, 'Ravi', 'Sales', 'Delhi', 68000, '2023-03-19', 11),
(14, 'Komal', 'Marketing', 'Pune', 72000, '2020-10-21', NULL),
(15, 'Tina', 'Marketing', 'Ahmedabad', 82000, '2022-06-13', 14);

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    category VARCHAR(50),
    sales_amount DECIMAL(12,2),
    quantity INT,
    order_status VARCHAR(30)
);

INSERT INTO Orders
(order_id, customer_id, order_date, product_id, category, sales_amount, quantity, order_status)
VALUES
(1001, 101, '2026-01-05', 1, 'Laptop', 75000, 1, 'Completed'),
(1002, 102, '2026-01-08', 2, 'Mobile', 30000, 1, 'Completed'),
(1003, 101, '2026-01-15', 3, 'Monitor', 18000, 2, 'Completed'),
(1004, 103, '2026-01-20', 1, 'Laptop', 80000, 1, 'Completed'),
(1005, 104, '2026-02-02', 4, 'Keyboard', 5000, 2, 'Completed'),
(1006, 102, '2026-02-10', 5, 'Tablet', 25000, 1, 'Completed'),
(1007, 105, '2026-02-14', 1, 'Laptop', 90000, 1, 'Completed'),
(1008, 101, '2026-02-20', 6, 'Mouse', 2500, 2, 'Completed'),
(1009, 103, '2026-03-03', 2, 'Mobile', 35000, 1, 'Completed'),
(1010, 106, '2026-03-10', 3, 'Monitor', 22000, 1, 'Completed'),
(1011, 104, '2026-03-17', 1, 'Laptop', 70000, 1, 'Completed'),
(1012, 105, '2026-03-21', 5, 'Tablet', 28000, 1, 'Completed'),
(1013, 102, '2026-04-04', 2, 'Mobile', 32000, 1, 'Completed'),
(1014, 106, '2026-04-12', 1, 'Laptop', 85000, 1, 'Completed'),
(1015, 107, '2026-04-18', 4, 'Keyboard', 7000, 2, 'Completed'),
(1016, 101, '2026-05-01', 3, 'Monitor', 20000, 1, 'Completed'),
(1017, 103, '2026-05-08', 1, 'Laptop', 95000, 1, 'Completed'),
(1018, 108, '2026-05-15', 5, 'Tablet', 30000, 1, 'Completed'),
(1019, 105, '2026-06-02', 2, 'Mobile', 36000, 1, 'Completed'),
(1020, 107, '2026-06-11', 6, 'Mouse', 3500, 3, 'Completed');

-- Concept Understand Question From GitHub File 

-- Simple CTE

WITH EmployeeData AS
(
    SELECT 

        employee_id ,
        employee_name ,
        department ,
        salary

    FROM Employees
)
SELECT * FROM EmployeeData;

-- CTE With WHERE

With HighSalaryEmployee AS
(
    SELECT

        employee_id ,
        employee_name ,
        department ,
        salary  

    FROM Employees
    WHERE salary > 70000
)
SELECT * FROM HighSalaryEmployee
ORDER BY salary DESC;

-- CTE with GROUP BY

WITH DepartmentSalary AS 
(
    SELECT

        department ,
        COUNT(*) AS Employee_Count ,
        AVG(salary) AS Average_Salary ,
        MAX(salary) AS Maximum_Salary ,
        MIN(salary) AS Minimum_Salary 

    FROM Employees
    GROUP BY department
)
SELECT * FROM DepartmentSalary;

-- CTE with HAVING

WITH DepartmentSalary AS
(
    SELECT
        department ,
        AVG(salary) AS Average_Salary          
    FROM Employees
    GROUP BY department 
    HAVING AVG(salary) > 70000
)
SELECT * FROM DepartmentSalary;

-- CTE with JOIN

WITH EmployeeData AS
(
    SELECT

        e.employee_id,
        e.employee_name,
        e.department
     -- d.department_location

    FROM Employees e
 -- INNER JOIN 
 -- Department d
 -- ON e.department = d.department
)
SELECT * FROM EmployeeData;

-- CTE with CASE 

WITH EmployeeCategory AS
(
    SELECT

        employee_id ,
        employee_name ,
        salary ,

        CASE 
            WHEN salary >= 90000 
            THEN 'High'

            WHEN salary >= 70000
            THEN 'Medium'

            ELSE 'Low'

            END AS employee_category
    FROM Employees
)
SELECT * FROM EmployeeCategory;

-- CTE with calculated Columns

WITH EmployeeSalary AS 
(
    SELECT

        employee_id ,
        employee_name ,
        salary ,
        salary * 12 AS Annual_Salary

    FROM Employees
)
SELECT * FROM EmployeeSalary 
WHERE Annual_Salary>90000;

-- CTE with DISTINCT

WITH Cities AS
(
    SELECT DISTINCT
    city
    FROM Employees
)
SELECT * FROM Cities 
ORDER BY city;

-- CTE + Windows Function

WITH RankedEmployees AS
(
    SELECT 
        
        employee_id ,
        employee_name ,
        department ,
        salary ,

        ROW_NUMBER() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) 
        AS rn 

    FROM Employees
)

SELECT
    employee_id ,
    employee_name ,
    department ,
    salary 
FROM RankedEmployees
WHERE rn <=3 
ORDER BY department , salary DESC;

-- Highest Salary Per Department 

WITH SalaryRanking AS
(
    SELECT
        
        employee_id ,
        employee_name ,
        department ,
        salary ,

        RANK() OVER
        (
            PARTITION BY department 
            ORDER BY salary DESC
        )
        AS Salary_Rank

    FROM Employees
)
SELECT * FROM SalaryRanking
WHERE Salary_Rank = 1;

-- Last Record Per Customer 

WITH LatestOrders AS
(
    SELECT
        
        order_id ,
        customer_id ,
        order_date ,
        sales_amount ,

        ROW_NUMBER() OVER 
        (
            PARTITION BY customer_id
            ORDER BY order_date DESC , 
                     order_id DESC
        )
        AS rn

    FROM Orders
)
SELECT 

    order_id ,
    customer_id ,
    order_date ,
    sales_amount

FROM LatestOrders
WHERE rn=1;

-- First Record Per Customer 

WITH FirstOrders AS
(
    SELECT
        
        order_id ,
        customer_id ,
        order_date ,

        ROW_NUMBER() OVER
        (
            PARTITION BY customer_id 
            ORDER BY order_date , order_id
        )
        AS rn

    FROM Orders
)
SELECT *
FROM FirstOrders 
WHERE rn = 1 ;

-- Duplicate Detection 

WITH DuplicateDetection AS
(
    SELECT 
        
        employee_id ,
        employee_name ,
        department ,
        city ,

        ROW_NUMBER() OVER
        (
            PARTITION BY employee_name , department , city
            ORDER BY employee_id
        )
        AS rn 

    FROM Employees
)
SELECT * FROM DuplicateDetection
WHERE rn > 1 ;

-- Multiple CTE

WITH EmployeeData AS
(
    SELECT * FROM Employees
) ,
DepartmentSalary AS
(
    SELECT

        department ,
        COUNT(*) AS Employee_Count ,
        AVG(salary) AS Average_Salary

    FROM EmployeeData
    GROUP BY department
)
SELECT * FROM DepartmentSalary;

--  Three-Step CTE Pipeline

WITH SalesData AS
(
    SELECT

        customer_id ,
        order_date ,
        sales_amount 

    FROM Orders
) ,
CustomerSales AS
(
    SELECT 
        
        customer_id ,
        SUM(sales_amount) AS Total_Sales 

        FROM Orders 
        GROUP BY customer_id
) ,
RankedCustomers AS
(
    SELECT 
        
        customer_id ,
        Total_Sales ,

        RANK() OVER
        (
            ORDER BY Total_Sales DESC
        )
        AS Sales_Rank

    FROM CustomerSales
)
SELECT * FROM RankedCustomers
WHERE Sales_Rank <= 5;

-- Above Average Employee 

WITH AverageSalary As
(
    SELECT AVG(salary) AS Average_Salary
    FROM Employees
)
SELECT 

    e.employee_id ,
    e.employee_name ,
    e.salary 

FROM Employees e
CROSS JOIN AverageSalary a
WHERE e.salary > a.Average_Salary;

-- Above Department Average Employee

WITH DepartmentAverage AS
(
    SELECT 

        department ,
        AVG(salary) AS Avg_Salary 

    FROM Employees
    GROUP BY department
)
SELECT   

    e.employee_id,
    e.employee_name,
    e.department,
    e.salary,
    d.Avg_Salary

FROM Employees AS e
INNER JOIN DepartmentAverage AS d
ON e.department = d.department
WHERE e.salary > d.Avg_Salary;

-- CTE Business Analytics 

-- Customer Sales 
   
WITH CustomerSales AS
(
    SELECT

        customer_id ,
        SUM(sales_amount) AS Total_Sales ,
        COUNT(order_id) AS Total_Orders ,
        AVG(sales_amount) AS Average_Order_Value
        
    FROM Orders
    GROUP BY customer_id
)
SELECT * FROM CustomerSales
ORDER BY Total_Sales DESC;

-- Customer Ranking 

WITH CustomerSales AS
(
    SELECT

        customer_id ,
        SUM(sales_amount) AS Total_Sales

    FROM Orders
    GROUP BY customer_id
),
CustomerRanking AS 
(
    SELECT

        customer_id ,
        Total_Sales ,

        RANK() OVER
        (
            ORDER BY Total_Sales DESC   
        )
        AS Sales_Rank

    FROM CustomerSales
)
SELECT * FROM CustomerRanking 
ORDER BY Sales_Rank;

-- Monthly Sales 

WITH MonthlySales AS
(
    SELECT

        YEAR(order_date) AS Order_Year ,
        MONTH(order_date) AS Order_Month ,
        SUM(sales_amount) AS Total_Sales

    FROM Orders
    GROUP BY YEAR(order_date) , MONTH(order_date)
)
SELECT *
FROM MonthlySales
ORDER BY Order_Year , Order_Month ;

-- Month - Over - Month Analysis 

WITH MonthAnalysis AS
(
    SELECT
        
        YEAR(order_date) AS Order_Year ,
        MONTH(order_date) AS Order_Month ,
        SUM(sales_amount) AS Total_Sales

    FROM Orders
    GROUP BY YEAR(order_date) , MONTH(order_date)
),
SalesComparision AS
(
    SELECT 
        
        Order_Year ,
        Order_Month ,
        Total_Sales ,
        
        LAG(Total_Sales) OVER 
        (
            ORDER BY Order_year , Order_month    
        )
        AS Previous_Month_Sales

    FROM MonthAnalysis
)
SELECT 

    Order_Year ,
    Order_Month ,
    Total_Sales ,
    Previous_Month_Sales ,
    Total_Sales - Previous_Month_Sales AS Sales_Change

FROM SalesComparision;

-- Month - Over - Month Percentage Growth 

WITH MonthlySales AS
(
    SELECT
        
        YEAR(order_date) AS Order_Year ,
        MONTH(order_date) AS Order_Month ,
        SUM(sales_amount) AS Total_Sales 

    FROM Orders 
    GROUP BY YEAR(order_date) , MONTH(order_date)
),
SalesComparision AS
(
    SELECT
        
        Order_Year ,
        Order_Month ,
        Total_Sales ,

        LAG(Total_Sales) OVER
        (
            ORDER BY Order_Year , Order_Month 
        )
        AS Previous_Month_Sales

    FROM MonthlySales
)
SELECT
    
    Order_Year ,
    Order_Month ,
    Total_Sales ,
    Previous_Month_Sales ,

    CASE 
        WHEN Previous_Month_Sales IS NULL 
             OR
             Previous_Month_Sales = 0
        THEN NULL

        ELSE
            (Total_Sales - Previous_Month_Sales) * 100.0 
            / Previous_Month_Sales
        END AS Growth_Percentage

FROM SalesComparision;

-- Running Total 

WITH DailySales AS 
(
    SELECT
        
        order_date ,
        SUM(sales_amount) AS Daily_Sales 

    FROM Orders
    GROUP BY order_date
)
SELECT 

    order_date ,
    Daily_Sales ,

    SUM(Daily_Sales) OVER
    (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )
    AS Running_Total

FROM DailySales
ORDER BY order_date;

-- Percentage Contribution

WITH ProductSales AS
(
    SELECT
        
        product_id ,
        SUM(sales_amount) AS Product_Sales

    FROM Orders
    GROUP BY product_id
)
SELECT
    
       product_id ,
       Product_Sales ,
       Product_Sales * 100.0
       / SUM(Product_Sales) OVER() 
       AS Sales_Percentage

FROM ProductSales;

-- Top 3 Products By Category 

WITH ProductRanking AS
(
    SELECT

        category ,
        product_id ,
        SUM(sales_amount) AS Total_Sales ,

        ROW_NUMBER() OVER
        (
            PARTITION BY category 
            ORDER BY SUM(sales_amount) DESC
        )
        AS rn

    FROM Orders
    GROUP BY category , product_id 
)
SELECT
    
    category ,
    product_id ,
    Total_Sales 

FROM ProductRanking
WHERE rn<=3
ORDER BY category , Total_Sales DESC;

-- Customer Classification 

WITH CustomerSales AS
(
    SELECT
    
        customer_id ,
        SUM(sales_amount) AS Total_Sales

    FROM Orders
    GROUP BY customer_id
)
SELECT 

    customer_id ,
    Total_Sales ,

    CASE

        WHEN Total_Sales >= 100000 
        THEN 'Platinum'

        WHEN Total_Sales >= 50000
        THEN 'Gold'

        WHEN Total_Sales >= 25000
        THEN 'Bronze'

        ELSE 'Bronze'

    END AS Customer_Category

FROM CustomerSales;

-- CTE with DML

-- CTE + Insert 

/*
WITH HighSalaryEmployees AS
(
    SELECT
        employee_id,
        employee_name,
        department,
        salary
    FROM Employees
    WHERE salary >= 80000
)
INSERT INTO HighSalaryEmployeesArchive
(
    employee_id,
    employee_name,
    department,
    salary
)
SELECT
    employee_id,
    employee_name,
    department,
    salary
FROM HighSalaryEmployees; 

*/

-- CTE + Update

/*
WITH EmployeeUpdates AS
(
    SELECT employee_id
    FROM Employees
    WHERE department = 'IT'
      AND salary < 60000
)
UPDATE e
SET salary = salary + 5000
FROM Employees e
INNER JOIN EmployeeUpdates u
    ON e.employee_id = u.employee_id;
*/

-- CTE + Delete

/*
WITH RecordsToDelete AS
(
    SELECT employee_id
    FROM Employees
    WHERE salary <= 0
)
DELETE FROM Employees
WHERE employee_id IN
(
    SELECT employee_id
    FROM RecordsToDelete
);
*/

-- Recursive CTE 

-- Recursive Numbrs 

WITH Numbers AS
(
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1 
    FROM Numbers
    WHERE number <10
)
SELECT * 
FROM Numbers
OPTION (MAXRECURSION 0);

-- Recursive Date 

WITH Dates AS
(
    SELECT CAST('2026-01-01' AS DATE) AS Order_Date

    UNION ALL 

    SELECT DATEADD(DAY , 1 , Order_Date)
    FROM Dates
    WHERE Order_Date < '2026-01-10'
)
SELECT *
FROM Dates
OPTION (MAXRECURSION 0);

-- CTE Practice Task

-- Basic CTE 

-- 1.

WITH EmpAllData AS
(
    SELECT *
    FROM Employees
)
SELECT * 
FROM EmpAllData;

-- 2.

WITH HighSalaryEmp AS 
(
    SELECT *
    FROM Employees
    WHERE salary > 70000
)
SELECT *
FROM HighSalaryEmp;

-- 3.

WITH EmpPrimaryInfo AS
(
    SELECT 

        employee_id ,
        employee_name ,
        department ,
        salary

    FROM Employees
)
SELECT * 
FROM EmpPrimaryInfo;

-- 4.

WITH EmpAnnualSalary AS
(
    SELECT 

        employee_id ,
        employee_name ,
        salary ,
        salary * 12 AS Annual_Salary 

    FROM Employees
)
SELECT *
FROM EmpAnnualSalary;

-- 5.

WITH EmpFromAHMD AS
(
    SELECT * 
    FROM Employees
    WHERE city='Ahmedabad'
)
SELECT *
FROM EmpFromAHMD;

-- 6.

WITH EmpCategory AS
(
    SELECT 

        employee_id ,
        employee_name ,
        salary ,

        CASE

            WHEN salary > 70000
            THEN 'High Salary'

            WHEN salary > 40000 
            THEN 'Medium Salary'

            ELSE 'Low Salary'

        END AS Salary_Category

    FROM Employees
)
SELECT *
FROM EmpCategory;

-- Aggregation

-- 7. 

WITH AvgSales AS
(
    SELECT
        
        department ,
        AVG(salary) AS Average_Salary

    FROM Employees
    GROUP BY department
)
SELECT *
FROM AvgSales
ORDER BY Average_Salary DESC;

-- 8.

WITH TotalEmployee AS
(
    SELECT
        
        department ,
        COUNT(employee_id) AS Total_Employees

    FROM Employees
    GROUP BY department
)
SELECT *
FROM TotalEmployee 
ORDER BY Total_Employees DESC;

-- 9.

WITH MaxSalary AS 
(
    SELECT
        
        department ,
        MAX(salary) AS Maximum_Salary

    FROM Employees
    GROUP BY department
)
SELECT *
FROM MaxSalary
ORDER BY Maximum_Salary DESC;

-- 10.

WITH MinMaxSalary AS 
(
    SELECT
        
        department ,
        MIN(salary) AS Minimum_Salary ,
        MAX(salary) AS Maximum_Salary

    FROM Employees
    GROUP BY department
)
SELECT *
FROM MinMaxSalary
ORDER BY Minimum_Salary;

-- 11.

WITH HighAvgSal AS
(
    SELECT
        
        department ,
        AVG(salary) AS Average_Salary

    FROM Employees
    GROUP BY department
)
SELECT *
FROM HighAvgSal
WHERE Average_Salary > 70000;

-- 12.

WITH TotalEmployee AS
(
    SELECT
        
        department ,
        COUNT(employee_id) AS Total_Employees

    FROM Employees
    GROUP BY department
)
SELECT *
FROM TotalEmployee 
WHERE Total_Employees > 2
ORDER BY Total_Employees DESC;

-- CTE + Windows Function 

-- 13.

WITH EmpRank AS
(
    SELECT 

        employee_id ,
        employee_name ,
        salary ,

        DENSE_RANK() OVER 
        (
            PARTITION BY department
            ORDER BY salary DESC
        )
        AS Emp_Rank

    FROM Employees
)
SELECT * 
FROM EmpRank
ORDER BY Emp_Rank ;

-- 14.

WITH EmpRank AS
(
    SELECT 

        employee_id ,
        employee_name ,
        salary ,
        department,

        DENSE_RANK() OVER 
        (
           PARTITION BY department
           ORDER BY salary DESC
        )
        AS Emp_Rank

    FROM Employees
)
SELECT * 
FROM EmpRank
WHERE Emp_Rank <3
ORDER BY department , Emp_Rank;

-- 15.

WITH HighPaidEmp AS
(
    SELECT 

        employee_id ,
        employee_name ,
        salary ,
        department,

        DENSE_RANK() OVER
        (
           PARTITION BY department
           ORDER BY salary DESC
        )
        AS Emp_Rank

    FROM Employees
)
SELECT * 
FROM HighPaidEmp
WHERE Emp_Rank = 1;

-- 16.

WITH SalaryLevels AS
(
    SELECT

        employee_id,
        employee_name,
        department,
        salary,

        DENSE_RANK() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_level

    FROM Employees
)
SELECT *
FROM SalaryLevels
WHERE salary_level < 4;

-- 17.

WITH SalaryLevels AS
(
    SELECT
        employee_id,
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_level
    FROM Employees
)
SELECT *
FROM SalaryLevels;

-- 18.

WITH LatestEmployee AS
(
    SELECT

        employee_id,
        employee_name,
        department,
        joining_date,

        ROW_NUMBER() OVER
        (
            PARTITION BY department
            ORDER BY joining_date DESC
        ) 
        AS rn

    FROM Employees
)
SELECT *
FROM LatestEmployee
WHERE rn = 1;

-- 19.

WITH EarliestEmployee AS
(
    SELECT

        employee_id,
        employee_name,
        department,
        joining_date,

        ROW_NUMBER() OVER
        (
            PARTITION BY department
            ORDER BY joining_date
        ) 
        AS rn

    FROM Employees
)
SELECT *
FROM EarliestEmployee
WHERE rn = 1;

-- 20.

WITH EmployeeNumbers AS
(
    SELECT

        employee_id,
        employee_name,
        department,
        salary,

        ROW_NUMBER() OVER
        (
            ORDER BY salary DESC
        ) 
        AS row_num

    FROM Employees
)
SELECT *
FROM EmployeeNumbers;

-- Orders

-- 21.

