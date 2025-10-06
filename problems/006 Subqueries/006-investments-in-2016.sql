/*
------------------------------------------
Problem: 585. Investments in 2016
------------------------------------------
Question:
Report the sum of all total investment values in 2016 (tiv_2016), 
for all policyholders who:

1. Have the same tiv_2015 value as one or more other policyholders, and  
2. Are located in a unique city (unique pair of lat, lon).

Round tiv_2016 to two decimal places.

------------------------------------------
Approach / Explanation:
1. **Find duplicated tiv_2015 values:**  
   Use GROUP BY tiv_2015 and HAVING COUNT(*) > 1 to find tiv_2015 values shared by multiple policyholders.

2. **Find unique locations:**  
   Use GROUP BY lat, lon and HAVING COUNT(*) = 1 to identify policyholders living in unique cities.

3. **Filter main table:**  
   Select policyholders whose tiv_2015 is in the duplicated list and (lat, lon) is unique.

4. **Sum their tiv_2016:**  
   Use SUM(tiv_2016) and ROUND to two decimals.

------------------------------------------
SQL Solution:
*/

SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
