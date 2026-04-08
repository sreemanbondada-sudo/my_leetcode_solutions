# Write your MySQL query statement below
select name,  COALESCE(SUM(r.distance), 0) AS travelled_distance

from Users u left join Rides r on
r.user_id=u.id
group by u.id,u.name
order by travelled_distance desc,u.name ASC;