-- challenge 1

select titleauthor.au_id as "AUTHOR ID" , authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", titles.title as "TITLE", publishers.pub_name as "PUBLISHER"
from titleauthor
join authors
on titleauthor.au_id = authors.au_id
join titles
on titles.title_id = titleauthor.title_id
join publishers
on titles.pub_id = publishers.pub_id

-- challenge 2

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select  titleauthor.au_id as "AUTHOR ID" , 
			authors.au_lname as "LAST NAME", 
			authors.au_fname as "FIRST NAME", 
			publishers.pub_name as "PUBLISHER", 
			count(titles.title) as "TITLE COUNT"
from titleauthor
join authors
on titleauthor.au_id = authors.au_id
join titles
on titles.title_id = titleauthor.title_id
join publishers
on titles.pub_id = publishers.pub_id
group by titleauthor.au_id 
order by titleauthor.au_id

-- challenge 3

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select  titleauthor.au_id as "AUTHOR ID" , 
		authors.au_lname as "LAST NAME", 
		authors.au_fname as "FIRST NAME", sum(sales.qty) as "TOTAL SALES"
from titleauthor
join authors
on titleauthor.au_id = authors.au_id
join titles
on titleauthor.title_id = titles.title_id
join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by sum(sales.qty) desc

-- challenge 4

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select  titleauthor.au_id as "AUTHOR ID" , 
		authors.au_lname as "LAST NAME", 
		authors.au_fname as "FIRST NAME", coalesce(sum(sales.qty), 0) as TOTALSALES
from authors
LEFT join titleauthor
on titleauthor.au_id = authors.au_id
LEFT join titles
on titleauthor.title_id = titles.title_id
LEFT join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by TOTALSALES desc