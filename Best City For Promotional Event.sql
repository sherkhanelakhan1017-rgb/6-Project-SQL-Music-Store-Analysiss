SELECT billing_city,
       SUM(total) AS revenue
FROM invoice
GROUP BY billing_city
ORDER BY revenue DESC
LIMIT 1;
