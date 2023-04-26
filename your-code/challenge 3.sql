SELECT
(a.au_id) as AUTHOR_ID,
(au_lname) as LAST_NAME,
(au_fname) as FIRST_NAME,
count(t.title) as TOTAL_TITLES
from authors AS a
join titleauthor AS ta 
ON a.au_id = ta.au_id
join titles AS t
on ta.title_id = t.title_id
join sales as sq
on t.title_id= sq.title_id
group by a.au_id
order by TOTAL desc
limit 3;