/*
------------------------------------------
Problem: 596. Classes With at Least 5 Students
------------------------------------------
Question:
You are given a table `Courses` with columns:
- student (varchar)
- class (varchar)

Each row indicates which student is enrolled in which class.

Return all the classes that have **at least 5 students**.

------------------------------------------
Approach / Explanation:
1. Use GROUP BY to group students by their class.
2. Count the number of students in each class using COUNT(student).
3. Use HAVING to filter classes where the count >= 5.

------------------------------------------
SQL Solution (Simple GROUP BY):
*/

SELECT
    class
FROM
    Courses
GROUP BY
    class
HAVING
    COUNT(student) >= 5;
