
-- Problem 1: Recyclable and Low Fat Products
-- Source: LeetCode SQL 50
-- Approach: Basic SELECT with WHERE filters


select product_id
from products
where low_fats = 'Y' and recyclable = 'Y'