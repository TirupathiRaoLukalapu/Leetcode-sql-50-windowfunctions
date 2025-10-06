/*
------------------------------------------
Problem: 602. Friend Requests II: Who Has the Most Friends
------------------------------------------
Question:
Given a table `RequestAccepted` with columns `requester_id`, `accepter_id`, and `accept_date`, 
find the person who has the most friends and the number of friends they have.

A friendship is **bidirectional** — if A and B are friends, both A and B should be counted as having each other as friends.

Return:
- `id`: the person’s ID
- `num`: the total number of friends they have

The test cases guarantee only one person has the most friends.

------------------------------------------
Approach / Explanation:
1. Each row in `RequestAccepted` represents two friendships:
   - requester_id → accepter_id  
   - accepter_id → requester_id  
   So, we must count both directions.
2. Use a `UNION ALL` to combine requester and accepter IDs into one column (`id`).
3. Group by `id` to count how many friends each person has.
4. Order by `num` descending and limit to 1 for the person with the most friends.

------------------------------------------
SQL Solution:
*/

SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
