/*
------------------------------------------
Problem: 1211. Queries Quality and Percentage
------------------------------------------
Question:
Find each query_name with:
1. quality = average of (rating / position)
2. poor_query_percentage = percentage of queries with rating < 3

Both should be rounded to 2 decimal places.

------------------------------------------
Approach / Explanation:
1. Use GROUP BY query_name to get one row per query.
2. Use AVG(rating*1.0/position) to calculate quality.
3. Use SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)/COUNT(*) * 100 for poor query percentage.
4. ROUND both to 2 decimals.

------------------------------------------
SQL Solution:
*/

SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
