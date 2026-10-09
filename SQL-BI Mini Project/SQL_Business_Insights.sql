USE ShoppingTrends;

-- Business Insights 

-- Overall KPIs

SELECT 

    COUNT(*) AS Total_Orders ,
    COUNT(Customer_ID) AS Total_Customers ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount ,
    AVG(Review_Rating) AS Average_Rating

FROM shopping_trends;

-- Age wise analysis 

SELECT

    age ,
    COUNT(*) AS Total_Orders ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount 

FROM shopping_trends
GROUP BY age
ORDER BY age;

-- Category wise analysis 

SELECT

    Category ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount 

FROM shopping_trends
GROUP BY Category
ORDER BY Category;

-- Item wise analysis

SELECT

    Item_Purchased ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount 

FROM shopping_trends
GROUP BY Item_Purchased
ORDER BY Item_Purchased;

-- Location wise analysis 

SELECT

    Location,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Sales_Usd ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount 

FROM shopping_trends
GROUP BY Location
ORDER BY Location;

-- Season wise analysis 

SELECT

    season,
    COUNT(*) AS Total_Orders,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount

FROM shopping_trends
GROUP BY season
ORDER BY Total_Purchase_Amount DESC;

-- Payment method wise analysis 

SELECT

    Payment_Method ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase ,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Amount

FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Total_Purchase DESC;

-- Shipping type wise analysis 

SELECT

    shipping_type,
    COUNT(*) AS Total_Orders,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase_Amount,
    CONCAT('$ ',AVG(Purchase_Amount_USD)) AS Average_Purchase_Amount

FROM shopping_trends
GROUP BY shipping_type
ORDER BY Total_Purchase_Amount DESC;

-- Subscription status analysis

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

-- Top Items

SELECT

    TOP 10
    Item_Purchased ,
    CONCAT('$ ',SUM(Purchase_Amount_USD)) AS Total_Purchase 

FROM shopping_trends
GROUP BY Item_Purchased
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