CREATE DATABASE SuperStore;

USE SuperStore;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'super_store_sales';

SELECT * FROM super_store_sales
ORDER BY Profit DESC;

-- Self Queries 

SELECT Order_ID ,
COUNT(Order_ID) AS No_Of_Occurance
FROM super_store_sales
GROUP BY Order_ID 
HAVING COUNT(Order_Id)>1;

SELECT Customer_ID , COUNT(Customer_ID)
FROM super_store_sales
GROUP BY Customer_ID
HAVING COUNT(Customer_ID)>1;

-- FIND NULL PROFIT 

SELECT *
FROM super_store_sales
WHERE Profit IS NULL;

-- UNIQUE Customers 

SELECT COUNT(DISTINCT Customer_ID) AS No_Of_Unique_Customer
FROM super_store_sales; -- 804

-- Country Region Wise Sales & Profit Anlaysis 

SELECT Country_Region ,City , Region ,
SUM(Sales) AS Total_Sales ,
SUM(Profit) AS Total_Profit
FROM super_store_sales
GROUP BY Country_Region , City , Region
ORDER BY Country_Region , City;

SELECT Country_Region , Region ,
SUM(Sales) AS Total_Sales ,
SUM(Profit) AS Total_Profit 
FROM super_store_sales
GROUP BY Country_Region , Region
ORDER BY Country_Region ;

SELECT City ,
SUM(Sales) AS Total_Sales ,
SUM(Profit) AS Total_Profit 
FROM super_store_sales
GROUP BY City
ORDER BY City ;

-- Top 1 city profit wise 

SELECT TOP 5 City , SUM(Profit) AS Total_Profit 
FROM super_store_sales
GROUP BY City;

-- CLASS TASK :-

-- LEVEL 1 Basic SELECT & Filtering

-- 1.

SELECT * FROM super_store_sales;

-- 2.

SELECT Order_ID , Order_Date , Customer_Name ,
Category , Sales , Profit
FROM super_store_sales;

-- 3.

SELECT * FROM super_store_sales
WHERE Sales > 500;

-- 4.

SELECT * FROM super_store_sales
WHERE Profit< 0;

-- 5.

SELECT * FROM super_store_sales
WHERE Segment='Consumer';

-- 6.

SELECT * FROM super_store_sales
WHERE Category='Technology';

-- 7.

SELECT * FROM super_store_sales
WHERE Discount>0.20;

-- 8.

SELECT * FROM super_store_sales
WHERE Ship_Mode='First Class';

-- 9.

SELECT * FROM super_store_sales
WHERE Region='West';

-- 10.

SELECT Product_ID , Product_Name 
FROM super_store_sales
WHERE Product_Name LIKE '%Chair%';

-- LEVEL 2 Sorting & DISTINCT

-- 11.

SELECT TOP 20 *
FROM super_store_sales
WHERE Profit>0
ORDER BY Sales DESC;

-- 12.

SELECT TOP 20 *
FROM super_store_sales
WHERE Profit<0
ORDER BY Profit;

-- 13.

SELECT DISTINCT Category , Sub_Category, Segment , Region
FROM super_store_sales;

-- 14.

SELECT Product_ID , Product_Name
FROM super_store_sales
ORDER BY Sales DESC;

-- 15.

SELECT Product_ID , Product_Name
FROM super_store_sales
ORDER BY Profit ;

-- 16.

SELECT DISTINCT Customer_ID , Customer_Name
FROM super_store_sales
ORDER BY Customer_Name;

-- 17.

SELECT TOP 1 * FROM super_store_sales
WHERE Discount>0
ORDER BY Discount;

-- 18.

SELECT DISTINCT TOP 10 * FROM super_store_sales
ORDER BY Sales DESC;

-- LEVEL 3 Aggregate Functions

-- 19.

SELECT SUM(Sales) AS Total_Sales
FROM super_store_sales;

-- 20.

SELECT SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit>0;

-- 21.

SELECT AVG(Profit) AS Average_Profit
FROM super_store_sales
WHERE Profit>0;

-- 22.

SELECT 
MIN(Sales) AS Minimum_Sale ,
MAX(Sales) AS Maximum_Sales
FROM super_store_sales;

-- 23.

SELECT 
MIN(Sales) AS Minimum_Sale ,
MAX(Sales) AS Maximum_Sales
FROM super_store_sales;

-- 24.

SELECT 
MIN(Profit) AS Minimum_Sale ,
MAX(Profit) AS Maximum_Sales
FROM super_store_sales

-- 26.

SELECT COUNT(DISTINCT Customer_ID) AS Number_Of_Customers
FROM super_store_sales;

-- 27.

SELECT COUNT(DISTINCT Product_ID) AS Number_Of_Products
FROM super_store_sales;

-- 28.

SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM super_store_sales;

-- LEVEL 4 GROUP BY 

-- 29.

SELECT Category , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Category;

-- 30.

SELECT Category , SUM(Sales) AS Total_Profit
FROM super_store_sales
GROUP BY Category;

-- 31.

SELECT Category , AVG(Sales) AS Average_Sales
FROM super_store_sales
GROUP BY Category;

-- 32.

SELECT Sub_Category , SUM(Sales) AS Total_Sales 
FROM super_store_sales
GROUP BY Sub_Category;

-- 33.

SELECT Sub_Category , SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit>0
GROUP BY Sub_Category;

-- 34.

SELECT  Region , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Region;

-- 35.

SELECT Region , SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit>0
GROUP BY Region;

-- 36.

SELECT Segment , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Segment ;

-- 37.

SELECT Category , SUM(Quantity) AS Total_Quantity
FROM super_store_sales
GROUP BY Category;

-- 38.

SELECT Ship_Mode , COUNT(Order_ID) AS Number_Of_Orders
FROM super_store_sales
GROUP BY Ship_Mode;

-- 39.

SELECT Segment, COUNT(DISTINCT Customer_ID) AS Number_Of_Orders
FROM super_store_sales
GROUP BY Segment;

-- 40.

SELECT State_Province , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY State_Province;

-- LEVEL 5 HAVING

-- 41.

SELECT Category , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Category
HAVING SUM(Sales) > 100000;

-- 42.

SELECT Sub_Category , SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit>0
GROUP BY Sub_Category
HAVING SUM(Profit)>10000;

-- 43.

SELECT Customer_Id , Customer_Name , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Customer_ID , Customer_Name 
HAVING SUM(Sales) > 5000;

-- 44.

SELECT State_Province , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY State_Province
HAVING SUM(Sales) > 50000;

-- 45.

SELECT Product_Name , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Product_Name
HAVING SUM(Sales) > 10000;

-- 46.

SELECT	Category , AVG(Discount) AS Average_Discount
FROM super_store_sales
GROUP BY Category
HAVING AVG(Discount) > 0.20;

-- 47.

SELECT DISTINCT Customer_ID , COUNT(Order_ID) AS Total_Orders
FROM super_store_sales
GROUP BY Customer_ID 
HAVING COUNT(Order_ID) > 10;

-- 48.

SELECT Sub_Category , SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit<0
GROUP BY Sub_Category;

-- Level 6 — CASE

-- 49.

SELECT * ,
	CASE 
		WHEN Profit > 0 
		THEN 'Profitable'
	
		WHEN Profit < 0
		THEN 'Loss'

		WHEN Profit = 0
		THEN 'No Profit'
	END AS Profit_Status
FROM super_store_sales;

-- 50.

SELECT * ,
	CASE 
		WHEN Sales < 100
		THEN 'Low'

		WHEN Sales BETWEEN 100 AND 500
		THEN 'Medium'

		WHEN Sales BETWEEN 501 AND 1000
		THEN 'High'

		WHEN Sales > 10000
		THEN 'Very High'
	END AS Profit_Status
FROM super_store_sales;

-- 51.

SELECT Order_Id , Discount ,
	CASE
		WHEN Discount<0
		THEN 'No Discount'

		WHEN Discount BETWEEN 0 AND 0.10 
		THEN 'Low'

		WHEN Discount BETWEEN 0.10 AND 0.30 
		THEN 'Medium'

		ELSE 
		'High'
	END AS Discount_Category
FROM super_store_sales;

-- 52.

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN SUM(Sales) < 100000 
		THEN 'Low'
        WHEN SUM(Sales) <= 200000 
		THEN 'Medium'
        WHEN SUM(Sales) <= 300000 
		THEN 'High'
        ELSE 'Very High'
    END AS Sales_Category
FROM super_store_sales
GROUP BY Category;

-- LEVEL 7 Multiple Conditions

-- 53.

SELECT DISTINCT Customer_ID , Customer_Name , Region
FROM super_store_sales
WHERE Segment='Consumer' AND Region='West';

-- 54.

SELECT Product_ID , Product_Name , Sales
FROM super_store_sales
WHERE Category='Technology' AND Sales>1000;

-- 55.

SELECT Order_ID , Product_Name , Sales
FROM super_store_sales
WHERE Sales>500 AND Profit > 100 AND Discount<0.20;

-- 56.

SELECT Order_ID , Product_Name , Category , Sales , Profit
FROM super_store_sales
WHERE Category='Furniture' AND Profit<0;

-- 57.

SELECT Customer_ID , Customer_Name , Segment , Product_Name , Category
FROM super_store_sales
WHERE Segment='Corporate' AND Category='Technology' ;

-- 58.

SELECT Order_ID , Region , Discount , Sales , Profit
FROM super_store_sales
WHERE Region='East' AND Discount>0.30;

-- LEVEL 8 Date Analysis

-- 59.

SELECT MIN(Order_Date) AS Erarliest_Date
FROM super_store_sales;

-- 60.

SELECT MAX(Order_Date) AS Latest_Date
FROM super_store_sales;

-- 61.

SELECT 
	YEAR(Order_Date) AS Order_Year,
	SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;

-- 62.

SELECT
	YEAR(Order_Date) AS Order_Year ,
	SUM(Profit) AS Total_Profit 
FROM super_store_sales
WHERE Profit>0
GROUP BY YEAR(Order_Date)
ORDER BY YEAR(Order_Date);

-- 63.

SELECT
	MONTH(Order_Date) AS Month_Number ,
	DATENAME(MONTH,Order_Date) AS Month_Name,
	SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY MONTH(Order_Date) , 
		 DATENAME(MONTH,Order_Date) 
ORDER BY Month_Number;

-- 64.

SELECT 
	YEAR(Order_Date) AS Order_Year ,
	COUNT(Order_ID) AS Total_Orders
FROM super_store_sales
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;

-- 65.

SELECT
	YEAR(Order_Date) AS Order_Year ,
	Category ,
	SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY YEAR(Order_Date) , Category
ORDER BY YEAR(Order_Date) , Category;

-- 66.

SELECT TOP 1
	YEAR(Order_Date) AS Order_Year ,
	SUM(Sales) AS Total_Sales 
FROM super_store_sales
GROUP BY YEAR(Order_Date)
ORDER BY Total_Sales DESC;

-- 67.

SELECT TOP 1
	MONTH(Order_Date) AS Month_Number ,
	DATENAME(MONTH,Order_Date) AS Month_name ,
	SUM(Sales) AS Total_Sales 
FROM super_store_sales
GROUP BY MONTH(Order_Date) , 
	     DATENAME(MONTH,Order_Date)
ORDER BY Total_Sales DESC;

-- 68.

SELECT * 
FROM super_store_sales 
WHERE DATEDIFF(DAY,Order_Date,Ship_Date)>5;

-- LEVEL 9 SubQueries

-- 69. DOUBT

SELECT Product_Name , 
	   SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Product_Name 
HAVING SUM(Sales) > (SELECT AVG(Sales) 
FROM super_store_sales);

-- 70.

-- LEVEL 10 Advanced SQL

-- LEVEL 11 Windows Function 

-- Final Challenge 

-- 1.

SELECT TOP 1
Category , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 2.

SELECT TOP 1
Category , SUM(Profit) AS Total_Profit
FROM super_store_sales
GROUP BY Category
ORDER BY Total_Profit DESC ;

-- 3.

SELECT TOP 1
Sub_Category , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- 4.

SELECT TOP 1
Sub_Category , SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit>0
GROUP BY Sub_Category
ORDER BY Total_Profit;

-- 5.

SELECT TOP 1
Customer_ID , Customer_Name , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Customer_ID , Customer_Name
ORDER BY Total_Sales DESC;

-- 6.

SELECT TOP 1
Region , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 8.

SELECT TOP 1
Segment , SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 9.

SELECT Product_ID , Product_Name , 
SUM(Profit) AS Loss
FROM super_store_sales
WHERE Profit<0
GROUP BY Product_ID , Product_Name;

-- 10.

SELECT Customer_ID , Customer_Name , 
SUM(Profit) AS Loss
FROM super_store_sales
WHERE Profit<0
GROUP BY Customer_ID , Customer_Name;

-- 11.

-- 12.

SELECT TOP 5
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

-- 14.

SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM super_store_sales
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;

-- 15.

SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Profit) AS Total_Profit
FROM super_store_sales
WHERE Profit>0
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;