-- SQL to query the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.mysql.com/products/workbench/ (NOT Oracle as in the tutorial)
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

-- Query 4: Which designation has most number of employees

-- Max(count(*)) did not work in MySQL, hence the changes below
-- Though it appears redundant, every derived table must have its own alias
select designation as "Designation", count(*) as "Count"
from employee
group by designation
having count(*) = (
      select max(Total) as "Total"
		from (
      		select count(*) as Total
      		from employee
         	group by designation) as Results
		);