-- Gender Pay Gap Analysis
-- This set of queries shows the workings to derive a query that can show the Max, Min, Avg salaries for Males and Females.
-- Based on the free MySQL sample Employees database at: https://dev.mysql.com/doc/employee/en/
-- Please follow the Installation instructions on that page
-- Queries ran in Beekeeper Studio: https://www.beekeeperstudio.io/

-- How many salaries are there? (2844047)
select count(*) salary
from salaries;

-- Let's format that in slightly more readable manner (2,844,047.00)
select format(count(*),2) salary
from salaries;

-- Some of the to_date values are shown as 9999-01-01, let's exclude them as that looks like bad data (2,603,923.00)
-- We also alias the salaries table as t1 for brevity
select format(count(*),2) salary
from salaries as t1
where t1.to_date not in ('9999-01-01');

-- Let's find the Minimum, Maximum and Average salaries across the data set
-- We'll use a format and alias to help make results tidier as before
-- Result is Min: 38,735.00, Max: 157,821.00, Avg: 63,054.43
select
  format(min(salary),2) as 'Min',
  format(max(salary),2) as 'Max',
  format(avg(salary),2) as 'Avg'
from salaries as t1
where t1.to_date not in ('9999-01-01');

-- Now, we need to see who (male or female) are earning a given salary level
-- Gender is a column in the employees table, emp_no is a key in both the employees and salaries table
-- We'll do a join on the emp_no and pull the above data just for Males (M)
-- AS we're dealing with £, we'll concat the symbol onto the results
select
  concat("£",format(max(salary), 2)) as 'Max Salary',
  concat("£",format(avg(salary), 2)) as 'Avg. Salary',
  concat("£",format(min(salary), 2)) as 'Min. Salary',
  format(count(*), 2) as 'No. of Salaries',
  gender as 'Gender'
from
  salaries as t1
		join 
  employees as t2 
  		on
  t1.emp_no = t2.emp_no
where t2.gender = 'M'
  and t1.to_date not in ('9999-01-01');
  
-- With the above in place we can do the same for Famale(F)
-- A union will bring both results sets together
select
  concat("£",format(max(salary), 2)) as 'Max Salary',
  concat("£",format(avg(salary), 2)) as 'Avg. Salary',
  concat("£",format(min(salary), 2)) as 'Min. Salary',
  format(count(*), 2) as 'No. of Salaries',
  gender as 'Gender'
from
  salaries as t1
		join 
  employees as t2 
  		on
  t1.emp_no = t2.emp_no
where t2.gender = 'M'
  and t1.to_date not in ('9999-01-01')
  
union

select
  concat("£",format(max(salary), 2)) as 'Max Salary',
  concat("£",format(avg(salary), 2)) as 'Avg. Salary',
  concat("£",format(min(salary), 2)) as 'Min. Salary',
  format(count(*), 2) as 'No. of Salaries',
  gender as 'Gender'
from
  salaries as t1
		join 
  employees as t2 
  		on
  t1.emp_no = t2.emp_no
where t2.gender = 'F'
  and t1.to_date not in ('9999-01-01');

-- Final reasults set
-- Max Salary	   Avg. Salary	Min. Salary	 No. of Salaries	Gender
-- £157,821.00	 £63,081.13	  £38,735.00	 1,562,207.00	    M
-- £151,080.00	 £63,014.40	  £38,786.00	 1,041,716.00	    F
