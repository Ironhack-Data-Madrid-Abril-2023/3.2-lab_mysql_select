SELECT 
    authors.au_id AS `authors_id`, 
    authors.au_lname AS `last_name`, 
    authors.au_fname AS `first_name`, 
    SUM(sales.qty) AS `total`
FROM 
    authors 
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN sales ON titles.title_id = sales.title_id
GROUP BY 
    authors.au_id
ORDER BY 
    `TOTAL` DESC
LIMIT 3;
