-- Challenge 1

SELECT a.au_id, a.au_lname, a.au_fname, ta.title_id, p.pub_name
FROM authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id
;

-- Challenge 2

SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title_id) as title_count
FROM authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id DESC
;

-- Challenge 3

SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) as total
FROM authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
inner join sales as s
on t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3
;

-- Challenge 4

SELECT a.au_id, a.au_lname, a.au_fname, COALESCE(sum(s.qty), 0) as total
FROM authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
;