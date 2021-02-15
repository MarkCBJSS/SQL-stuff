-- SQL to query the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.mysql.com/products/workbench/ (NOT Oracle as in the tutorial)
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

-- Query 2: Find the Clerk with a salary of 5000 (Furedi)

-- Simple query
select emp_no as 'Employee No.', emp_name as 'Employee Name'
from employee
where designation = 'Clerk'
	and salary = 5000;

-- Nested sub-query (though the answer is found via the sub query)
select emp_no as 'Employee No.', emp_name as 'Employee Name'
from employee
where (designation, salary) in (
                        select designation, salary
						from employee
						where designation = 'Clerk'
							and salary = 5000);
