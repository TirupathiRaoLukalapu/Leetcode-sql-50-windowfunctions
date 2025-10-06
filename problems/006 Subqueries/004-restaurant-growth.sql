/*
------------------------------------------
Problem: 1321. Restaurant Growth
------------------------------------------
Question:
Compute the 7-day moving average of total amount spent by customers in a restaurant.
Each row shows:
- The total amount for the last 7 days (including current day)
- The 7-day average amount, rounded to 2 decimal places.

------------------------------------------
Approach / Explanation (Without Window Functions):
1. For each date, calculate the sum of `amount` within the last 7 days using a correlated subquery.
2. Compute the average by dividing that sum by 7.
3. Exclude the first 6 days since there isn’t a complete 7-day window.
4. Order the results by `visited_on`.

------------------------------------------
SQL Solution (Without Window Functions):
*/

SELECT 
    visited_on,
    (
        SELECT SUM(amount)
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND((
        SELECT SUM(amount) / 7
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ), 2) AS average_amount
FROM Customer c
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer
)
GROUP BY visited_on
ORDER BY visited_on;
