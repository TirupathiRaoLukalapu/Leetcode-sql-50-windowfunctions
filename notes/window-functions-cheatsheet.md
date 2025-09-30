# Window Functions Cheat Sheet

Common patterns:

1. Basic running aggregate
   SELECT col, SUM(val) OVER (ORDER BY date) AS running_sum FROM t;

2. Partitioned running sum
   SUM(val) OVER (PARTITION BY group_col ORDER BY date) 

3. ROW_NUMBER / RANK / DENSE_RANK
   ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)
   RANK() / DENSE_RANK() differences:
    - RANK() may leave gaps: 1,2,2,4
    - DENSE_RANK() no gaps: 1,2,2,3

4. Lead/Lag
   LAG(value, 1) OVER (PARTITION BY id ORDER BY ts) -- previous value
   LEAD(value, 1) OVER (...) -- next value

5. First/Last value
   FIRST_VALUE(col) OVER (PARTITION BY grp ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

6. Frame clauses
   SUM(val) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)

Tips:
- Use CTEs for readability.
- Use PARTITION BY to reset per group.
- ORDER BY inside OVER controls ranking/accumulation order
