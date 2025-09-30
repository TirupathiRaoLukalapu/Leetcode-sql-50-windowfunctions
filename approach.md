# Problem Solving Approach (SQL)

1. **Read & Clarify**: Carefully read the requested output columns and constraints.
2. **Identify tables & relevant columns**.
3. **Break down steps**:
   - Filters (WHERE)
   - Aggregation (GROUP BY) OR window-based aggregation (OVER)
   - Ranking/ordering (ROW_NUMBER, RANK, DENSE_RANK)
4. **Decide window vs group approach**:
   - If you need row-by-row ranking or cumulative values, prefer window functions.
   - For plain group totals, GROUP BY is fine.
5. **Write small CTEs** (WITH) to build and test intermediate results.
6. **Optimize for readability** then performance.
7. **Comment** each file with short explanation and logic.

Example pattern names:
- `ROW_NUMBER()` to choose top N rows per group
- `DENSE_RANK()` for top K unique values
- `SUM(...) OVER (PARTITION BY ... ORDER BY ...)` for running totals
- `LAG()` / `LEAD()` for comparing current with previous/next row

