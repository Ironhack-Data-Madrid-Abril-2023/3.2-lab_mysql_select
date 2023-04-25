--Challenge 1
SELECT authors.au_id, authors.au_fname, authors.au_lname, titles.title, publishers.pub_name
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON  titles.pub_id = publishers.pub_id;

--Challenge 2
SELECT max(authors.au_id)as id,
 max(authors.au_fname) as name,
 max(authors.au_lname) as lastname,
 max(titles.title)as titles,
 max(publishers.pub_name) as publisher,
 count(titles.title) as titlecount
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON  titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
order by titlecount desc

--Challenge 3
SELECT max(authors.au_id)as id,
 max(authors.au_fname) as name,
 max(authors.au_lname) as lastname,
 max(sales.qty) as salesquantity
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON  titles.title_id = sales.title_id
group by authors.au_id, sales.qty
order by sales.qty desc
limit 3

-- Challenge 4
SELECT max(authors.au_id)as id,
 max(authors.au_fname) as name,
 max(authors.au_lname) as lastname,
 max(sales.qty) as salesquantity
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON  titles.title_id = sales.title_id
group by authors.au_id, sales.qty
order by sales.qty desc
LIMIT 23

