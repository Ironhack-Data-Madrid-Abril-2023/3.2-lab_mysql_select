CREATE VIEW Tabla
as 
SELECT * FROM
	(SELECT 
		authors.au_id AS 'Authors_ID', 
		authors.au_lname AS 'Authors_Lastname',
		authors.au_fname AS 'Authors_Firstname',
		titles.title AS 'Titles',
		publishers.pub_name AS 'Publishers' 
	FROM 
		authors
		LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
		LEFT JOIN titles ON titleauthor.title_id = titles.title_id
		LEFT JOIN publishers ON titles.pub_id = publishers.pub_id)
	as Tabla1;

SELECT 
	authors_ID,
    authors_Firstname,
    authors_Lastname,
    publishers,
    COUNT(DISTINCT titles) AS title_count
FROM tabla
GROUP BY authors_ID, authors_Firstname, authors_Lastname, publishers
ORDER BY title_count DESC;

SELECT 
	Authors_ID,
	Authors_Firstname,
	Authors_Lastname,
	Publishers,
	SUM(sales.qty) AS 'Total_Sales'
FROM tabla
LEFT JOIN titleauthor ON tabla.authors_ID = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY 
	Authors_ID,
	Authors_Firstname,
	Authors_Lastname,
	Publishers
ORDER BY 
	SUM(sales.qty) DESC
limit 3;

SELECT 
	Authors_ID,
	Authors_Firstname,
	Authors_Lastname,
	COALESCE(Publishers, 'No Publisher'),
	COALESCE(SUM(sales.qty), 0) AS 'Total_Sales'
FROM tabla
LEFT JOIN titleauthor ON tabla.authors_ID = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY 
	Authors_ID,
	Authors_Firstname,
	Authors_Lastname,
	Publishers
ORDER BY 
	SUM(sales.qty) DESC;

