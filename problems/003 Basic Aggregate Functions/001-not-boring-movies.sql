/*
------------------------------------------
Problem: 620. Not Boring Movies

------------------------------------------
Question:
Given the Cinema table (id, movie, description, rating),  
find movies with **odd-numbered IDs** and description **not equal to 'boring'**.  
Return the result ordered by rating in descending order.

------------------------------------------
Approach / Explanation:
1. Filter movies using `id % 2 = 1` for odd-numbered IDs.  
2. Exclude movies with `description = 'boring'`.  
3. Order the results by `rating DESC`.  
4. Select all columns as requested.

------------------------------------------
Final SQL Solution:
*/

SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description <> 'boring'
ORDER BY rating DESC;
