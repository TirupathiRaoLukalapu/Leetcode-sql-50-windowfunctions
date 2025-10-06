/*
------------------------------------------
Problem: 1729. Find Followers Count
------------------------------------------
Question:
For each user, return the number of followers they have.
Order the result by user_id in ascending order.

------------------------------------------
Approach / Explanation:
1. Each (user_id, follower_id) pair indicates that `follower_id` follows `user_id`.
2. To find the number of followers per user:
   - Use `COUNT(follower_id)` grouped by `user_id`.
3. Order the results by `user_id ASC`.

------------------------------------------
SQL Solution:
*/

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
