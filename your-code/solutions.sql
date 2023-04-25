
Challenge 1 - Who Have Published What At Where?

select authors.au_id, au_lname, au_fname, titles.title, pub_name
from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on titles.pub_id = publishers.pub_id

Challenge 2 - Who Have Published How Many At Where?

select authors.au_id, au_lname, au_fname, pub_name, count(*) as Title_count
from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, au_lname, au_fname, pub_name;

Challenge 3 - Best Selling Authors

select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname "FIRST NAME", sum(qty) as Total 
from authors
left join titleauthor on titleauthor.au_id = authors.au_id
left join titles on titles.title_id= titleauthor.title_id
left join sales on sales.title_id = titles.title_id
group by authors.au_id
ORDER BY total desc LIMIT 3
    '899-46-2035','Ringer','Anne','148'
    '998-72-3567','Ringer','Albert','133'
    '427-17-2319','Dull','Ann','50'

Challenge 4 - Best Selling Authors Ranking

create table publications.store_sales_top3
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname "FIRST NAME", IFNULL(sum(qty),0) as Total 
from authors
left join titleauthor on titleauthor.au_id = authors.au_id
left join titles on titles.title_id= titleauthor.title_id
left join sales on sales.title_id = titles.title_id
group by authors.au_id
ORDER BY total desc LIMIT 23;
