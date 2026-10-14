USE ShoppingTrends;

-- Business Insights 

-- Overall KPIs

-- this queries calculates 
-- total number of orders   : 3900
-- total number of customer : 3900
-- average purchase amount  : $ 59
-- total purchase amount    : $ 233081
-- average review ratings   : 3.75

SELECT 

    COUNT(*) AS Total_Orders ,
    COUNT(Customer_ID) AS Total_Customers ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount ,
    ROUND(AVG(Review_Rating),2) AS Average_Rating 

FROM shopping_trends;

-- Age wise analysis 
-- which age group order most 

SELECT

    age ,
    COUNT(*) AS Total_Orders ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount 

FROM shopping_trends
GROUP BY age
ORDER BY Total_Orders DESC;

-- Category wise analysis 
-- this query ranks category based on the purchase amount
-- Here , No 1 Category is - Outwear

SELECT

    Category ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount ,
    DENSE_RANK() OVER
    (
        ORDER BY SUM(Purchase_Amount_USD)
    )
    AS Rank_No

FROM shopping_trends
GROUP BY Category
ORDER BY Rank_No;

-- Item wise analysis
-- this queries helps to list top 10 items which purchase most by the customers
-- here , jeans secured the first rank

SELECT
    TOP 10
    Item_Purchased ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount ,
    DENSE_RANK() OVER
    (
        ORDER BY SUM(Purchase_Amount_USD)
    ) AS Item_Rank

FROM shopping_trends
GROUP BY Item_Purchased
ORDER BY Item_Rank;

-- Location wise analysis 
-- this query analysis location wise sales

SELECT

    Location,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount 

FROM shopping_trends
GROUP BY Location
ORDER BY Total_Sales_Usd DESC;

-- Season wise analysis 
-- this query shows which season have highest sales

SELECT

    season,
    COUNT(*) AS Total_Orders,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount

FROM shopping_trends
GROUP BY season
ORDER BY Total_Purchase_Amount DESC;

-- Payment method wise analysis 
-- this query analysis which payment method mostly used by the customers

SELECT

    Payment_Method ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Amount

FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Total_Purchase DESC;

-- Subscription status analysis
-- this query shows that how many customers have subscriptions

SELECT

    subscription_status,
    COUNT(*) AS Total_Customers,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount

FROM shopping_trends
GROUP BY subscription_status
ORDER BY Total_Purchase_Amount DESC;

-- Top Category 

SELECT

    TOP 1
    Category ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase 

FROM shopping_trends
GROUP BY Category
ORDER BY Total_Purchase DESC;

-- Highest Rated Items 

SELECT

    TOP 10
    Item_Purchased ,
    COUNT(Review_Rating) AS No_Of_Review ,
    AVG(Review_Rating) AS Average_Rating

FROM shopping_trends
GROUP BY Item_Purchased
ORDER BY Average_Rating DESC;

-- Gender wise analysis 

SELECT

    gender,
    COUNT(*) AS Total_Orders,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount,
    AVG(review_rating) AS Average_Rating

FROM shopping_trends
GROUP BY gender
ORDER BY Total_Purchase_Amount DESC;