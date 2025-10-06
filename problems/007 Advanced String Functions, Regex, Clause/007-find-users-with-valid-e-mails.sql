/*
------------------------------------------
Problem: 1517. Find Users With Valid E-Mails
------------------------------------------
Question:
Find the users who have valid emails. A valid email must:
1. Start with a letter.
2. Contain only letters, digits, underscore '_', period '.', or dash '-' before '@'.
3. Have the domain '@leetcode.com'.
Return the result table in any order.
------------------------------------------
Approach / Explanation:
1. Use a regular expression to match valid email patterns.
2. Ensure the email starts with a letter using ^[a-zA-Z].
3. Allow subsequent characters [a-zA-Z0-9._-]* before the @ symbol.
4. Check the domain is exactly '@leetcode.com'.
5. Return user_id, name, and mail columns.
------------------------------------------
SQL Solution:
*/

SELECT user_id,
       name,
       mail
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com';
