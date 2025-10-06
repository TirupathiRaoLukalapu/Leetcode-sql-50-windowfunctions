------------------------------------------
Problem: 1527. Patients With a Condition  
------------------------------------------
Question:
Find the patient_id, patient_name, and conditions of patients who have **Type I Diabetes**.  
Type I Diabetes always starts with the prefix `'DIAB1'`.

------------------------------------------
Approach / Explanation:
1. Use the `LIKE` operator or a regular expression to identify any condition string containing `'DIAB1'`.
2. Since multiple condition codes are space-separated, we must check if `'DIAB1'` appears **anywhere** within the `conditions` column.
3. Return patient_id, patient_name, and conditions of all matching rows.

------------------------------------------

SELECT 
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%' 
   OR conditions LIKE 'DIAB1%';
