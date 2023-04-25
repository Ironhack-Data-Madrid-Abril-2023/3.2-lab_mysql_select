
-- ESTA ES LA BUSQUEDA DEL CHALLENGE 1

select aut.au_id as `AUTHOR ID`, aut.au_lname as 'LASTNAME' , aut.au_fname as 'FIRSTNAME' ,t.title as 'TITLE',p.pub_name as 'PUBLISHER'
from authors as aut
left join titleauthor as ta
on aut.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id;

-- ESTA ES LA BUSQUEDA DEL CHALLENGE 2
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select aut.au_id as `AUTHOR ID`, aut.au_lname as 'LASTNAME' , aut.au_fname as 'FIRSTNAME' ,p.pub_name as 'PUBLISHER', count(t.title) as 'TITLE COUNT'
from authors as aut
left join titleauthor as ta
on aut.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
group by aut.au_lname, aut.au_fname, p.pub_name;

-- ESTA ES LA BUSQUEDA DEL CHALLENGE 3

select aut.au_id as `AUTHOR ID`, aut.au_lname as 'LASTNAME' , aut.au_fname as 'FIRSTNAME' ,sum(s.qty) as 'TOTAL' 
from authors as aut
left join titleauthor as ta
on aut.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by aut.au_lname, aut.au_fname
order by sum(s.qty) desc
limit 3;

-- ESTA ES LA BUSQUEDA DEL CHALLENGE 4

select aut.au_id as `AUTHOR ID`, aut.au_lname as 'LASTNAME' , aut.au_fname as 'FIRSTNAME' ,sum(s.qty) as 'TOTAL' 
from authors as aut
left join titleauthor as ta
on aut.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by aut.au_lname, aut.au_fname
order by sum(s.qty) desc;