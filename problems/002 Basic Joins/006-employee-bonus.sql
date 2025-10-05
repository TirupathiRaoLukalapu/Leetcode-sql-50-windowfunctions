/*
------------------------------------------
Problem: 577. Employee Bonus


------------------------------------------
Question:
Given two tables:
1. Employee (empId, name, supervisor, salary)
2. Bonus (empId, bonus)

Report the name and bonus of each employee with a bonus less than 1000.  
If an employee does not have a bonus, display NULL.  

Return the result in any order.

------------------------------------------
Approach / Explanation Using Window Functions:
1. Use a LEFT JOIN between Employee and Bonus on empId to include all employees.  
2. Use `MAX(bonus) OVER (PARTITION BY empId)` to get each employee’s bonus, keeping NULL if missing.  
3. Filter rows where `bonus < 1000 OR bonus IS NULL`.  
4. Select `name` and `bonus`.  

------------------------------------------
Final SQL Solution Using Window Functions:
*/

WITH employee_bonus AS (
    SELECT 
        e.empId,
        e.name,
        MAX(b.bonus) OVER (PARTITION BY e.empId) AS bonus
    FROM Employee e
    LEFT JOIN Bonus b
    ON e.empId = b.empId
)
SELECT 
    name,
    bonus
FROM employee_bonus
WHERE bonus < 1000 OR bonus IS NULL;
