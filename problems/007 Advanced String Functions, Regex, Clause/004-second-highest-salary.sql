/*
------------------------------------------
Problem: 176. Second Highest Salary
------------------------------------------
Question:
Find the second highest distinct salary from the Employee table. 
If there is no second highest salary, return null.

------------------------------------------
Approach / Explanation:
1. Use a self-join to compare each salary with all other salaries.
2. Only consider salaries that are less than some other salary.
3. Take the maximum of these to get the second highest.
4. Use COALESCE to return NULL if there is no second highest salary.

------------------------------------------
SQL Solution:
*/

SELECT 
    COALESCE(MAX(e1.salary), NULL) AS SecondHighestSalary
FROM employee e1
JOIN employee e2
  ON e1.salary < e2.salary;
