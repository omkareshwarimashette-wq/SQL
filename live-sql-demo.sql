select * from orders;
--write a query to convert all customer names to uppercase
select upper(Customer_Name)as upper_custname from orders;
--Extract the first 5 characters from Product_Name.
 select substr(Product_Name,1,5) as productname5 from orders;
--Find the length of each Customer_Name.
select length(customer_Name) as length_name from Orders;
--Replace the word "Rice" with "Premium Rice" in Product_Name.
select Replace(product_name, 'Rice','Premium rice') from orders;
--Remove leading and trailing spaces from Customer_Name.
select trim(Customer_Name)
 from orders; 
--Concatenate First_Name and Last_Name as Full_Name.
select CUSTOMER_NAME || ''|| PRODUCT_NAME as full_name
from orders
--Find customers whose names start with 'A'.
SELECT * FROM Orders
WHERE Customer_Name like 'A%';
--Extract the domain name from Email_ID.
SELECT EMAIL_ID,
       SUBSTR(EMAIL_ID, INSTR(EMAIL_ID, '@') + 1) AS DOMAIN_NAME
FROM ORDERS;
--Reverse the Product_Name.
select Reverse(product_name) as reversed_name 
from orders
--Convert the first letter of each word in Product_Name to uppercase.
select initcap(Product_Name) as capital_product
from Orders
--Extract the last 3 characters from Order_ID.
select substr(Order_ID,-3) as sub_orderid
from orders
--Count how many times letter 'a' appears in Customer_Name.
SELECT LENGTH(Customer_Name) 
       LENGTH(REPLACE(LOWER(Customer_Name),'a','')) AS CountA
FROM Orders;
--Mask the last 4 digits of a phone number.
select concat(phone_)
--Split Full_Name into First_Name and Last_Name.ddddddddddddd
SELECT SUBSTR(Customer_Name, 1, INSTR(Customer_Name,' ')-1) AS First_Name,
       SUBSTR(Customer_Name, INSTR(Customer_Name,' ')+1)   AS Last_Name
FROM Orders;
--Remove all special characters from Product_Code.
SELECT REGEXP_REPLACE(Product_Code, '[^A-Za-z0-9]', '') AS CleanCode
FROM Orders;
--Find customers whose name contains 'kumar'.
select * from orders where lower(Customer_Name) like '%kumar';
--Pad Order_ID with leading zeros to make it 6 digits.
select lpad(Order_ID, 6, '0') as padded_orderid
from orders
--Extract substring between two characters.dddddddddddddddd
SELECT REGEXP_SUBSTR(Customer_Name, '\(([^)]+)\)', 1, 1, NULL, 1) AS BetweenChars
FROM Orders;

--NUMERICAL FUNCTIONS – 20 Questions

--Round Unit_Price to 2 decimal places.
SELECT ROUND(Unit_Price, 2) AS Rounded_Price
FROM Orders;
--Find total sales per order.
SELECT Order_ID,SUM(Unit_Price * Quantity) AS total_sales
FROM orders
GROUP BY Order_ID;
--Calculate average order value.
SELECT ROUND(AVG(Unit_Price * Quantity), 2) AS avg_order_value
FROM orders;
--Find highest product price.
select max(Unit_Price) as highest_price
from orders
--Find lowest product price.
select min(Unit_Price) as highest_price
from orders
-- 6. Calculate percentage discount applied.
SELECT product_name,
       original_price,
       discounted_price,
       ROUND(((original_price - discounted_price) / original_price) * 100, 2) AS discount_percentage
FROM products;
--Find modulus of Quantity divided by 2.
Select MOD(Quantity, 2) AS remainder
from orders;
--Convert negative values to positive.
select abs(Unit_Price)as positve_price
from Orders;
--Truncate price without rounding.
select * from orders;
SELECT TRUNC(Unit_Price, 0) AS truncated_price
FROM orders;
--Find square root of total sales.
select sqrt(sum(Unit_Price * Quantity)) as sqrt_sales
from orders
--Calculate exponential value of a number.
SELECT EXP(3) AS exponential_value
FROM dual;
--Calculate power of 2^5.
select power(2,5)as power_value
from dual;
--Find absolute difference between two prices.
select abs(unit_price-50) from orders;
--Calculate sales growth percentage.
select round((newsales-oldsales)/oldsales)*100,2) as growth_perc
from orders;
--Find random number between 1 and 100.
SELECT ROUND(RANDOM_num.VALUE(1, 100)) AS random_number
FROM dual;
--Divide total sales by number of orders.
select
Sum(Unit_Price * Quantity) / COUNT(Order_ID) 
AS avg_sales_per_order
FROM orders;
--Find ceiling value of price.
SELECT CEIL(Unit_Price) AS ceiling_value
FROM orders;
--Find floor value of price.
SELECT FLOOR(Unit_Price) AS floor_value
FROM orders;