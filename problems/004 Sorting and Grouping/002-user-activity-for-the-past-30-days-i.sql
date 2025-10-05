/*
------------------------------------------
Problem: 1141. User Activity for the Past 30 Days I
------------------------------------------
Question:
Find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
A user is active on a day if they made at least one activity that day.
------------------------------------------
Approach / Explanation:
1. Filter activities between '2019-06-28' and '2019-07-27'.
2. Group by activity_date.
3. Count distinct user_id for each day.
------------------------------------------
*/

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
ORDER BY activity_date;
