SELECT
    ar.name,
    COUNT(*) AS rock_tracks
FROM artist ar
JOIN album2 al
ON ar.artist_id = al.artist_id
JOIN track t
ON al.album_id = t.album_id
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY ar.name
ORDER BY rock_tracks DESC
LIMIT 10;