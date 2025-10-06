/*
------------------------------------------
Problem: 626. Exchange Seats
------------------------------------------
Question:
Swap the seat ID of every two consecutive students. If the number of students is odd,
the last student's seat remains unchanged.

------------------------------------------
Approach / Explanation:
1. Since IDs are consecutive starting from 1, we can use simple arithmetic to swap seats:
   - For odd `id`, swap with `id + 1`.
   - For even `id`, swap with `id - 1`.
2. Handle the edge case where the number of students is odd, leaving the last student as is.
3. Order the result by `id` ascending.

------------------------------------------
SQL Solution:
*/

SELECT
    CASE 
        WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;
