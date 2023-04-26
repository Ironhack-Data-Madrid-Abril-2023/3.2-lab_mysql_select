SELECT
(a.au_id) as AUTHOR_ID,
(au_lname) as LAST_NAME,
(au_fname) as FIRST_NAME,
sum(ifnull(sq.qty,0)) as TOTAL
from authors AS a
left join titleauthor AS ta 
ON a.au_id = ta.au_id
left join titles AS t
on ta.title_id = t.title_id
left join sales as sq
on t.title_id= sq.title_id
group by a.au_id
order by TOTAL desc;