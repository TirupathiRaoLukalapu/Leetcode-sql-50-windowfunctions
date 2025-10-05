/*
------------------------------------------
Problem: 1193. Monthly Transactions I

------------------------------------------
Question:
Find for each month and country:
1. Total number of transactions
2. Number of approved transactions
3. Total transaction amount
4. Total approved transaction amount

Return the result table in any order.
Ensure that approved transaction totals are 0 when there are no approved transactions.

------------------------------------------
Approach / Explanation:
1. Use `DATE_FORMAT(trans_date, '%Y-%m')` to extract month.
2. Group by `month` and `country`.
3. Use `COUNT(*)` for total transactions.
4. Use `COUNT(CASE WHEN state='approved' THEN 1 END)` for approved transaction count.
5. Use `SUM(amount)` for total amount.
6. Use `COALESCE(SUM(CASE WHEN state='approved' THEN amount END), 0)` for approved total to handle cases with no approved transactions.

------------------------------------------
SQL Solution:
*/

SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    COALESCE(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
