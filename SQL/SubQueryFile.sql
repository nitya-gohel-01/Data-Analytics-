USE SubqueryPracticeDB;

-- SINGLE ROW SUBQUERIES PRACTICE

--1.

SELECT EmployeeID , EmployeeName , Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

--2.

SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

--3.

SELECT *
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

--4.

SELECT *
FROM Employees
WHERE Salary > (SELECT Salary FROM Employees
WHERE EmployeeName='Rahul');

--5.

SELECT *
FROM Employees
WHERE Salary = (SELECT Salary FROM Employees
WHERE EmployeeName='Priya')

--6.

SELECT EmployeeID , EmployeeName , DepartmentID , Salary
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM  Departments
Where DepartmentName='IT');

--7.

SELECT * FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Employees
WHERE EmployeeName='Rahul')

--8.

SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

--9.

SELECT * 
FROM Products
WHERE Price > (SELECT Price FROM Products
WHERE ProductName='Laptop');

--10.

SELECT * FROM Customers
WHERE City IN (SELECT City FROM Employees);

--11.

SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments
WHERE DepartmentName='IT'));

--12.

SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products
WHERE Category='Electronics');

-- 13.

SELECT *
FROM Employees
WHERE DepartmentID IN ( SELECT DepartmentID FROM Departments
WHERE Location = 'Pune');

-- 14.

SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-- 15.

SELECT EmployeeID, EmployeeName, DepartmentID, Salary
FROM Employees E
WHERE Salary > (SELECT AVG(Salary) FROM Employees E2
WHERE E2.DepartmentID = E.DepartmentID);

-- MULTI ROW SUBQUERIES PRACTICE

-- 1.

SELECT * 
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments
WHERE DepartmentName IN ('Sales','HR'));

-- 2.

SELECT *
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments
WHERE Location IN('Ahmedabad','Mumbai'));

-- 3.

SELECT *
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-- 4.

SELECT * 
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders
WHERE EmployeeID IN (SELECT EmployeeID FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments
WHERE DepartmentName = 'IT')));

-- 5.

SELECT * FROM Products
WHERE ProductID IN (SELECT ProductID FROM Orders
GROUP BY ProductID
HAVING COUNT(ProductID)>=1);

-- 6.

SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders
WHERE ProductID IN (SELECT ProductID FROM Products
WHERE Category='Electronics'));

-- 7.

SELECT * 
FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE City='Ahmedabad'));

-- 8.

SELECT * FROM Employees
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments
WHERE DepartmentName = 'IT');

-- 9.

SELECT * FROM Employees
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments 
WHERE DepartmentName IN ('HR','Sales'));

-- 10.

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders 
WHERE ProductID IS NOT NULL);

-- 11.

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders
WHERE CustomerID IS NOT NULL);

-- 12.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Employees
WHERE EmployeeID IS NOT NULL);

-- 13.

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE City = 'Ahmedabad'));

-- 14.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders
WHERE CustomerID  IN (SELECT CustomerID FROM Customers
WHERE City  IN ('Ahmedabad','Mumbai')));

-- 15.

SELECT * FROM Employees
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments
WHERE DepartmentName='Finance');

-- 16.

SELECT ProductID , ProductName , Price
FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders);

-- 17.

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- 18.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders);

-- 19.

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE CITY = 'Mumbai'));

-- 20.

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE CITY IN ('Ahmedabad', 'Mumbai')));

-- 21.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE City='Delhi'));

-- 22.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE City IN ('Pune','Bangalore')));

-- 23.

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders
WHERE ProductID IN (SELECT ProductID FROM Products
WHERE Category='Electronics'))

-- 24.

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE Age>35));

-- 25.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE CITY IN ('Ahmedabad','Mumbai','Pune')));

-- 26.

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders
WHERE ProductID IN (SELECT ProductID FROM Products
WHERE Category='Furniture'));

-- 27.

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE Gender='Male'));

-- 28.

SELECT * FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE age > 40));

-- 29. 

SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers
WHERE City='Ahmedabad' AND age<30));
