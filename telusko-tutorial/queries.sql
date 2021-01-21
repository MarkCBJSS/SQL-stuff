-- SQL to create the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.beekeeperstudio.io/ and https://www.mysql.com/products/workbench/
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

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