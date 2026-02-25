#NULL VALUE FUNCTIONS 
-- 1. Replace NULL price with 0
select nvl (unit_price, 0) As price
from orders;

-- 2. Replace NULL Customer_Name with 'Unknown'.
select customer_name,coalesce(customer_name , 'unknown') from orders;

-- 3. Count NULL values in Product_Name.
select count (*) from orders where product_name is null;

-- 4. Find rows where Order_Date is NULL
select count (*) from orders where order_date is null;

-- 5. Use COALESCE to return first non-null value
select customer_name ,coalesce (customer_name ,'not null')from orders; 

-- 6. Use NVL to replace NULL values
select nvl (unit_price,0)from orders;

-- 7. Use IFNULL function


-- 8. Check if column is NULL
select * from orders where product_name is null;

-- 9. Check if column is NOT NULL.
select * from orders where product_category is null;

-- 10. Use NULLIF between two columns.
SELECT NULLIF(PRODUCT_NAME, PRODUCT_CATEGORY) FROM orders;

-- 12. Count non-null values.
SELECT COUNT(Product_Name) FROM ORDERS WHERE Product_Name IS NOT NULL;

-- 13. Filter records where price is NULL or 0
SELECT COUNT(UNIT_PRICE) FROM ORDERS WHERE UNIT_PRICE IS NULL OR 0;

-- 14. Use CASE to handle NULL values.
SELECT ORDER_ID,CASE WHEN PRODUCT_NAME IS NULL THEN 'No Product Assigned' ELSE PRODUCT_NAME END AS PRODUCT_DISPLAY FROM ORDERS;

-- 15. Compare NULL values properly.
SELECT * FROM ORDERS WHERE PRODUCT_NAME IS NULL;

-- 16. Handle NULL in aggregation.

-- 17. Find average excluding NULL values.
SELECT AVG(unit_price) AS average_price FROM ORDERS;

-- 18. Find sum ignoring NULL values.
SELECT SUM(unit_price) AS SUM_PRICE FROM ORDERS;

-- 19. Identify columns containing NULL using metadata.
SELECT 'SELECT ''' || column_name || ''' AS column_name, COUNT(*) AS null_count FROM orders WHERE ' || column_name || ' IS NULL;'
FROM user_tab_columns
WHERE table_name = 'ORDERS';

-- 20. Convert NULL to default system date.
SELECT NVL(order_date, SYSDATE) FROM orders;