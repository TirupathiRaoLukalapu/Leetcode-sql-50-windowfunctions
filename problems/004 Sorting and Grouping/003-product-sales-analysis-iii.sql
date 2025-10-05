/*
------------------------------------------
Problem: 1070. Product Sales Analysis III
------------------------------------------

Question:
Find all sales that occurred in the *first year* each product was sold.
Return columns: product_id, first_year, quantity, price.

------------------------------------------
Approach / Explanation:
1. For each product_id, find the earliest year it was sold.
2. Use a window function (MIN(year) OVER (PARTITION BY product_id)) to determine the first year.
3. Select only rows where the sale year = first_year.

------------------------------------------
SQL Solution (Using Window Function):
*/

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM (
    SELECT
        product_id,
        year,
        quantity,
        price,
        MIN(year) OVER (PARTITION BY product_id) AS first_year_window
    FROM Sales
) s
WHERE year = first_year_window
ORDER BY product_id;
