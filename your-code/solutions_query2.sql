SELECT 
    authors_id,
    last_name,
    first_name,
    publishers,
    COUNT(DISTINCT titles) AS title_count
FROM tabla3
GROUP BY authors_id, last_name, first_name, publishers
ORDER BY title_count DESC;
