/*
------------------------------------------
Problem: 1789. Primary Department for Each Employee
------------------------------------------
Question:
Report each employee’s primary department.

Rules:
1. If an employee belongs to only one department → that department is the primary one (even if primary_flag = 'N').
2. If an employee belongs to multiple departments → choose the department where primary_flag = 'Y'.

------------------------------------------
Approach / Explanation (Using Window Functions):
1. Use `COUNT(*) OVER (PARTITION BY employee_id)` to find how many departments each employee belongs to.
2. If count = 1 → select that department (regardless of primary_flag).
3. If count > 1 → choose the one where primary_flag = 'Y'.
4. Use a WHERE clause to filter accordingly.

------------------------------------------
SQL Solution (Using Window Function):
*/

WITH employee_dept AS (
    SELECT
        employee_id,
        department_id,
        primary_flag,
        COUNT(*) OVER (PARTITION BY employee_id) AS dept_count
    FROM Employee
)
SELECT
    employee_id,
    department_id
FROM employee_dept
WHERE (dept_count = 1) OR (primary_flag = 'Y');
