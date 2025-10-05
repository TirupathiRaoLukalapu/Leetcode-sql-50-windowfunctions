/*
------------------------------------------
Problem: 570. Managers with at Least 5 Direct Reports

------------------------------------------
Question:
Given the Employee table (id, name, department, managerId), find managers with at least five direct reports.  
Return the result table with manager names in any order.

------------------------------------------
Approach / Explanation:
1. Join the Employee table with itself on e.id = r.managerId to associate each manager with their direct reports.  
2. Count the number of direct reports per manager using COUNT(r.id).  
3. GROUP BY manager id and name to collapse duplicates.  
4. Use HAVING COUNT(r.id) >= 5 to filter managers with at least five direct reports.  

------------------------------------------
Final SQL Solution:
*/

SELECT 
    e.name
FROM Employee e
JOIN Employee r
    ON e.id = r.managerId
GROUP BY e.id, e.name
HAVING COUNT(r.id) >= 5;
