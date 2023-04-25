SELECT a.au_id  as 'Author_ID' , a.au_lname as 'Author_last_name' , a.au_fname as 'Author_first_name' , t.title_id as 'Title', p.pub_name as 'Publisher_name'
FROM authors as a
inner join titleauthor as t
on a.au_id = t.au_id
inner join titles as ti
on t.title_id = ti.title_id
inner join publishers as p
on ti.pub_id = p.pub_id


SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT a.au_id  as 'Author_ID' , a.au_lname as 'Author_last_name' , a.au_fname as 'Author_first_name' , t.title_id as 'Title', p.pub_name as 'Publisher_name', count(ti.title) as tittlecount


FROM authors as a
inner join titleauthor as t
on a.au_id = t.au_id
inner join titles as ti
on t.title_id = ti.title_id
inner join publishers as p
on ti.pub_id = p.pub_id
group by a.au_id, a.au_lname, a.au_fname,p.pub_name;


SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));



SELECT a.au_id  as 'Author_ID' , a.au_lname as 'Author_last_name' , a.au_fname as 'Author_first_name' , sum(s.qty) as total 


FROM authors as a
inner join titleauthor as t
on a.au_id = t.au_id
inner join titles as ti
on t.title_id = ti.title_id
inner join sales as s
on ti.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname

order by total asc
limit 3


SELECT a.au_id AS 'Author_ID',
       a.au_lname AS 'Author_last_name',
       a.au_fname AS 'Author_first_name',
       COALESCE(SUM(s.qty), 0) AS total
FROM authors AS a
LEFT JOIN titleauthor AS t ON a.au_id = t.au_id
LEFT JOIN titles AS ti ON t.title_id = ti.title_id
LEFT JOIN sales AS s ON ti.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY total DESC;
