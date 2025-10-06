/*
------------------------------------------
Problem: 196. Delete Duplicate Emails
------------------------------------------
Question:
Delete all duplicate emails, keeping only the row with the smallest id.

------------------------------------------
Approach / Explanation:
1. Join the table to itself on the email column.
2. Delete rows where the id is greater than the smallest id for the same email.
3. This ensures only one row per email remains.

------------------------------------------
SQL Solution:

DELETE p1
FROM Person p1
INNER JOIN Person p2
    ON p1.email = p2.email
   AND p1.id > p2.id;
*/
