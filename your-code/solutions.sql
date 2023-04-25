
-- CHALLENGE 1

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name AS PUBLISHERS
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id;

-- CHALLENGE 2

SELECT authors.au_id as AUTHOR_ID,
 authors.au_lname as LAST_NAME,
 authors.au_fname as FIRST_NAME,
 publishers.pub_name AS PUBLISHERS,
 count(titles.title_id) as TITLE_COUNT
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY AUTHOR_ID, publishers.pub_name;

-- CHALLENGE 3

SELECT authors.au_id as AUTHOR_ID,
 authors.au_lname as LAST_NAME,
 authors.au_fname as FIRST_NAME,
 COUNT(sales.qty) as TOTAL
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
JOIN sales
on titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC LIMIT 3;

-- CHALLENGE 4: Al poner el LEFT JOIN me aparecen también los valores nulos

SELECT authors.au_id as AUTHOR_ID,
 authors.au_lname as LAST_NAME,
 authors.au_fname as FIRST_NAME,
 count(titles.title_id) as TOTAL
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
on titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;