#Challenge 1
SELECT a.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON t.title_id = ta.title_id 
JOIN publishers p ON p.pub_id = t.pub_id;

#Challenge 2
SELECT a.au_id AS "AUTHOR ID", 
	   a.au_lname AS "LAST NAME", 
       a.au_fname AS "FIRST NAME", 
       max(p.pub_name) AS "PUBLISHER", 
       COUNT(t.title) AS "NUM_TITLES"
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON t.title_id = ta.title_id 
JOIN publishers p ON p.pub_id = t.pub_id
GROUP BY a.au_id;

#Challenge 3

SELECT a.au_id AS 'AUTHOR ID', 
		a.au_lname AS 'LAST NAME', 
        a.au_fname AS 'FIRST NAME', 
        sum(s.qty) AS 'TITLE TOTAL'
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON t.title_id = ta.title_id 
JOIN publishers p ON p.pub_id = t.pub_id
join sales s on s.qty = s.qty
group by a.au_id, a.au_lname, a.au_fname
ORDER BY SUM(s.qty) DESC
LIMIT 3;

#Challenge 4

SELECT a.au_id AS 'AUTHOR ID', 
       a.au_lname AS 'LAST NAME', 
       a.au_fname AS 'FIRST NAME', 
       COALESCE(SUM(s.qty), 0) AS 'TITLE TOTAL'
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON t.title_id = ta.title_id 
JOIN publishers p ON p.pub_id = t.pub_id
LEFT JOIN sales s ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY SUM(s.qty) DESC;



