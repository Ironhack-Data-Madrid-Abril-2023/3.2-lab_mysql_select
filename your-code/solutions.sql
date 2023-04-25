Ejercicio 1:

select 
	authors.au_id as author_ID,
	authors.au_lname as last_name,
    authors.au_fname as first_name,
    titles.title as title,
    publishers.pub_name as publisher

from 
	authors
	join titleauthor on authors.au_id = titleauthor.au_id
    join titles on titleauthor.title_id = titles.title_id
    join publishers on titles.pub_id = publishers.pub_id;


Ejercicio 2: 

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select 
		authors.au_id as author_ID,
		authors.au_lname as last_name,
		authors.au_fname as first_name,
		publishers.pub_name as publisher,
        count(titles.title_id) as count

	from 
		authors
		join titleauthor on authors.au_id = titleauthor.au_id
		join titles on titleauthor.title_id = titles.title_id
		join publishers on titles.pub_id = publishers.pub_id
        group by titleauthor.au_id
        order by titleauthor.au_id

Ejercicio 3:
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select 
		authors.au_id as author_ID,
		authors.au_lname as last_name,
		authors.au_fname as first_name,
		sum(qty) as total

	from 
		authors
		left join titleauthor on authors.au_id = titleauthor.au_id
		left join titles on titleauthor.title_id = titles.title_id
		left join sales on sales.title_id = titles.title_id
        group by titleauthor.au_id 
        order by total desc
        limit 3

Ejercicio 4:
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select 
		authors.au_id as author_ID,
		authors.au_lname as last_name,
		authors.au_fname as first_name,
		sum(qty) as total

	from 
		authors
		left join titleauthor on authors.au_id = titleauthor.au_id
		left join titles on titleauthor.title_id = titles.title_id
		left join sales on sales.title_id = titles.title_id
        group by titleauthor.au_id 
        order by total desc
       

    