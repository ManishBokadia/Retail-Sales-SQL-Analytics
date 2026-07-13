
===============================================================================
                            RETAIL SALES SQL ANALYTICS
===============================================================================

File Name    : 04_Window_Functions.sql
Author       : Manish Bokadia
Database     : Retail Sales

Description:
This SQL script demonstrates the use of SQL Window Functions for advanced
analytics including ranking, cumulative calculations, previous/next row
comparison, and moving averages.

===============================================================================
TABLE OF CONTENTS
===============================================================================

1. ROW_NUMBER()
2. RANK()
3. DENSE_RANK()
4. LAG()
5. LEAD()
6. Running Total

===============================================================================



******************************************************************************
 WINDOW FUNCTION 1
*******************************************************************************

Question:
Assign a unique row number to every product based on sales.

SQL Concepts Used:
• ROW_NUMBER()
• GROUP BY

******************************************************************************/

WITH product_sales AS
(
    SELECT
        product_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY product_name
)

SELECT
    ROW_NUMBER() OVER(ORDER BY total_sales DESC) AS row_num,
    product_name,
    ROUND(total_sales,2) AS total_sales
FROM product_sales;



Business Insight:

ROW_NUMBER assigns a unique sequence to every product.

Useful when selecting Top-N records.



******************************************************************************
 WINDOW FUNCTION 2
*******************************************************************************

Question:
Rank products according to sales.

SQL Concepts Used:
• RANK()

******************************************************************************/

WITH product_sales AS
(
    SELECT
        product_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY product_name
)

SELECT

    product_name,

    ROUND(total_sales,2) total_sales,

    RANK() OVER
    (
        ORDER BY total_sales DESC
    ) product_rank

FROM product_sales;



Business Insight:

RANK skips ranking numbers when ties occur.




******************************************************************************
 WINDOW FUNCTION 3
*******************************************************************************

Question:
Rank products using DENSE_RANK().

SQL Concepts Used:
• DENSE_RANK()

******************************************************************************/

WITH product_sales AS
(
    SELECT
        product_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY product_name
)

SELECT

    product_name,

    ROUND(total_sales,2) total_sales,

    DENSE_RANK() OVER
    (
        ORDER BY total_sales DESC
    ) product_rank

FROM product_sales;



Business Insight:

Unlike RANK(), DENSE_RANK does not skip ranking numbers.




******************************************************************************
 WINDOW FUNCTION 4
*******************************************************************************

Question:
Compare current month's sales with previous month.

SQL Concepts Used:
• LAG()

******************************************************************************/

WITH monthly_sales AS
(
SELECT

YEAR(order_date) order_year,

MONTH(order_date) order_month,

SUM(sales) total_sales

FROM sales

GROUP BY

YEAR(order_date),

MONTH(order_date)

)

SELECT

*,

LAG(total_sales)

OVER(

ORDER BY order_year,order_month

) previous_month_sales

FROM monthly_sales;



Business Insight:

LAG compares current sales with previous month's sales.

Useful for growth analysis.




******************************************************************************
 WINDOW FUNCTION 5
*******************************************************************************

Question:
Compare current month's sales with next month.

SQL Concepts Used:
• LEAD()

******************************************************************************/

WITH monthly_sales AS
(
SELECT

YEAR(order_date) order_year,

MONTH(order_date) order_month,

SUM(sales) total_sales

FROM sales

GROUP BY

YEAR(order_date),

MONTH(order_date)

)

SELECT

*,

LEAD(total_sales)

OVER(

ORDER BY order_year,order_month

) next_month_sales

FROM monthly_sales;



Business Insight:

LEAD helps forecast future performance
by comparing with the next period.




/******************************************************************************
 WINDOW FUNCTION 6
*******************************************************************************

Question:
Calculate cumulative sales over time.

SQL Concepts Used:
• SUM() OVER()

******************************************************************************/

WITH monthly_sales AS
(
SELECT

YEAR(order_date) order_year,

MONTH(order_date) order_month,

SUM(sales) total_sales

FROM sales

GROUP BY

YEAR(order_date),

MONTH(order_date)

)

SELECT

*,

SUM(total_sales)

OVER(

ORDER BY order_year,order_month

) running_total

FROM monthly_sales;

/*

Business Insight:

Running totals are commonly used in executive dashboards
to monitor cumulative business growth.


===============================================================================

END OF FILE

Window Functions Covered

✔ ROW_NUMBER()

✔ RANK()

✔ DENSE_RANK()

✔ LAG()

✔ LEAD()

✔ SUM() OVER()

===============================================================================
