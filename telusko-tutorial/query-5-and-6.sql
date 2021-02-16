-- SQL to query the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.mysql.com/products/workbench/ (NOT Oracle as in the tutorial)
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

-- Query 5: What is the second highest salary

select (max(salary)) as "2nd Highest Salary"
from employee
    where salary < (
        select max(salary)
        from employee
        );

-- Query 6: Who gets this salary?

-- Outer query finds the employee who has the 2nd highest salary
select emp_no as "Employee No.", emp_name as "Employee Name"
from employee
where salary = ( -- inner query 1: Finds the MAX salary under the inner query MAX == 2nd highest
  select (max(salary)) as "2nd Highest Salary"
  from employee
      where salary < ( -- inner query 2: Finds the MAX salary
          select max(salary)
          from employee
          )
  );