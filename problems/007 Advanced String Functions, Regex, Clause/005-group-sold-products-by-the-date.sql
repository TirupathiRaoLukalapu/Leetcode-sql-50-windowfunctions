/*
------------------------------------------
Problem: 1484. Group Sold Products By The Date
------------------------------------------
Question:
For each sell_date, return the number of distinct products sold 
and a comma-separated string of product names in lexicographical order.

------------------------------------------
Approach / Explanation:
1. Use GROUP_CONCAT to aggregate products for each sell_date.
2. Use DISTINCT in GROUP_CONCAT to remove duplicates.
3. Sort products lexicographically inside GROUP_CONCAT.
4. Count distinct products using COUNT(DISTINCT product).
5. Order the results by sell_date.

------------------------------------------
SQL Solution:
*/

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
