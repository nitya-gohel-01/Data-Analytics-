-- Data Cleanning and Transform

USE ShoppingTrends;

-- 1. count total rows 

SELECT COUNT(*) AS Total_Records 
FROM shopping_trends;
-- Total records : 3900 rows

-- 2. number of unique customers 

SELECT COUNT(DISTINCT customer_id) AS Unique_Customers
FROM shopping_trends;
-- Total Unique Customers : 3900

-- All are unique customers (3900)

-- 3. check for null value 
-- This query count all null records 

SELECT

    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) 
    AS customer_id_nulls,

    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) 
    AS age_nulls,

    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) 
    AS gender_nulls,

    SUM(CASE WHEN item_purchased IS NULL THEN 1 ELSE 0 END) 
    AS item_purchased_nulls,

    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) 
    AS category_nulls,

    SUM(CASE WHEN purchase_amount IS NULL THEN 1 ELSE 0 END) 
    AS purchase_amount_nulls,

    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) 
    AS location_nulls,

    SUM(CASE WHEN size IS NULL THEN 1 ELSE 0 END) 
    AS size_nulls,

    SUM(CASE WHEN color IS NULL THEN 1 ELSE 0 END) 
    AS color_nulls,

    SUM(CASE WHEN season IS NULL THEN 1 ELSE 0 END) 
    AS season_nulls,

    SUM(CASE WHEN review_rating IS NULL THEN 1 ELSE 0 END) 
    AS review_rating_nulls,

    SUM(CASE WHEN subscription_status IS NULL THEN 1 ELSE 0 END) 
    AS subscription_status_nulls,

    SUM(CASE WHEN shipping_tyoe IS NULL THEN 1 ELSE 0 END) 
    AS shipping_tyoe_nulls,

    SUM(CASE WHEN discount_applied IS NULL THEN 1 ELSE 0 END) 
    AS discount_applied_nulls,

    SUM(CASE WHEN promo_code IS NULL THEN 1 ELSE 0 END) 
    AS promo_code_nulls,

    SUM(CASE WHEN previous_purchase IS NULL THEN 1 ELSE 0 END) 
    AS previous_purchase_nulls,

    SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) 
    AS payment_method_nulls,

    SUM(CASE WHEN frequency_of_purchase IS NULL THEN 1 ELSE 0 END) 
    AS frequency_of_purchase_nulls

FROM Row_Shopping_Trends;

-- Check for extra white space 
-- this query compare actual stored value with trimmed value 
-- if it's not match with each other then it's list those all records

SELECT *
FROM Row_Shopping_Trends
WHERE
    gender != LTRIM(RTRIM(gender))
    OR item_purchased != LTRIM(RTRIM(item_purchased))
    OR category != LTRIM(RTRIM(category))
    OR location != LTRIM(RTRIM(location))
    OR size != LTRIM(RTRIM(size))
    OR color != LTRIM(RTRIM(color))
    OR season != LTRIM(RTRIM(season))
    OR subscription_status != LTRIM(RTRIM(subscription_status))
    OR shipping_tyoe != LTRIM(RTRIM(shipping_tyoe))
    OR discount_applied != LTRIM(RTRIM(discount_applied))
    OR promo_code != LTRIM(RTRIM(promo_code))
    OR payment_method != LTRIM(RTRIM(payment_method))
    OR frequency_of_purchase != LTRIM(RTRIM(frequency_of_purchase));

-- check for age range
-- this query checks age must between 1 to 100 

SELECT *
FROM Row_Shopping_Trends
WHERE age < 1 OR age > 100;

-- check for purchase amount not be 0
-- this query checks for if any records contains purchase amount less than or equal to 0 

SELECT *
FROM Row_Shopping_Trends
WHERE purchase_amount <= 0;

-- check for review rating 
-- this query checks for if any review contains less then 0 

SELECT * 
FROM shopping_trends
WHERE Review_Rating<0;

-- check for gender value 
-- this query list al unique gender value to check which kind of values store within database 

SELECT DISTINCT gender
FROM shopping_trends

-- check for product category
-- this query list all types of category at once

SELECT DISTINCT category
FROM shopping_trends
ORDER BY category;

-- check for season
-- this query list all seasons in which customers purchase the clothes

SELECT DISTINCT season
FROM shopping_trends
ORDER BY season;

-- check for payment method
-- this query list all types of method that used by customers to pay amount

SELECT DISTINCT Payment_Method
FROM shopping_trends
ORDER BY Payment_Method;

-- check for frequency 
-- this query checks for customer purchase bheaviour 

SELECT DISTINCT Frequency_of_Purchases
FROM shopping_trends
ORDER BY Frequency_of_Purchases;

-- standardize text 
-- following queries updates value of gender and make intial letter capital 

UPDATE Row_Shopping_Trends
SET gender =
    CASE
        WHEN gender = 'male'
            THEN 'Male'
        WHEN gender = 'female'
            THEN 'Female'
        ELSE gender
    END;

UPDATE Row_Shopping_Trends
SET
    subscription_status =
        CASE
            WHEN subscription_status = 'yes'
                THEN 'Yes'
            WHEN subscription_status = 'no'
                THEN 'No'
            ELSE subscription_status
        END,

    discount_applied =
        CASE
            WHEN discount_applied = 'yes'
                THEN 'Yes'
            WHEN discount_applied = 'no'
                THEN 'No'
            ELSE discount_applied
        END,

    promo_code =
        CASE
            WHEN promo_code = 'yes'
                THEN 'Yes'
            WHEN promo_code = 'no'
                THEN 'No'
            ELSE promo_code
        END;