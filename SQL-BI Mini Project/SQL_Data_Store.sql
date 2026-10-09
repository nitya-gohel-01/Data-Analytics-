-- Create Database 

CREATE DATABASE ShoppingTrends;

-- Use Above Database 

USE ShoppingTrends;

SELECT *
FROM shopping_trends;

-- Create Table to store Raw Data 

CREATE TABLE Row_Shopping_Trends
(
	customer_id SMALLINT PRIMARY KEY ,
	age TINYINT NOT NULL ,
	gender VARCHAR(50) NOT NULL ,
	item_purchased VARCHAR(50) NOT NULL ,
	category VARCHAR(50) NOT NULL ,
	purchase_amount TINYINT NOT NULL ,
	location VARCHAR(50) NOT NULL ,
	size VARCHAR(50) NOT NULL ,
	color VARCHAR(50) NOT NULL ,
	season VARCHAR(50) NOT NULL ,
	review_rating VARCHAR(50) NOT NULL ,
	subscription_status VARCHAR(50) NOT NULL ,
	shipping_tyoe VARCHAR(50) NOT NULL ,
	discount_applied VARCHAR(50) NOT NULL ,
	promo_code VARCHAR(50) NOT NULL ,
	previous_purchase VARCHAR(50) NOT NULL ,
	payment_method VARCHAR(50) NOT NULL ,
	frequency_of_purchase VARCHAR(50) NOT NULL 
);

-- Store actual data into row table

INSERT INTO Row_Shopping_Trends
(
    customer_id,
    age,
    gender,
    item_purchased,
    category,
    purchase_amount,
    location,
    size,
    color,
    season,
    review_rating,
    subscription_status,
    shipping_tyoe,
    discount_applied,
    promo_code,
    previous_purchase,
    payment_method,
    frequency_of_purchase
)
SELECT
    Customer_ID,
    Age,
    Gender,
    Item_Purchased,
    Category,
    Purchase_Amount_USD,
    Location,
    Size,
    Color,
    Season,
    Review_Rating,
    Subscription_Status,
    Shipping_Type,
    Discount_Applied,
    Promo_Code_Used,
    Previous_Purchases,
    Payment_Method,
    Frequency_of_Purchases
FROM shopping_trends;

-- check whether data stored successfully 

SELECT *
FROM Row_Shopping_Trends;