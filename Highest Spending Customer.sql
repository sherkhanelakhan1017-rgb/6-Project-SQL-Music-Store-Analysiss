SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS fullname,
    i.customer_id,
    SUM(i.total) AS total_spent
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
GROUP BY customer_id , c.first_name , c.last_name
ORDER BY total_spent DESC
LIMIT 1;