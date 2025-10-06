/*
------------------------------------------
Problem: 1204. Last Person to Fit in the Bus
------------------------------------------
Question:
Find the person_name of the last person who can board the bus
without exceeding the weight limit of 1000 kg. 
- Boarding happens in the order of the 'turn' column.
- Only one person can board at a time.

------------------------------------------
Approach / Explanation (Using Window Functions):
1. Use SUM(weight) OVER (ORDER BY turn) to calculate the cumulative weight as people board.
2. Only include people where cumulative weight <= 1000.
3. Pick the last person from that filtered list using ORDER BY turn DESC and LIMIT 1.

------------------------------------------
SQL Solution:
*/

WITH cumulative_weight AS (
    SELECT
        person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name
FROM cumulative_weight
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
