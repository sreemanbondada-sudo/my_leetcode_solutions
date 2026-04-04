# Write your MySQL query statement below
SELECT id, visit_date, people
FROM (
    SELECT s.*,
           LEAD(people,1) OVER (order by id) AS next1,
           LEAD(people,2) OVER (order by id) AS next2,
           LAG(people,1) OVER (ORDER by id) AS prev1,
           LAG(people,2) OVER (ORDER BY id) AS prev2
    from Stadium s
) t
WHERE 
    (people >= 100 AND next1 >= 100 AND next2 >= 100)
    or
    (people >= 100 AND prev1 >= 100 AND next1 >= 100)
    OR
    (people >= 100 AND prev1 >= 100 AND prev2 >= 100)
ORDER BY visit_date;
