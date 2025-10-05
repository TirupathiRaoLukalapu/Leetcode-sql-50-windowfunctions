/*
------------------------------------------
Problem: 1378. Replace Employee ID With The Unique Identifier
------------------------------------------
Question:
You are given two tables:
1. Employees (id, name)
2. EmployeeUNI (id, unique_id)

Write a SQL query to display each employee’s unique ID and name.
If an employee doesn’t have a unique ID, display NULL for their unique_id.
Return the result table in any order.

------------------------------------------
Approach / Explanation:
1. Use a LEFT JOIN between Employees and EmployeeUNI on the id column.
2. The LEFT JOIN ensures all employees appear even if they don’t have a corresponding unique_id.
3. A window function is not necessary since the mapping between id and unique_id is one-to-one.
4. Select the unique_id and employee name from the joined tables.
*/

SELECT 
    eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;
