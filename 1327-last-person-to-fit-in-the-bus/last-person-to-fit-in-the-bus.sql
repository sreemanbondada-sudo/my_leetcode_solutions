# Write your MySQL query statement below
with OrderedQueue AS (
    SELECT 
        person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
select person_name
from OrderedQueue
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
