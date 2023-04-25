-- CHALLENGE 1

USE publications;
SELECT authors.au_id, au_lname, au_fname, titleauthor.title_id, pub_name 
from authors
INNER JOIN titleauthor 
ON titleauthor.au_id=authors.au_id
LEFT JOIN titles
ON titles.title_id=titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id=titles.pub_id;

-- CHALLENGE 2

USE publications;
SELECT authors.au_id, au_lname, au_fname, pub_name, count(titles.title) as title_count
from authors
INNER JOIN titleauthor 
ON titleauthor.au_id=authors.au_id
LEFT JOIN titles
ON titles.title_id=titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY title_count DESC;

-- CHALLENGE 3

USE publications;
SELECT authors.au_id, au_lname, au_fname, sum(qty) as total
from authors
INNER JOIN titleauthor 
ON titleauthor.au_id=authors.au_id
LEFT JOIN titles
ON titles.title_id=titleauthor.title_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3;

-- CHALLENGE 4

SELECT authors.au_id, au_lname, au_fname, COALESCE(sum(qty),0) as total
from authors
LEFT JOIN titleauthor 
ON titleauthor.au_id=authors.au_id
LEFT JOIN titles
ON titles.title_id=titleauthor.title_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY total DESC
;