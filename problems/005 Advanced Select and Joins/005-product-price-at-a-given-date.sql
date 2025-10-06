/*
------------------------------------------
Problem: 1164. Product Price at a Given Date
------------------------------------------
Question:
Find the price of all products on 2019-08-16. 
- If there was no price change before or on that date, the initial price is 10.
- If there are multiple price changes before the date, take the latest one.

------------------------------------------
Approach / Explanation (Using Window Functions):
1. Use a window function to find the latest price change for each product on or before 2019-08-16.
2. Use ROW_NUMBER() partitioned by product_id and ordered by change_date DESC.
3. Pick the first row (latest change) per product.
4. If a product has no price changes before the date, use COALESCE to set it to 10.

------------------------------------------
SQL Solution:
*/

WITH ranked_prices AS (
    SELECT
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT
    p.product_id,
    COALESCE(r.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN ranked_prices r
    ON p.product_id = r.product_id AND r.rn = 1;
