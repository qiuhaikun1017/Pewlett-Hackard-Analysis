-- create new table retirement titles
select emp.emp_no, 
emp.first_name, 
emp.last_name, 
titles.title, 
titles.from_date, 
titles.to_date
into retirement_titles
from employees as emp
INNER JOIN titles
        ON (emp.emp_no = titles.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO Unique_Titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


-- Create rating_titles table
select count(title), title
into rating_titles
from Unique_Titles
group by title
order by count(title) desc;


-- Create mentorship_elgibility table
select DISTINCT on (emp.emp_no) emp.emp_no, 
emp.first_name, 
emp.last_name, 
emp.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO metorship_eligi
from employees as emp
INNER JOIN dept_emp
        ON (emp.emp_no = dept_emp.emp_no)
INNER JOIN titles
        on (emp.emp_no = titles.emp_no)
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by emp_no


select count(title), title
into metor_number
from metorship_eligi
group by title
order by count(title) desc;