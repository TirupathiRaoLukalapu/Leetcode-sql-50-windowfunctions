/*
------------------------------------------
Problem: 2356. Number of Unique Subjects Taught by Each Teacher
------------------------------------------
Question:
Calculate the number of unique subjects each teacher teaches in the university.
------------------------------------------
Approach / Explanation:
1. Use COUNT(DISTINCT subject_id) to count the unique subjects per teacher.
2. Group by teacher_id.
------------------------------------------
*/

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
