/*
------------------------------------------
Problem: 1280. Students and Examinations

------------------------------------------
Question:
Given three tables:
1. Students (student_id, student_name)
2. Subjects (subject_name)
3. Examinations (student_id, subject_name)

Count how many times each student attended each exam.  
Include all students and all subjects.  
Return the result ordered by student_id and subject_name.

------------------------------------------
Approach / Explanation:
1. Generate all combinations of students and subjects using a CROSS JOIN.  
   - This ensures every student-subject pair exists, even if no exam was taken.  
2. LEFT JOIN the Examinations table on student_id and subject_name to bring attendance data.  
3. Use `COUNT(e.student_id)` to calculate the number of times each student attended each exam.  
   - If no exam was taken, the count will be 0.  
4. GROUP BY student_id, student_name, subject_name to avoid duplicates.  
5. ORDER BY student_id and subject_name as required.  

------------------------------------------
Final SQL Solution using :
*/

WITH all_combinations AS (
    SELECT 
        s.student_id,
        s.student_name,
        sub.subject_name
    FROM Students s
    CROSS JOIN Subjects sub
)
SELECT 
    ac.student_id,
    ac.student_name,
    ac.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM all_combinations ac
LEFT JOIN Examinations e
    ON ac.student_id = e.student_id
    AND ac.subject_name = e.subject_name
GROUP BY ac.student_id, ac.student_name, ac.subject_name
ORDER BY ac.student_id, ac.subject_name;
