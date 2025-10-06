/*
------------------------------------------
Problem: 1978. Employees Whose Manager Left the Company
------------------------------------------
Question:
Find employees whose salary is strictly less than $30000
and whose manager has left the company (manager_id does not exist in Employees table).

------------------------------------------
Approach / Explanation:
1. Select employees with salary < 30000.
2. Check if their manager_id does not exist in the Employees table.
3. Use a LEFT JOIN or NOT IN approach to filter out employees whose manager is still present.
4. Return employee_id ordered by employee_id.

------------------------------------------
SQL Solution:
*/

SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id
      FROM Employees
  )
ORDER BY employee_id;
