# Write your MySQL query statement below
SELECT 
    emp.employee_id,
    emp.name,
    COUNT(r.employee_id) as reports_count,
    ROUND(AVG(r.age))as average_age
from Employees emp
join Employees r
    ON emp.employee_id = r.reports_to
GROUP BY emp.employee_id, emp.name
ORDER BY emp.employee_id;