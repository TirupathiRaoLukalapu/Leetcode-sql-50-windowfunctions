/*
------------------------------------------
Problem: 1174. Immediate Food Delivery II


------------------------------------------
Question:
Find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
An order is immediate if customer_pref_delivery_date = order_date.

------------------------------------------
Approach / Explanation:
1. Use ROW_NUMBER() window function to identify the first order per customer by order_date.
2. Filter only the first orders.
3. Count the total number of first orders and the number of immediate first orders.
4. Compute the percentage and round it to 2 decimal places.

------------------------------------------
SQL Solution:
*/

WITH first_orders AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
)
SELECT ROUND(
           100.0 * SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END) 
                 / COUNT(*),
           2
       ) AS immediate_percentage
FROM first_orders
WHERE rn = 1;
