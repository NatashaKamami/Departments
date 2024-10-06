-- ASSIGNMENT
-- 1. List all customers with their details.
SELECT * FROM CUSTOMERS;

-- 2. Find a customer by their email address.
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMERS WHERE EMAIL = "charliedavis@email.com";

-- 3. Count the total number of customers.
SELECT COUNT(*) FROM CUSTOMERS;

-- 4. Retrieve customers who have made more than one order.
SELECT C.FIRST_NAME, C.LAST_NAME, COUNT(O.CUSTOMER_ID) AS NUMBER_OF_ORDERS
FROM CUSTOMERS C
INNER JOIN ORDER_TABLE O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C. CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME
HAVING COUNT(O.CUSTOMER_ID) > 1
ORDER BY C.CUSTOMER_ID;

-- 5. Find customers with last names starting with a specific letter.
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMERS WHERE LAST_NAME LIKE "D%";

-- 6. List all products with their prices.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS;

-- 7. Find the product with the highest price.
SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCTS);

-- 8. Count the total number of products.
SELECT COUNT(*) AS TOTAL_PRODUCTS FROM PRODUCTS;

-- 9. Retrieve products priced below a certain amount.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS 
WHERE PRICE < 30;

-- 10. Find products that have never been ordered.
SELECT P.PRODUCT_NAME 
FROM PRODUCTS P
LEFT JOIN ORDER_ITEMS O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE O.PRODUCT_ID IS NULL;

-- 11. List all orders with their details.
SELECT * FROM ORDER_TABLE;

-- 12. Find the order with the highest number of items.
SELECT ORDER_ID, QUANTITY
FROM ORDER_ITEMS
WHERE QUANTITY = (SELECT MAX(QUANTITY) FROM ORDER_ITEMS);

-- 13. Count the total number of orders placed.
SELECT COUNT(*) AS TOTAL_ORDERS FROM ORDER_TABLE;

-- 14. Retrieve orders placed within a specific date range.
SELECT ORDER_ID, ORDER_DATE FROM ORDER_TABLE 
WHERE ORDER_DATE BETWEEN "2023-05-01" AND "2023-05-10";

-- 15. Find orders made by a specific customer.
SELECT ORDER_ID, ORDER_DATE FROM ORDER_TABLE
WHERE CUSTOMER_ID = 3;

-- 16. List all items in a specific order.
SELECT PRODUCT_ID, QUANTITY FROM ORDER_ITEMS WHERE ORDER_ID = 5;

-- 17. Find the total quantity of a specific product sold.
SELECT SUM(QUANTITY) AS TOTAL_QUANTITY FROM ORDER_ITEMS WHERE PRODUCT_ID = 1;

-- 18. Count how many times each product has been ordered.
SELECT PRODUCT_ID, COUNT(*) AS COUNT_PER_PRODUCT
FROM ORDER_ITEMS
GROUP BY PRODUCT_ID
ORDER BY PRODUCT_ID;

-- 19. Retrieve items that were ordered more than a certain quantity.
SELECT * FROM ORDER_ITEMS 
WHERE QUANTITY > 2;

-- 20. Find orders that include a specific product.
SELECT ORDER_ID, QUANTITY FROM ORDER_ITEMS 
WHERE PRODUCT_ID = 13;

-- 21. Calculate total revenue generated from all orders.
SELECT SUM(P.PRICE * O.QUANTITY) AS TOTAL_REVENUE
FROM ORDER_ITEMS O
INNER JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID;

-- 22. Calculate total revenue generated per product.
SELECT P.PRODUCT_NAME, SUM(P.PRICE * O.QUANTITY) AS REVENUE_PER_PRODUCT
FROM ORDER_ITEMS O
INNER JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_NAME;

-- 23. Find the day with the highest revenue.
SELECT OT.ORDER_DATE, SUM(P.PRICE * OI.QUANTITY) AS DAILY_REVENUE
FROM ORDER_TABLE OT
INNER JOIN ORDER_ITEMS OI ON OT.ORDER_ID = OI.ORDER_ID
INNER JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
GROUP BY OT.ORDER_DATE
ORDER BY DAILY_REVENUE DESC
LIMIT 1;

-- 24. Determine the average revenue per order.
-- 25. Identify which customer has generated the most revenue.
-- 26. Find the total number of items sold per order.

-- 27. Determine the average price of products in the database.
SELECT AVG(PRICE) AS AVERAGE FROM PRODUCTS;

-- 28. Group orders by customer and count the number of orders per customer.
SELECT C.FIRST_NAME, C.LAST_NAME, COUNT(O.CUSTOMER_ID) AS ORDER_COUNT
FROM CUSTOMERS C
INNER JOIN ORDER_TABLE O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID;

-- 29. Find the maximum quantity of any product ordered in a single order.
SELECT P.PRODUCT_NAME, O.QUANTITY
FROM PRODUCTS P
INNER JOIN ORDER_ITEMS O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE O.QUANTITY = (SELECT MAX(QUANTITY) FROM ORDER_ITEMS);

-- 30. Group products by price range and count the number of products in each range.
SELECT CASE
	WHEN PRICE < 30 THEN "Cheap"
    WHEN PRICE BETWEEN 30 AND 60 THEN "Affordable"
    ELSE "Expensive"
END AS PRICE_RANGE, 
COUNT(*) AS NUMBER_OF_PRODUCTS
FROM PRODUCTS
GROUP BY PRICE_RANGE;

-- 31. Find the first order date for each customer.


-- 32. Retrieve customers who have ordered products above a specific price.
SELECT C.FIRST_NAME, C.LAST_NAME, P.PRODUCT_NAME, P.PRICE
FROM CUSTOMERS C
INNER JOIN ORDER_TABLE OT ON C.CUSTOMER_ID = OT.CUSTOMER_ID
INNER JOIN ORDER_ITEMS OI ON OT.ORDER_ID = OI.ORDER_ID
INNER JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
WHERE P.PRICE > 50;

-- 33. List all products that have been ordered more than once.
SELECT P.PRODUCT_NAME, COUNT(O.PRODUCT_ID)
FROM PRODUCTS P
INNER JOIN ORDER_ITEMS O ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
HAVING COUNT(O.PRODUCT_ID) > 1;

-- 34. Find customers who have never placed an order.
SELECT C.FIRST_NAME, C.LAST_NAME 
FROM CUSTOMERS C
LEFT JOIN ORDER_TABLE O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.CUSTOMER_ID IS NULL;

-- 35. Retrieve orders placed in the last 30 days.
SELECT * FROM ORDER_TABLE WHERE timestampdiff(DAY, ORDER_DATE, CURDATE()) = 30;







