/*
------------------------------------------
Problem: 1251. Average Selling Price

------------------------------------------
Question:
Write a solution to find the average selling price for each product. 
average_price should be rounded to 2 decimal places. 
If a product does not have any sold units, its average selling price is assumed to be 0.
Return the result table in any order.

------------------------------------------
Approach / Explanation (Using Window Functions):
1. Join `UnitsSold` and `Prices` on product_id, ensuring the purchase_date falls within start_date and end_date.
2. Compute revenue per sale as `units * price`.
3. Use window functions to compute:
   - Total revenue per product: SUM(units * price) OVER (PARTITION BY product_id)
   - Total units per product: SUM(units) OVER (PARTITION BY product_id)
4. Calculate average price as total_revenue / total_units.
5. Use DISTINCT to return one row per product_id.
6. Use COALESCE to handle products with no sales (average_price = 0).

------------------------------------------
Final SQL Solution:
*/

WITH revenue_cte AS (
    SELECT 
        p.product_id,
        u.units,
        p.price,
        SUM(u.units * p.price) OVER (PARTITION BY p.product_id) AS total_revenue,
        SUM(u.units) OVER (PARTITION BY p.product_id) AS total_units
    FROM Prices p
    LEFT JOIN UnitsSold u
        ON p.product_id = u.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
)
SELECT DISTINCT
    product_id,
    COALESCE(ROUND(total_revenue / total_units, 2), 0) AS average_price
FROM revenue_cte;
