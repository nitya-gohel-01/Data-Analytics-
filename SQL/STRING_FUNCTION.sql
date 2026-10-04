-- String Function in SQL 

CREATE DATABASE String_Func_Practice;

USE String_Func_Practice;

CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Employees
VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'IT', 'Ahmedabad'),
(102, 'Priya Patel', 'priya.patel@gmail.com', 'HR', 'Mumbai'),
(103, 'Amit Shah', 'amit.shah@gmail.com', 'Finance', 'Ahmedabad'),
(104, 'Neha Mehta', 'neha.mehta@gmail.com', 'IT', 'Pune'),
(105, 'Rohan Desai', 'rohan.desai@gmail.com', 'Sales', 'Delhi');

-- 1. UPPER()

SELECT UPPER(employee_name) AS Employee_Name
FROM Employees;

SELECT UPPER(city) AS city
FROM Employees;

-- 2. LOWER() 

SELECT LOWER(employee_name) AS Employee_Name
FROM Employees;

SELECT LOWER(email) AS email
FROM Employees;

-- 3. LEN()

SELECT employee_name , LEN(employee_name) AS Name_Length
FROM Employees;

-- 4. DATALENGTH()

SELECT employee_name , DATALENGTH(employee_name) AS Byte_Length
FROM Employees;


SELECT employee_name , LEN(employee_name) AS Name_Length , 
DATALENGTH(employee_name) AS Byte_Length
FROM Employees;

-- 5.CONCAT()

SELECT CONCAT(employee_name,' - ',department) AS Employee_Info
FROM Employees;

-- 6. CONCAT_WS()

SELECT CONCAT_WS(' - ', employee_name , department , city) AS Employee_Details
FROM Employees;

-- 7. LEFT()

SELECT LEFT(employee_name,5) AS First_Five_Letter
FROM Employees;

SELECT DISTINCT city , LEFT(city,3) AS City_Code
FROM Employees;

-- 8. RIGHT()

SELECT RIGHT(employee_name,5) AS Last_Five_Characters
FROM Employees;

-- 9. SUBSTRING()

SELECT SUBSTRING(employee_name,1,3) AS Extracted_Text
FROM Employees;

-- 10. CHARINDEX()

SELECT employee_name , CHARINDEX(' ',employee_name) AS Space_Position
FROM Employees;

SELECT employee_name, CHARINDEX('a', employee_name) AS Position
FROM Employees;

-- 11. PATINDEX()

SELECT employee_name , PATINDEX('%sh%',employee_name) AS Pattern_Position
FROM Employees;

SELECT employee_name , PATINDEX('%a%',employee_name) AS Pattern_Position
FROM Employees;

-- 12. REPLACE()

SELECT REPLACE(employee_name,' ','_') AS Employee_name
FROM Employees;

SELECT REPLACE(email,'gmail.com','company.com') AS Company_Email
FROM Employees;

-- 13. TRANSLATE()

SELECT TRANSLATE('123-456-789','-','/') AS Demo;

-- 14. TRIM()

SELECT TRIM('      Kirtan     Malam     ') AS Remove_Space;

SELECT TRIM(employee_name) AS Clean_Name
FROM Employees;

-- 15. LTRIM()

SELECT LTRIM('     Nitya Gohel') AS Remove_Left_Space; 

-- 16. RTRIM()

SELECT RTRIM('Parth  Makwana     ') AS Remove_Right_Space;

-- 17. LTRIM() + RTRIM()

SELECT LTRIM(RTRIM('  Nitya Gohel    ')) 
FROM Employees;

-- 18. REVERSE() 

SELECT REVERSE('Naksh Gohel') AS Reverse_Name;

-- 19. SPACE()

SELECT CONCAT('Hello', SPACE(5), 'Naksh');

-- 20. REPLICATE()

SELECT REPLICATE('*',11) AS Repeat_Value;

SELECT CONCAT(employee_name, REPLICATE('.', 5)) AS Formatted_Name
FROM Employees;

-- 21. FORMAT()

SELECT FORMAT(1234567, 'N0') AS Formatted_Number;

-- 22. STRING_AGG()

SELECT department ,
STRING_AGG(employee_name,' , ') AS Employees
FROM Employees
GROUP BY department;

-- 23. STRING_SPLIT()

SELECT VALUE FROM STRING_SPLIT('SQL,PYTHON,POWER BI,EXCEL,TABLEAU,Statistics', ',');

-- 24. ASCII()

SELECT ASCII('Nitya') AS ASCII_VALUE;

-- 25. CHAR()

SELECT CHAR(78) AS Character_Value;

-- 26. UNICODE()

SELECT UNICODE('K');

-- 27. NCHAR()

SELECT NCHAR(75);

-- 28. DIFFERENCE()

SELECT DIFFERENCE('Nity', 'Nitya');

-- 29. SOUNDEX()

SELECT SOUNDEX('Smith');

SELECT
    SOUNDEX('Smith') AS Name1,
    SOUNDEX('Smyth') AS Name2;

-- 30. QUOTENAME() 

SELECT QUOTENAME(employee_name) AS Emp_Name FROM Employees;

-- 31. STR()

SELECT STR(123.45, 10, 2);

-- 32. STRING_ESCAPE()

SELECT STRING_ESCAPE('Rahul "Sharma"', 'json') AS Json_Sting;

-- Practice Work

-- concat using + operator 

SELECT employee_name + ' - ' + department
FROM Employees; 

-- combine string functions 

SELECT UPPER(TRIM(employee_name)) AS Clean_Name
FROM Employees;

-- Extract Only First Name 

SELECT LEFT(employee_name,CHARINDEX(' ',employee_name) - 1) AS First_Name
FROM Employees;

-- Extract Only Last Name

SELECT RIGHT(employee_name , LEN(employee_name)-CHARINDEX(' ',employee_name))
AS Last_Name
FROM Employees;

-- CREATE Username of Email 

SELECT LOWER(REPLACE(employee_name,' ','.')) AS UserName
FROM Employees;

-- Extract Email Username 

SELECT LEFT(email,CHARINDEX('@',email)-1)
FROM Employees;

-- Extract Email Domain 

SELECT SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email)) AS Email_Domain
FROM Employees;

-- Find Employees From Gmail 

SELECT * FROM Employees
WHERE email LIKE '%@gmail.com';

SELECT * FROM Employees
WHERE CHARINDEX('@gmail.com',email) > 0 ;

-- Standardize Name 

SELECT UPPER(LEFT(employee_name,1)) +
LOWER(SUBSTRING(employee_name,2,LEN(employee_name))) AS Employee_Name
FROM Employees;

-- STRING Function in WHERE 

-- Name Longer than 10 characters 

SELECT * FROM Employees
WHERE LEN(employee_name)>10;

-- Names Starting With R 

SELECT * FROM Employees
WHERE LEFT(employee_name,1) = 'R';

-- Naming Contains "ah"

SELECT * FROM Employees
WHERE employee_name LIKE '%ah%'

-- String Function in Order By 

SELECT employee_name ,
LEN(employee_name) AS Name_Length
FROM Employees
ORDER BY LEN(employee_name) DESC;

-- String Function with Group By

SELECT UPPER(city) AS City ,
COUNT(*) AS Employee_Count
FROM Employees
GROUP BY UPPER(city);

-- String Function in Case 

SELECT employee_name ,

CASE 
    WHEN LEN(employee_name) > 12 
    THEN 'Long Name'

    WHEN LEN(employee_name) >=8 
    THEN 'Medium Name'

    ELSE 'Short Name'

    END Name_Category

FROM Employees;

