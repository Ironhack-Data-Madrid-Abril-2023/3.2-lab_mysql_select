Challenge 1.

SELECT authors.au_id AS 'AUTHOR_ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
        titles.title AS 'TITLE',
        publishers.pub_name AS 'PUBLISHER'
FROM authors
		LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
		LEFT JOIN titles ON titleauthor.title_id = titles.title_id
		LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
        ;



Challenge 2.

SELECT authors.au_id AS 'AUTHOR_ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
        publishers.pub_name AS 'PUBLISHER',
        COUNT(titles.title_id) AS 'TITLE COUNT'
FROM authors
		LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
		LEFT JOIN titles ON titleauthor.title_id = titles.title_id
		LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY
		authors.au_id, publishers.pub_id
        ;



Challenge 3.

SELECT authors.au_id AS 'AUTHOR_ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
        SUM(sales.qty) AS 'TOTAL'
FROM authors
        INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN titles ON titleauthor.title_id = titles.title_id
		INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY
		authors.au_id
ORDER BY
    SUM(sales.qty) DESC
LIMIT 3
;



Challenge 4. # no me salen los 23 autores que deberia tener el ejercicio

SELECT authors.au_id AS 'AUTHOR_ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
        SUM(sales.qty) AS 'TOTAL'
FROM authors
        INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN titles ON titleauthor.title_id = titles.title_id
		INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY
		authors.au_id
ORDER BY
		TOTAL DESC
;