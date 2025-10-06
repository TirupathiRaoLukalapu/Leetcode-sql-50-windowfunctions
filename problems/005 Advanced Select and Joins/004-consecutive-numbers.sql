/*
------------------------------------------
Problem: 180. Consecutive Numbers
------------------------------------------
Question:
Find all numbers that appear at least three times consecutively in the Logs table.

------------------------------------------
Approach / Explanation (Without Window Functions):
1. Use self-joins to compare consecutive rows:
   - l1 for the current row
   - l2 for the next row (id + 1)
   - l3 for the next-next row (id + 2)
2. Check if the `num` value is the same across the three consecutive rows.
3. Use DISTINCT to avoid duplicates if a number appears in multiple consecutive sequences.
4. Return the numbers that meet this condition.

------------------------------------------
SQL Solution:
*/

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l2.id = l1.id + 1
JOIN Logs l3 ON l3.id = l1.id + 2
WHERE l1.num = l2.num 
  AND l1.num = l3.num;
