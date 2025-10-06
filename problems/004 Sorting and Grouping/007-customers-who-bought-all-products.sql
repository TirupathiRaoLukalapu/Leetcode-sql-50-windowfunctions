/*
------------------------------------------
Problem: 1045. Customers Who Bought All Products
------------------------------------------
Question:
Find all customer IDs who have bought every product available
in the Product table.

------------------------------------------
Approach / Explanation (Using Window Functions):
1. Determine the total number of unique products from the Product table.
2. Use a window function to count distinct product_keys per customer.
3. Compare each customer's count with the total number of products.
4. Select customers who have purchased all products.

------------------------------------------
SQL Solution (Window Function):
*/

WITH total_products AS (
    SELECT COUNT(DISTINCT product_key) AS total_count
    FROM Product
),
customer_products AS (
    SELECT
        customer_id,
        COUNT(DISTINCT product_key) OVER (PARTITION BY customer_id) AS customer_count
    FROM Customer
)
SELECT DISTINCT
    customer_id
FROM customer_products, total_products
WHERE customer_count = total_count;
