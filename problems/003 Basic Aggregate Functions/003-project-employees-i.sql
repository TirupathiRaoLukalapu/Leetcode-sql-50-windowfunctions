/*
------------------------------------------
Problem: 1075. Project Employees I

------------------------------------------
Question:
Report the average experience years of all employees for each project, rounded to 2 decimal places. 
Return the result table in any order.

------------------------------------------
Approach / Explanation (Window Function):
1. Join `Project` and `Employee` tables on `employee_id`.
2. Use `AVG(experience_years) OVER (PARTITION BY project_id)` to calculate the average per project.
3. Round the result to 2 decimal places.
4. Use `DISTINCT` to remove duplicate rows because the window function replicates the average for each employee in a project.
5. Return `project_id` and `average_years`.

------------------------------------------
Final SQL Solution:
*/

SELECT DISTINCT
    project_id,
    ROUND(AVG(experience_years) OVER (PARTITION BY project_id), 2) AS average_years
FROM Project p
JOIN Employee e
    ON p.employee_id = e.employee_id;
