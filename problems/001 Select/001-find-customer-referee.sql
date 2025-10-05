
/*
584. Find Customer Referee
------------------------------------------
Question:
Find the names of customers who are either:
1. Not referred by anyone, OR
2. Referred by a customer whose id != 2.

------------------------------------------
Approach / Explanation:
1. Select all customers.
2. Exclude those referred by id = 2.
3. Include customers with NULL referee_id.

*/


select name
from customer
where  referee_id !=2 or referee_id is NULL