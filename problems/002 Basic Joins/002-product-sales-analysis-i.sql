/*
------------------------------------------
Problem: 1068. Product Sales Analysis I
------------------------------------------
Question:
You are given two tables:
1. Sales (sale_id, product_id, year, quantity, price)
2. Product (product_id, product_name)

Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
Return the resulting table in any order.

------------------------------------------
Approach / Explanation:
1. Perform an INNER JOIN between the Sales table and the Product table on product_id.
2. Select product_name from Product and year, price from Sales.
3. The join ensures that each sale_id in Sales gets the correct product_name.
4. No aggregation or grouping is necessary since we want each sale record individually.

------------------------------------------
*/

SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;
