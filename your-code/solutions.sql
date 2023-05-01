/*Challenge 1*/

SELECT authors.au_id, au_lname, au_fname, title, publishers.pub_name
FROM authors
JOIN titles ON au_id = authors.au_id
JOIN publishers ON titles.pub_id = publishers.pub_id

/*Challenge 2*/

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_id, count(titles.title) as title_count

FROM authors

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id

LEFT JOIN titles ON titleauthor.title_id = titles.title_id

LEFT JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id

ORDER BY title_count desc;