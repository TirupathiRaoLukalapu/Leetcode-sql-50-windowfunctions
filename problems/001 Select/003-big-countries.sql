/*
------------------------------------------
Problem: 595. Big Countries


------------------------------------------
Question:
A country is considered big if:
1. It has an area of at least 3,000,000 km², OR
2. It has a population of at least 25,000,000.

Write a SQL query to find the name, population, and area of the big countries.

------------------------------------------
Approach / Explanation:
1. Select the columns name, population, and area from the World table.
2. Use a WHERE clause to filter countries that meet either of the conditions:
   - area >= 3000000
   - population >= 25000000
3. Return the results in any order.

------------------------------------------
*/

SELECT 
    name, 
    population, 
    area
FROM 
    World
WHERE 
    area >= 3000000 
    OR population >= 25000000;
