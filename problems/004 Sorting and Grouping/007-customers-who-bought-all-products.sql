/*
------------------------------------------
Problem: 1045. Customers Who Bought All Products
-----------------------------------------
Question:
Find all customer IDs from the Customer table who have bought
ALL the products listed in the Product table.

------------------------------------------
Approach / Explanation:
1. Count the total number of distinct products from the Product table.
2. For each customer, count how many **distinct products** they bought.
3. Compare each customer's distinct count with the total number of products.
4. Return only those customers whose count matches the total.

------------------------------------------
SQL Solution:
*/

SELECT
    c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (
    SELECT COUNT(DISTINCT p.product_key)
    FROM Product p
);
