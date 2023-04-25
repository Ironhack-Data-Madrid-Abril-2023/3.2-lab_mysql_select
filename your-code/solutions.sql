-- Chalenge 1
SELECT	
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    titles.title,
    publishers.pub_name
FROM	
	authors
    LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
    LEFT JOIN titles on titles.title_id = titleauthor.title_id
    LEFT JOIN publishers on publishers.pub_id = titles.pub_id
    ;

-- Chalenge 2

SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name,
    COUNT(titles.title) as num_titles
FROM 
    authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, 
    publishers.pub_name;
    
-- CHallenge 3

 SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name,
    max(titles.ytd_sales) as num_titles
FROM 
    authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, 
    publishers.pub_name;
    
-- Challenge 4

 SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name,
    max(titles.ytd_sales) as num_titles
FROM 
    authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY 
    authors.au_id, 
    publishers.pub_name	
	order by num_titles desc
    limit 3;