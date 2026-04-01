# Write your MySQL query statement below
with first_positive as (
    select patient_id,min(test_date) as first_positive_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),
first_negative AS (
    SELECT 
        c.patient_id, MIN(c.test_date) as first_negative_date
    from covid_tests c
    JOIN first_positive fp 
      ON c.patient_id = fp.patient_id
     AND c.test_date > fp.first_positive_date
    WHERE c.result = 'Negative'
    GROUP BY c.patient_id
)
select 
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(fn.first_negative_date, fp.first_positive_date) AS recovery_time
FROM patients p
JOIN first_positive fp ON p.patient_id = fp.patient_id
JOIN first_negative fn ON p.patient_id = fn.patient_id
ORDER BY recovery_time ASC, patient_name ASC;