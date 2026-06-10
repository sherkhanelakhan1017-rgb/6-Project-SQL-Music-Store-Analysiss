WITH artist_sales AS (
SELECT
    i.customer_id,
    ar.name AS artist_name,
    round(SUM(il.unit_price * il.quantity), 2) AS amount_spent
FROM invoice i
JOIN invoice_line il
ON i.invoice_id = il.invoice_id
JOIN track t
ON il.track_id = t.track_id
JOIN album2 al
ON t.album_id = al.album_id
JOIN artist ar
ON al.artist_id = ar.artist_id
GROUP BY
    i.customer_id,
    ar.name 
    )
SELECT *
FROM artist_sales ORDER BY amount_spent DESC;