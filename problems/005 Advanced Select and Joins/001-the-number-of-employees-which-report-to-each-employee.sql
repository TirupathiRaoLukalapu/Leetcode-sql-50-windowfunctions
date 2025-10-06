/*
------------------------------------------
Problem: 1731. The Number of Employees Which Report to Each Employee
------------------------------------------
Question:
For each manager, find:
- Their employee_id and name
- The number of employees reporting directly to them
- The average age of those employees (rounded to the nearest integer)

Return results ordered by employee_id.

------------------------------------------
Approach / Explanation (Using Window Functions):
1. Use a self-join:
   - `e` → employee
   - `m` → manager (`e.reports_to = m.employee_id`)
2. For each employee, use window functions partitioned by `e.reports_to`:
   - `COUNT(e.employee_id) OVER (PARTITION BY e.reports_to)` gives number of reports per manager.
   - `ROUND(AVG(e.age) OVER (PARTITION BY e.reports_to))` gives average report age.
3. Select distinct managers and avoid duplicates using `DISTINCT` on manager-level columns.
4. Order by manager’s `employee_id`.

------------------------------------------
SQL Solution (Using Window Functions):
*/

SELECT DISTINCT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) OVER (PARTITION BY e.reports_to) AS reports_count,
    ROUND(AVG(e.age) OVER (PARTITION BY e.reports_to)) AS average_age
FROM Employees e
JOIN Employees m
    ON e.reports_to = m.employee_id
ORDER BY m.employee_id;
