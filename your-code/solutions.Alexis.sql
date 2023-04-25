-- Challenge 1

SELECT authors.au_id, au_lname, au_fname, titles.title, pub_name
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;

-- Challenge 2 

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME" , pub_name AS "PUBLISHER", COUNT(*) AS "TITLE COUNT"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, publishers.pub_name
ORDER BY authors.au_id desc;

-- Challenge 3 

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", MAX(sales.qty) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, sales.qty
ORDER BY sales.qty desc
LIMIT 3;

-- Challenge 4 

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", COALESCE(MAX(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, sales.qty
ORDER BY sales.qty desc;



