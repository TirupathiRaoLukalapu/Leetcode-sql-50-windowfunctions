/*
------------------------------------------
Problem: 197. Rising Temperature

------------------------------------------
Question:
You are given a table Weather (id, recordDate, temperature) containing daily temperature data.  
Find all dates’ ids where the temperature is higher than the previous calendar day.  
Return the result table in any order.

------------------------------------------
Approach / Explanation:
1. Perform a **self-join** on the Weather table: compare each row (`w1`) to the previous calendar day (`w2`).  
2. Join condition: `w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)`.  
3. Filter rows where `w1.temperature > w2.temperature`.  
4. Select `id` as `Id` to match LeetCode’s expected output.  
5. This ensures missing days are correctly ignored (solving the consecutive-day issue).  

------------------------------------------
*/

SELECT w1.id AS Id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
