/*
------------------------------------------
Problem: 1148. Article Views I
------------------------------------------
Question:
Find all authors who have viewed at least one of their own articles.

Return the result table sorted by `id` in ascending order.

------------------------------------------
Approach / Explanation:
1. Each record in the Views table shows which `viewer_id` viewed which author's article.
2. If an author has viewed their own article, then `author_id = viewer_id`.
3. Select distinct author IDs that meet this condition.
4. Rename the column to `id` and sort in ascending order.

------------------------------------------
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
