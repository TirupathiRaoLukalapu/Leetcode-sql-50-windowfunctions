/*
------------------------------------------
Problem: 185. Department Top Three Salaries  
------------------------------------------
Question:
Find the employees who are high earners in each department.
A high earner is defined as an employee whose salary is among the
top three **unique** salaries in their department.

Return the result table with columns:
- Department
- Employee
- Salary

------------------------------------------
Approach / Explanation:
1. Use a **window function (DENSE_RANK)** to rank each employee’s salary 
   within their department in descending order.
2. Filter the results to only include ranks less than or equal to 3.
3. Join the `Employee` and `Department` tables to display department names.
4. The DENSE_RANK ensures that duplicate salaries share the same rank,
   satisfying the "unique salaries" requirement.

------------------------------------------
SQL Solution:
*/

SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT 
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
) e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.rnk <= 3;
