SELECT au.au_id, au_lname, au_fname, t.title, pub_name
FROM authors AS au
INNER JOIN titleauthor AS ta
ON au.au_id = ta.au_id
LEFT JOIN titles as t
;


SELECT au.au_id, au_lname, au_fname, p.pub_name, count(t.title) as cuentalo
FROM authors AS au
INNER JOIN titleauthor AS ta
ON au.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN publishers AS p
ON t.pub_id = p.pub_id

GROUP BY au.au_id, p.pub_name
ORDER BY au_id

;


SELECT au.au_id, au_lname, au_fname, sum(s.qty) as total
FROM authors AS au
INNER JOIN titleauthor AS ta
ON au.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
JOIN sales AS s
ON t.title_id = s.title_id
GROUP BY au.au_id
ORDER BY total DESC
LIMIT 3
;

SELECT au.au_id, au_lname, au_fname, ifnull(sum(s.qty) , 0) as total
FROM authors AS au
LEFT JOIN titleauthor AS ta
ON au.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN sales AS s
ON t.title_id = s.title_id
GROUP BY au.au_id
ORDER BY total DESC
LIMIT 23

;
