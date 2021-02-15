-- SQL to query the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.mysql.com/products/workbench/ (NOT Oracle as in the tutorial)
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

-- Query 3: Which designation has exactly 2 employees? (Designation)

select designation as "Designation", count(*) as "Count"
from employee
group by designation
having count(*) = 2;