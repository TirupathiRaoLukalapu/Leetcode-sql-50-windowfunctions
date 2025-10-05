/*
Problem 1: Recyclable and Low Fat Products
Question:
Find the product IDs of products that are both low fat and recyclable.

Table: Products
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
(low_fats, recyclable) are ('Y', 'N') values.

 
Approach / Explanation:
1. Select all products from the Products table.
2. Apply WHERE conditions to check both columns:
   - low_fats = 'Y'
   - recyclable = 'Y'
-- 3. Return product_id as required.
------------------------------------------
*/

-- Solution 

select product_id
from products
where low_fats = 'Y' and recyclable = 'Y'



