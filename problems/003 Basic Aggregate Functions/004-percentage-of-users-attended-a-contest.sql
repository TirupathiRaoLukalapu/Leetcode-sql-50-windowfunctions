/*
------------------------------------------
Problem: 1633. Percentage of Users Attended a Contest

------------------------------------------
Question:
Find the percentage of users registered in each contest, rounded to two decimals.
Return the result table ordered by percentage descending, and by contest_id ascending in case of a tie.

------------------------------------------
Approach / Explanation:
1. Count the number of users registered in each contest using `COUNT(user_id)` and `GROUP BY contest_id`.
2. Count the total number of users from the `Users` table.
3. Calculate the percentage as `(COUNT(user_id) / total_users * 100)` and round to 2 decimals.
4. Order by `percentage` descending and `contest_id` ascending.

------------------------------------------
Final SQL Solution:
*/

SELECT 
    r.contest_id,
    ROUND(COUNT(r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;
