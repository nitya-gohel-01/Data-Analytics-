# Shopping Trends Analysis Dashboard

An end-to-end data analytics project using **SQL Server** and **Power
BI** to explore shopping trends, customer purchasing behaviour, product
performance, payment preferences, and seasonal sales.

## Dashboard Preview

> Add your dashboard screenshot to the repository at
> `assets/shopping-trends-dashboard.png` to display it here.

(![Shopping Trends Analysis Dashboard](./Screenshot%202026-10-09%20201114.png))

## Project Overview

This project analyses a shopping trends dataset containing **3,900
customer purchase records**. SQL Server was used to store the raw data,
perform data-quality checks and standardisation, and answer business
questions. The prepared data was then connected to Power BI to build an
interactive, single-page dashboard.

## Tools & Technologies

-   **SQL Server** --- data storage, data-quality checks, cleaning,
    transformation, and business analysis
-   **Power BI Desktop** --- dashboard design, KPI cards, charts,
    slicers, and data formatting
-   **CSV** --- source dataset

## Dataset

The dataset includes customer and purchase attributes such as:

-   Customer ID, age, and gender
-   Purchased item and product category
-   Purchase amount (USD) and review rating
-   Location, size, colour, and season
-   Subscription status, discount applied, and promo code
-   Shipping type, payment method, previous purchases, and purchase
    frequency

**Record count:** 3,900\
**Analysis focus:** sales performance, customer segments, product
categories, payment methods, and seasonal trends.

## Project Workflow

1.  **Load the source data** into SQL Server.
2.  **Create a raw data table** to store the imported records.
3.  **Check data quality** by examining nulls, duplicate/customer IDs,
    whitespace, valid age ranges, purchase amounts, ratings, and
    distinct category values.
4.  **Clean and standardise data** by trimming text where required and
    standardising values such as gender, subscription status, discount
    usage, and promo-code usage.
5.  **Run SQL business analysis** to compare sales and purchasing
    patterns across customer and transaction attributes.
6.  **Connect the prepared data to Power BI** and configure currency and
    rating formats.
7.  **Build an interactive dashboard** with KPI cards, charts, and
    slicers.

## SQL Analysis

The SQL scripts cover the following checks and business questions:

-   Overall KPIs: total sales, average purchase amount,
    customers/orders, and average rating
-   Age-wise purchase amount and order analysis
-   Sales by product category and individual item
-   Location-wise sales
-   Seasonal sales and order comparison
-   Payment-method and shipping-type analysis
-   Subscription-status comparison
-   Top-performing category and items by sales
-   Highest-rated items
-   Gender-wise purchase and rating analysis

## Power BI Dashboard

The single-page dashboard includes KPI cards for:

-   **Total Sales (USD)**
-   **Average Purchase (USD)**
-   **Total Customers**
-   **Total Orders**
-   **Average Rating**

Visuals include:

-   Purchase amount by category
-   Customers by subscription status
-   Purchase amount by gender
-   Purchase amount by payment method
-   Purchase amount by season
-   Purchase amount by age
-   Top items by purchase amount
-   Top locations by purchase amount

Interactive slicers allow users to filter the report by **Gender,
Season, Discount Applied, Category, Location, and Subscription Status**.

## Key Findings

Based on the current dashboard view:

-   Total sales are approximately **\$233K**.
-   Average purchase amount is approximately **\$59.76**.
-   The average review rating is **3.75**.
-   **Clothing** is the leading category by purchase amount at
    approximately **\$104K**, followed by Accessories at approximately
    **\$74K**.
-   Customers without a subscription account for **2,847** records,
    compared with **1,053** for subscribed customers.
-   **Fall** has the highest seasonal purchase amount in the displayed
    view at approximately **\$60.0K**.
-   The dashboard compares purchasing patterns across gender, payment
    method, age, item, and location.

*Dashboard figures are rounded as displayed in Power BI and may change
when slicers are applied.*

## Repository Structure

``` text
Shopping-Trends-Analysis/
├── assets/
│   └── shopping-trends-dashboard.png
├── shopping_trends_updated(2).csv
├── SQL_Data_Store.sql
├── SQL_Data_Cleaning.sql
├── SQL_Business_Insights.sql
├── Insight_Dashboard.pbix
└── README.md
```

## How to Use

1.  Download or clone this repository.
2.  Open SQL Server Management Studio (SSMS).
3.  Import the source CSV into SQL Server and adjust the source
    table/database names if needed.
4.  Run `SQL_Data_Store.sql`, then review and execute the cleaning steps
    in `SQL_Data_Cleaning.sql`.
5.  Run `SQL_Business_Insights.sql` to explore the business questions.
6.  Open `Insight_Dashboard.pbix` in Power BI Desktop.
7.  If prompted, update the data source connection to your local SQL
    Server/database and refresh the report.
8.  Add the dashboard screenshot to the `assets` folder using the
    filename shown above.

## Skills Demonstrated

-   SQL querying, aggregation, grouping, and data-quality checks
-   Data cleaning and standardisation
-   Business-oriented exploratory analysis
-   KPI reporting and data visualisation
-   Power BI dashboard design and interactive filtering
-   Communicating findings from data

------------------------------------------------------------------------

**Project:** Shopping Trends Analysis\
**Tools:** SQL Server \| Power BI \| CSV
