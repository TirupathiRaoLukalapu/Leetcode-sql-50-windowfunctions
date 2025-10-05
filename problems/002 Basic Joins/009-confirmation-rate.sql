/*
------------------------------------------
Problem: 1934. Confirmation Rate

------------------------------------------
Question:
Given Signups(user_id, time_stamp) and Confirmations(user_id, time_stamp, action),  
calculate the confirmation rate of each user:  
(Number of 'confirmed' actions) / (Total number of confirmation requests).  
If the user did not request any confirmations, the rate is 0. Round to 2 decimals.

------------------------------------------
Approach / Explanation Using Window Functions:
1. LEFT JOIN Signups with Confirmations on user_id to include all users.  
2. Use COUNT(*) OVER (PARTITION BY s.user_id) to get total requests per user.  
3. Use SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) OVER (PARTITION BY s.user_id) to get total confirmed per user.  
4. Calculate confirmation_rate = confirmed_count / total_count.  
5. Use COALESCE to handle users with 0 requests (avoid division by NULL).  
6. Round the confirmation_rate to 2 decimal places.  
7. Select user_id and confirmation_rate.  

------------------------------------------
Final SQL Solution:
*/

WITH user_stats AS (
    SELECT
        s.user_id,
        COUNT(c.action) OVER (PARTITION BY s.user_id) AS total_requests,
        SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) 
            OVER (PARTITION BY s.user_id) AS confirmed_count
    FROM Signups s
    LEFT JOIN Confirmations c
        ON s.user_id = c.user_id
)
SELECT
    user_id,
    ROUND(
        CASE 
            WHEN total_requests = 0 THEN 0
            ELSE confirmed_count * 1.0 / total_requests
        END
    , 2) AS confirmation_rate
FROM user_stats
GROUP BY user_id, total_requests, confirmed_count
ORDER BY user_id;
