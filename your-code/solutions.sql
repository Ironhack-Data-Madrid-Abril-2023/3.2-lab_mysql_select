# challenge 1

select authors.au_id, 
	   au_lname,
       au_fname,
       title,
       pub_name
       
from authors 
inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join publishers
on titles.pub_id=publishers.pub_id;


# challenge 2

select authors.au_id,
	au_lname,
    au_fname, 
    pub_name,
    count(titles.title) as title_count
from authors 
inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join publishers
on titles.pub_id=publishers.pub_id

group by authors.au_id, publishers.pub_name
order by title_count DESC;



# challenge 3

use publications;
select authors.au_id,
	au_lname,
    au_fname,
	sum(qty) as total
from authors

inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join sales
on sales.title_id=titles.title_id
group by authors.au_id

order by total desc

LIMIT 3;


# challenge 4

use publications;
select authors.au_id,
	au_lname,
    au_fname,
	COALESCE(sum(qty),0) as total
from authors

inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join sales
on sales.title_id=titles.title_id
group by author.au_id

order by total desc
