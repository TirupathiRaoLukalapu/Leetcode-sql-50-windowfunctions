/*
------------------------------------------
Problem: 619. Biggest Single Number
------------------------------------------
Question:
Find the largest single number (appears only once) from the MyNumbers table.
If no such number exists, return NULL.

------------------------------------------
Approach / Explanation:
1. Group all numbers using `GROUP BY num`.
2. Use `HAVING COUNT(num) = 1` to keep only numbers that appear once.
3. Return the maximum of those numbers using `MAX(num)`.

------------------------------------------
SQL Solution:
*/

SELECT
    MAX(num) AS num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1
ORDER BY num DESC
LIMIT 1;
