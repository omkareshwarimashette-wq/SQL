--Part 1: 20 Solved Join Questions (with Answers)

-- 1. Create CUSTOMERS Table
CREATE TABLE CUSTOMERS1 (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    PHONE_NUMBER VARCHAR2(20),
    LOYALTY_POINTS NUMBER
);


CREATE TABLE ORDERS1 (
    ORDER_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    ORDER_DATE DATE,
    TOTAL_AMOUNT NUMBER(10, 2),
    DISCOUNT_AMT NUMBER(10, 2), 
    SHIPPING_DATE DATE          
);
-- 3. Insert Data with intentional NULL values
-- Customers
INSERT INTO CUSTOMERS1 VALUES (101, 'John', 'Doe', 'New York', '555-0100', 500);
INSERT INTO CUSTOMERS1 VALUES (102, 'Jane', 'Smith', NULL, '555-0101', 120);
INSERT INTO CUSTOMERS1 VALUES (103, 'Robert', 'Brown', 'Chicago', NULL, 0);
INSERT INTO CUSTOMERS1 VALUES (104, 'Emily', 'Davis', NULL, NULL, NULL); -- Lots of NULLs
INSERT INTO CUSTOMERS1 VALUES (105, 'Michael', 'Wilson', 'Miami', '555-0105', NULL);

INSERT INTO ORDERS1 VALUES (5001, 101, DATE '2023-10-01', 150.00, 10.00, DATE '2023-10-03');
INSERT INTO ORDERS1 VALUES (5002, 102, DATE '2023-10-02', 200.50, NULL, DATE '2023-10-05'); -- No discount
INSERT INTO ORDERS1 VALUES (5003, 101, DATE '2023-10-05', 75.00, 5.00, NULL); -- Not shipped
INSERT INTO ORDERS1 VALUES (5004, 104, DATE '2023-10-06', 300.00, NULL, NULL); -- No discount, Not shipped
INSERT INTO ORDERS1 VALUES (5005, 105, DATE '2023-10-07', 50.00, 0.00, DATE '2023-10-08');
INSERT INTO ORDERS1 VALUES (5006, NULL, DATE '2023-10-08', 20.00, NULL, DATE '2023-10-09'); -- Orphan order

COMMIT;



--1. (Inner Join) Retrieve a list of customers who have placed at least one order. Display Name and Order ID.
SELECT C.FIRST_NAME, C.LAST_NAME, O.ORDER_ID
FROM CUSTOMERS C
INNER JOIN ORDERS O ON  C.CUSTOMER_ID = O.CUSTOMER_ID;

--2. (Left Join) List all customers and their Order IDs. Include customers who have not placed any orders.
SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS1 C
LEFT JOIN ORDERS1 O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--3. (Left Join - Finding Non-Matches) Find customers who have NEVER placed an order
SELECT C.FIRST_NAME, C.LAST_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.ORDER_ID IS NULL;

--4. (Right Join) List all orders and the associated customer name. Include orders that do not have a linked Customer ID.
SELECT C.FIRST_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
FROM CUSTOMERS C
RIGHT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--5. (Full Outer Join) List ALL customers and ALL orders. If a customer has no order, show NULLs for order info. If an order has no customer, show NULLs for customer info.
SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--6. (Left Join with NVL) Calculate the total amount spent by each customer. If they haven't bought anything, display 0 instead of NULL.
SELECT C.FIRST_NAME, NVL(SUM(O.TOTAL_AMOUNT),0) AS TOTAL_SPENT
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME;

--7. (Self Join) Find pairs of customers who live in the same City.
SELECT A.FIRST_NAME AS CUST_1, B.FIRST_NAME AS CUST_2, A.CITY
FROM CUSTOMERS A
JOIN CUSTOMERS B ON A.CITY = B.CITY
WHERE A.CUSTOMER_ID < B.CUSTOMER_ID;

--8. (Cross Join) Generate a theoretical list of every customer buying every order
SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
CROSS JOIN ORDERS O;

--9. (Natural Join) Join Customers and Orders automatically based on the common column (CUSTOMER_ID). 
SELECT FIRST_NAME, ORDER_ID
FROM CUSTOMERS
NATURAL JOIN ORDERS;

--10. (Left Join & Filtering) List all Customers and their Order Dates, but only for orders placed after October 5th. Keep customers with NO orders in the list
SELECT C.FIRST_NAME, O.ORDER_DATE
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID AND O.ORDER_DATE > DATE '2023-10-05';

--11. (Full Join - Exclusive) Find records that are EITHER a Customer without an order OR an Order without a Customer 
SELECT C.CUSTOMER_ID AS C_ID, O.ORDER_ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CUSTOMER_ID IS NULL OR O.CUSTOMER_ID IS NULL;

--12. (Inner Join with Aggregates) Find the average loyalty points of customers who have actually placed an order.
SELECT AVG(DISTINCT C.LOYALITY_POINTS)
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--13. (Left Join with Coalesce) Display a report: "Customer Name - Order ID". If there is no order, display "Customer Name - No Order".
SELECT C.FIRST_NAME || '-' || COALESCE(TO_CHAR(O.ORDER_ID), 'NO ORDER')AS REPORT_LOG
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--14. (Self Join on Inequality) Find pairs of orders where the first order has a higher amount than the second order
SELEC O1.ORDER_ID AS HIGH_VAL_ORDER, 02.ORDER_ID AS LOW_VAL_ORDER
FROM ORDERS 01
JOIN ORDERS 02 ON 01.TOTAL_AMOUNT > 02.TOTAL_AMOUNT;

--15. (Left Join) Count how many orders each customer has made. Note: COUNT(O.ORDER_ID) is safer than COUNT(*) because it returns 0 for NULLs
SELECT C.FIRST_NAME, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME;

--16. (Right Join with Date Logic) List all orders and the Customer City. If the Customer is NULL (orphan order), display 'Unknown City'.
SELECT O.ORDER_ID, NVL(C.CITY, 'UNKNOWN CITY')
FROM CUSTOMERS C
RIGHT JOIN ORDERS O  ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--17. (Non-Equi Join) Find customers whose Loyalty Points are greater than the Total Amount of any single order.
SELECT DISTINCT C.FIRST_NAME, C.LOYALTY_POINTS, O.TOTAL_AMOUNT
FROM CUSTOMERS C
JOIN ORDERS O ON C.LOYALTY_POINTS > O.TOTAL_AMOUNT;

--18. (Left Join) List Customers and their "Shipping Status". If the order exists but Shipping Date is NULL, show 'Pending'. If no order exists, show 'N/A'.
SELECT C.FIRST_NAME,
CASE
WHEN O.ORDER_ID IS NULL THEN 'N/A'
WHEN O.SHIPPING_DATE IS NULL THEN 'PENDING'
ELSE 'SHIPPED'
END AS STATUS
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--19. (Using USING) Perform an Inner Join using the USING clause instead of ON.
SELECT FIRST_NAME, ORDER_ID
FROM CUSTOMERS
JOIN ORDERS USING (CUSTOMER_ID);

20. (Multiple Join Conditions) Join Customers and Orders where the Customer ID matches AND the Customer has a valid City (City is not null).
SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CITY IS NOT NULL;















