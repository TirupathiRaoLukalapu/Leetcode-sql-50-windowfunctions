-- Problem 001: Example problem (replace with real)
-- Approach: Use running total with SUM() OVER (ORDER BY ...)
-- Result: person_name

WITH running AS (
  SELECT person_name,
         turn,
         SUM(weight) OVER (ORDER BY turn) AS total_weight
  FROM Queue
)
SELECT person_name
FROM running
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

