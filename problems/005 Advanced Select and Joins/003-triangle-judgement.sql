/*
------------------------------------------
Problem: 610. Triangle Judgement
------------------------------------------
Question:
For each row of three line segments (x, y, z), determine whether
they can form a triangle.

Rules:
- A set of lengths can form a triangle if the sum of any two sides
  is greater than the third side.

------------------------------------------
Approach / Explanation:
1. Use a CASE statement to check the triangle inequality:
   - x + y > z
   - x + z > y
   - y + z > x
2. If all conditions hold → "Yes"; else → "No".

------------------------------------------
SQL Solution:
*/

SELECT
    x,
    y,
    z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;
