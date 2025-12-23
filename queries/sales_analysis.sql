
-- SALES ANALYSIS QUERIES


-- 1. OVERVIEW & SUMMARY
-- 1.1 Total Sales Overview
SELECT 
    COUNT(DISTINCT ORDER_ID) AS total_orders,
    SUM(ORDER_GRANDTOTAL) AS total_revenue,
    AVG(ORDER_GRANDTOTAL) AS average_order_value,
    MIN(ORDER_GRANDTOTAL) AS min_order,
    MAX(ORDER_GRANDTOTAL) AS max_order
FROM ORDERS;

-- 1.2 Monthly Sales Trend
SELECT 
    YEAR(ORDER_DATE) AS year,
    MONTH(ORDER_DATE) AS month,
    COUNT(*) AS total_orders,
    SUM(ORDER_GRANDTOTAL) AS monthly_revenue,
    AVG(ORDER_GRANDTOTAL) AS avg_order_value
FROM ORDERS
GROUP BY YEAR(ORDER_DATE), MONTH(ORDER_DATE)
ORDER BY year, month;



-- 2. BRANCH PERFORMANCE
-- 2.1 Sales by Branch
SELECT 
    b.BRANCH_ID,
    b.BRANCH_NAME,
    b.BRANCH_CITY,
    COUNT(o.ORDER_ID) AS total_orders,
    SUM(o.ORDER_GRANDTOTAL) AS total_revenue,
    AVG(o.ORDER_GRANDTOTAL) AS avg_order_value,
    RANK() OVER (ORDER BY SUM(o.ORDER_GRANDTOTAL) DESC) AS revenue_rank
FROM BRANCH b
LEFT JOIN ORDERS o ON b.BRANCH_ID = o.BRANCH_ID
GROUP BY b.BRANCH_ID, b.BRANCH_NAME, b.BRANCH_CITY
ORDER BY revenue_rank ASC;

-- 2.2 Branch Monthly Comparison
SELECT 
    b.BRANCH_NAME,
    MONTH(o.ORDER_DATE) AS month,
    SUM(o.ORDER_GRANDTOTAL) AS monthly_revenue
FROM BRANCH b
JOIN ORDERS o ON b.BRANCH_ID = o.BRANCH_ID
WHERE YEAR(o.ORDER_DATE) = 2024
GROUP BY b.BRANCH_ID, b.BRANCH_NAME, MONTH(o.ORDER_DATE)
ORDER BY b.BRANCH_NAME, month;

-- 2.3 Branch Performance vs Budget
SELECT 
    b.BRANCH_NAME,
    m.BRANCH_BUDGET,
    SUM(o.ORDER_GRANDTOTAL) AS total_sales,
    SUM(o.ORDER_GRANDTOTAL) - m.BRANCH_BUDGET AS variance
FROM BRANCH b
JOIN MANAGER m ON b.BRANCH_ID = (
    SELECT e.BRANCH_ID FROM EMPLOYEE e WHERE e.EMPLOYEE_ID = m.EMPLOYEE_ID
)
JOIN EMPLOYEE e ON m.EMPLOYEE_ID = e.EMPLOYEE_ID
LEFT JOIN ORDERS o ON b.BRANCH_ID = o.BRANCH_ID
GROUP BY b.BRANCH_ID, b.BRANCH_NAME, m.BRANCH_BUDGET;


-- 3. PRODUCT PERFORMANCE
-- 3.1 Best Selling Books (by Quantity)
SELECT 
    bk.BOOK_ID,
    bk.BOOK_TITLE,
    a.AUTHOR_PENNAME AS author,
    SUM(oi.QUANTITY) AS total_quantity_sold,
    SUM(oi.QUANTITY * oi.PRICE) AS total_revenue,
    COUNT(DISTINCT oi.ORDER_ID) AS number_of_orders
FROM BOOK bk
JOIN ORDER_ITEM oi ON bk.BOOK_ID = oi.BOOK_ID
JOIN BOOK_AUTHOR ba ON bk.BOOK_ID = ba.BOOK_ID
JOIN AUTHOR a ON ba.AUTHOR_ID = a.AUTHOR_ID
GROUP BY bk.BOOK_ID, bk.BOOK_TITLE, a.AUTHOR_PENNAME
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- 3.2 Best Selling Books (by Revenue)
SELECT 
    bk.BOOK_ID,
    bk.BOOK_TITLE,
    bk.BOOK_PRICE AS list_price,
    SUM(oi.QUANTITY) AS total_sold,
    SUM(oi.QUANTITY * oi.PRICE) AS total_revenue
FROM BOOK bk
JOIN ORDER_ITEM oi ON bk.BOOK_ID = oi.BOOK_ID
GROUP BY bk.BOOK_ID, bk.BOOK_TITLE, bk.BOOK_PRICE
ORDER BY total_revenue DESC
LIMIT 10;

-- 3.3 Sales by Genre
SELECT 
    g.NAME AS genre_name,
    COUNT(DISTINCT oi.ORDER_ID) AS number_of_orders,
    SUM(oi.QUANTITY) AS total_quantity_sold,
    SUM(oi.QUANTITY * oi.PRICE) AS total_revenue
FROM GENRE g
JOIN BOOK_GENRE bg ON g.GENRE_ID = bg.GENRE_ID
JOIN BOOK bk ON bg.BOOK_ID = bk.BOOK_ID
JOIN ORDER_ITEM oi ON bk.BOOK_ID = oi.BOOK_ID
GROUP BY g.GENRE_ID, g.NAME
ORDER BY total_revenue DESC;

-- 3.4 Sales by Author
SELECT 
    a.AUTHOR_ID,
    a.AUTHOR_PENNAME,
    COUNT(DISTINCT bk.BOOK_ID) AS books_count,
    SUM(oi.QUANTITY) AS total_sold,
    SUM(oi.QUANTITY * oi.PRICE) AS total_revenue
FROM AUTHOR a
JOIN BOOK_AUTHOR ba ON a.AUTHOR_ID = ba.AUTHOR_ID
JOIN BOOK bk ON ba.BOOK_ID = bk.BOOK_ID
JOIN ORDER_ITEM oi ON bk.BOOK_ID = oi.BOOK_ID
GROUP BY a.AUTHOR_ID, a.AUTHOR_PENNAME
ORDER BY total_revenue DESC;

-- 3.5 Sales by Publisher
SELECT 
    p.PBS_ID,
    p.PBS_NAME,
    COUNT(DISTINCT bk.BOOK_ID) AS books_in_catalog,
    SUM(oi.QUANTITY) AS total_sold,
    SUM(oi.QUANTITY * oi.PRICE) AS total_revenue
FROM PUBLISHER p
JOIN BOOK bk ON p.PBS_ID = bk.PBS_ID
JOIN ORDER_ITEM oi ON bk.BOOK_ID = oi.BOOK_ID
GROUP BY p.PBS_ID, p.PBS_NAME
ORDER BY total_revenue DESC;


-- 4. SELLER PERFORMANCE
-- 4.1 Sales by Seller (Employee in Seller role)
SELECT 
    e.EMPLOYEE_ID,
    CONCAT(e.EMP_FNAME, ' ', e.EMP_LNAME) AS seller_name,
    b.BRANCH_NAME,
    s.TIPS AS total_tips,
    e.EMP_SALARY,
    s.TIPS + e.EMP_SALARY AS total_compensation
FROM SELLER s
JOIN EMPLOYEE e ON s.EMPLOYEE_ID = e.EMPLOYEE_ID
JOIN BRANCH b ON e.BRANCH_ID = b.BRANCH_ID
ORDER BY s.TIPS DESC;

-- 4.2 Branch Staff Count vs Sales
SELECT 
    b.BRANCH_NAME,
    COUNT(DISTINCT e.EMPLOYEE_ID) AS staff_count,
    SUM(o.ORDER_GRANDTOTAL) AS total_sales,
    ROUND(SUM(o.ORDER_GRANDTOTAL) / COUNT(DISTINCT e.EMPLOYEE_ID), 2) AS sales_per_staff
FROM BRANCH b
LEFT JOIN EMPLOYEE e ON b.BRANCH_ID = e.BRANCH_ID
LEFT JOIN ORDERS o ON b.BRANCH_ID = o.BRANCH_ID
GROUP BY b.BRANCH_ID, b.BRANCH_NAME
ORDER BY sales_per_staff DESC;


-- 5. SALES BY TIME
-- 5.1 Sales by Day of Week
SELECT 
    DAYNAME(ORDER_DATE) AS day_of_week,
    DAYOFWEEK(ORDER_DATE) AS day_number,
    COUNT(*) AS total_orders,
    SUM(ORDER_GRANDTOTAL) AS total_revenue,
    AVG(ORDER_GRANDTOTAL) AS avg_order_value
FROM ORDERS
GROUP BY DAYNAME(ORDER_DATE), DAYOFWEEK(ORDER_DATE)
ORDER BY day_number;

-- 5.2 Quarterly Sales Summary
SELECT 
    YEAR(ORDER_DATE) AS year,
    QUARTER(ORDER_DATE) AS quarter,
    COUNT(*) AS total_orders,
    SUM(ORDER_GRANDTOTAL) AS quarterly_revenue,
    AVG(ORDER_GRANDTOTAL) AS avg_order_value
FROM ORDERS
GROUP BY YEAR(ORDER_DATE), QUARTER(ORDER_DATE)
ORDER BY year, quarter;



-- 6. SALES BT PROMOTION
-- 6.1 Sales During Promotion Periods
SELECT 
    p.PRO_NAME,
    p.PRO_DISCOUNTRATE,
    b.BRANCH_NAME,
    p.PRO_START_DATE,
    p.PRO_END_DATE,
    COUNT(o.ORDER_ID) AS orders_during_promo,
    SUM(o.ORDER_GRANDTOTAL) AS revenue_during_promo
FROM PROMOTION p
LEFT JOIN BRANCH b ON p.BRANCH_ID = b.BRANCH_ID
LEFT JOIN ORDERS o ON (
    o.BRANCH_ID = p.BRANCH_ID OR p.BRANCH_ID IS NULL
) AND o.ORDER_DATE BETWEEN p.PRO_START_DATE AND p.PRO_END_DATE
GROUP BY p.PRO_ID, p.PRO_NAME, p.PRO_DISCOUNTRATE, b.BRANCH_NAME, p.PRO_START_DATE, p.PRO_END_DATE
ORDER BY revenue_during_promo DESC;



-- 7. RECEIPT & TAX ANALYSIS
-- 7.1 Tax Summary by Branch
SELECT 
    b.BRANCH_NAME,
    COUNT(r.RC_NO) AS receipt_count,
    SUM(r.RC_TAX_AMOUNT) AS total_tax,
    SUM(r.RC_VAT_AMOUNT) AS total_vat,
    SUM(r.RC_GRANDTOTAL) AS total_revenue
FROM RECEIPT r
JOIN BRANCH b ON r.BRANCH_ID = b.BRANCH_ID
GROUP BY b.BRANCH_ID, b.BRANCH_NAME
ORDER BY total_revenue DESC;

-- 7.2 Monthly Tax Report
SELECT 
    YEAR(RC_DATE) AS year,
    MONTH(RC_DATE) AS month,
    COUNT(*) AS receipts_issued,
    SUM(RC_TAX_AMOUNT) AS total_tax,
    SUM(RC_VAT_AMOUNT) AS total_vat,
    SUM(RC_GRANDTOTAL) AS total_revenue
FROM RECEIPT
GROUP BY YEAR(RC_DATE), MONTH(RC_DATE)
ORDER BY year, month;