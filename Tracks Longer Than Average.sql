SELECT 
    name, milliseconds
FROM
    TRACK
WHERE milliseconds > 
    (SELECT 
            AVG(milliseconds) AS Avg_track
        FROM
            track)
ORDER BY milliseconds DESC;