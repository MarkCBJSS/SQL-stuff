-- SQL to query the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.mysql.com/products/workbench/ (NOT Oracle as in the tutorial)
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

-- Query 1: Find the Manager with the highest salary

-- Nested Query 1
-- The main query would return both managers (Salter and Upadhyaya)
-- The sub query then returns only the details of the manager with the max salary
select emp_no as 'Employee No.', emp_name as 'Employee Name'
from employee
where designation = 'Manager'
	and salary = (
      select max(salary)
      from employee
      where designation = 'Manager');

-- Nested Query 2
-- This query returns the same result as above (5 Upadhyaya)
-- Here we use an 'in', but instead of a list of given values, we derive them via the subquery
select emp_no as 'Employee No.', emp_name as 'Employee Name'
from employee
where (designation, salary) in (
                select designation, max(salary)
                from employee
                where designation = 'Manager');