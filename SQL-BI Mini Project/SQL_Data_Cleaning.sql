-- Data Cleanning and Transform

USE ShoppingTrends;

-- 1. count total rows 

SELECT COUNT(*) AS Total_Records 
FROM shopping_trends;

-- 3900

-- 2. number of unique customers 

SELECT COUNT(DISTINCT customer_id) AS Unique_Customers
FROM shopping_trends;

-- All are unique customers (3900)

-- 3. check for null value 

/*
    not need to write query because we already mark not null when data inserted from csv
    still we write query for practice 
*/

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

SELECT *
FROM Row_Shopping_Trends
WHERE age < 18 OR age > 100;

-- check for purchase amount not be 0

SELECT *
FROM Row_Shopping_Trends
WHERE purchase_amount <= 0;

-- check for review rating 

SELECT * 
FROM shopping_trends
WHERE Review_Rating<0;

-- check for gender value 

SELECT DISTINCT gender
FROM shopping_trends

-- check for product category

SELECT DISTINCT category
FROM shopping_trends
ORDER BY category;

-- check for size 

SELECT DISTINCT size
FROM shopping_trends
ORDER BY size;

-- check for season

SELECT DISTINCT season
FROM shopping_trends
ORDER BY season;

-- check for payment method 

SELECT DISTINCT Payment_Method
FROM shopping_trends
ORDER BY Payment_Method;

-- check for shipping type

SELECT DISTINCT shipping_Type
FROM shopping_trends
ORDER BY Shipping_Type;

-- check for frequency 

SELECT DISTINCT Frequency_of_Purchases
FROM shopping_trends
ORDER BY Frequency_of_Purchases;

-- standardize text 

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