CREATE VIEW Tabla3
as 
SELECT * FROM
    (SELECT 
        authors.au_id AS `authors_id`, 
        authors.au_lname AS `last_name`,
        authors.au_fname AS `first_name`,
        titles.title AS `titles`,
        publishers.pub_name AS `publishers`
    FROM 
        authors
        LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN publishers ON titles.pub_id = publishers.pub_id)
    as Tabla3;

