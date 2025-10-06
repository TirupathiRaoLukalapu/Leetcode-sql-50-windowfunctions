/*
------------------------------------------
Problem: 1341. Movie Rating  
------------------------------------------
Question:
Write a query to:
1. Find the user who rated the greatest number of movies (if tie → lexicographically smaller name).
2. Find the movie with the highest average rating in February 2020 (if tie → lexicographically smaller title).

Return both results as a single-column table named `results`:
- First row → user name  
- Second row → movie title

------------------------------------------
Approach / Explanation:
1. **Find Most Active User:**
   - Group `MovieRating` by `user_id` and count total ratings.
   - Join with `Users` to get the user name.
   - Sort by count DESC and name ASC; pick top 1.

2. **Find Top Rated Movie (Feb 2020):**
   - Filter `MovieRating` for dates in February 2020.
   - Group by `movie_id`, calculate average rating.
   - Join with `Movies` to get movie titles.
   - Sort by average rating DESC and title ASC; pick top 1.

3. **Combine Results:**
   - Use `UNION ALL` to stack user name and movie title vertically.

------------------------------------------
SQL Solution:
*/

WITH MostActiveUser AS (
    SELECT 
        u.name AS results
    FROM MovieRating mr
    JOIN Users u 
        ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(mr.movie_id) DESC, u.name
    LIMIT 1
),
TopRatedMovie AS (
    SELECT 
        m.title AS results
    FROM MovieRating mr
    JOIN Movies m 
        ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1
)
SELECT * FROM MostActiveUser
UNION ALL
SELECT * FROM TopRatedMovie;
