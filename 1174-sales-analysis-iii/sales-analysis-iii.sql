# Write your MySQL query statement below
SELECT DISTINCT p.product_id, p.product_name
from Product p, Sales s
where p.product_id = s.product_id and s.sale_date between '2019-01-01' and '2019-03-31'
  and p.product_id not in (
      SELECT product_id
      FROM Sales
      WHERE sale_date < '2019-01-01' or sale_date > '2019-03-31'
  );
