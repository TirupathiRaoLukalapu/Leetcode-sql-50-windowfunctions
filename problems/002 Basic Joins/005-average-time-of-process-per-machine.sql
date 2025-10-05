/*
------------------------------------------
Problem: 1661. Average Time of Process per Machine

------------------------------------------
Question:
Given a table Activity (machine_id, process_id, activity_type, timestamp) containing start and end timestamps for processes on machines,  
compute the average time each machine takes to complete a process. Round the result to 3 decimal places.

------------------------------------------
Approach / Explanation Using Window Functions:
1. Use `MIN(timestamp) OVER (PARTITION BY machine_id, process_id)` to get the start time of each process.  
2. Use `MAX(timestamp) OVER (PARTITION BY machine_id, process_id)` to get the end time of each process.  
3. Compute `process_time = end_time - start_time` for each process.  
4. Use `AVG(process_time) OVER (PARTITION BY machine_id)` to calculate the average process time per machine.  
5. Use `DISTINCT` to return **one row per machine**.  
6. Round the average to 3 decimal places as required by the problem.  

------------------------------------------
Final SQL Solution Using Window Functions:
*/

WITH process_times AS (
    SELECT 
        machine_id,
        process_id,
        MAX(timestamp) OVER (PARTITION BY machine_id, process_id) -
        MIN(timestamp) OVER (PARTITION BY machine_id, process_id) AS process_time
    FROM Activity
)
SELECT DISTINCT
    machine_id,
    ROUND(AVG(process_time) OVER (PARTITION BY machine_id), 3) AS processing_time
FROM process_times;
