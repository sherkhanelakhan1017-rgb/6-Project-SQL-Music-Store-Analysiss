WITH customer_spending AS (
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    i.billing_country,
    round(SUM(i.total), 2) AS total_spent, 
    row_number() Over (
                partition by i.billing_country 
                 ORDER BY SUM(i.total) desc
                ) as rn
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
GROUP BY i.billing_country, 
         c.customer_id, 
         c.first_name, 
         c.last_name 
)
select * from customer_spending where rn = 1;