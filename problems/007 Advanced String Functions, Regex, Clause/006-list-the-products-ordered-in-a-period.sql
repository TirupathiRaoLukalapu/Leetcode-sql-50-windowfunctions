/*
------------------------------------------
Problem: 1327. List the Products Ordered in a Period
------------------------------------------
Question:
Return the names of products that have at least 100 units ordered in February 2020 
along with the total units ordered.

------------------------------------------
Approach / Explanation:
1. Filter the Orders table to include only orders in February 2020.
2. Group by product_id and calculate the total units ordered.
3. Join with the Products table to get the product names.
4. Keep only products with total units >= 100.

------------------------------------------
SQL Solution:
*/

SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders o
JOIN Products p 
    ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
