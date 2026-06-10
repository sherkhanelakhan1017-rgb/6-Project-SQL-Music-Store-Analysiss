SELECT DISTINCT
    c.email,
    CONCAT(c.first_name, ' ', c.last_name) AS fullname,
    g.name
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
        JOIN
    invoice_line AS il ON i.invoice_id = il.invoice_id
        JOIN
    track AS t ON il.track_id = t.track_id
        JOIN
    genre AS g ON t.genre_id = g.genre_id
WHERE
    g.name = 'Rock'
ORDER BY c.email;