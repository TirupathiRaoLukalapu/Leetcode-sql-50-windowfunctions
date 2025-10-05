/*
------------------------------------------
Problem: 1581. Customer Who Visited but Did Not Make Any Transactions

------------------------------------------
Question:
You are given two tables:
1. Visits (visit_id, customer_id)
2. Transactions (transaction_id, visit_id, amount)

Find the IDs of the customers who visited without making any transactions and the number of times they made such visits.
Return the result table in any order.

------------------------------------------
Approach / Explanation Using Window Functions:
1. Perform a LEFT JOIN from Visits to Transactions on visit_id. This ensures all visits are included, even if there are no transactions.  
2. Filter only the rows where transaction_id IS NULL, which represent visits without transactions.  
3. Use a **window function**: `COUNT(*) OVER (PARTITION BY customer_id)` to count the number of visits without transactions for each customer.  
   - The `PARTITION BY customer_id` ensures the count is calculated separately for each customer.  
4. Use `DISTINCT` to return a single row per customer with their total count of visits without transactions.  
5. This method avoids `GROUP BY` while still giving the aggregated count per customer.  

------------------------------------------
*/

WITH no_trans_visits AS (
    SELECT 
        v.customer_id,
        COUNT(*) OVER (PARTITION BY v.customer_id) AS count_no_trans
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
    WHERE t.transaction_id IS NULL
)
SELECT DISTINCT
    customer_id,
    count_no_trans
FROM no_trans_visits;
