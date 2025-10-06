/*
------------------------------------------
Problem: 1667. Fix Names in a Table  
------------------------------------------
Question:
Write a query to format the `name` column so that:
- Only the **first character** is uppercase.
- All other characters are lowercase.

Return the result table ordered by `user_id`.

------------------------------------------
Approach / Explanation:
1. Use **UPPER()** to capitalize the first character.
2. Use **LOWER()** to convert the rest of the string to lowercase.
3. Combine them using **CONCAT()** and **SUBSTRING()** functions.
4. Order the result by `user_id`.

------------------------------------------
SQL Solution:
*/

SELECT 
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)), 
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;
