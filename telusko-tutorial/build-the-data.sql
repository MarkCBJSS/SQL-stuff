-- SQL to create the data sets from the tutorial by Telesko
-- https://www.youtube.com/watch?v=MdjmTSTQShc
-- Written by me, feel free to use as you wish.
-- !! Please note the tweaked column names and emp_name data when running scripts in the tutorial !!
-- ---------------------------------------------------------

-- Written for MySQL using https://www.beekeeperstudio.io/ and https://www.mysql.com/products/workbench/
-- Tweak any failures for your particular version of SQL
-- Each section is written to run on its own in sequence for simplicity of understanding

-- ---------------------------------------------------------

-- Create the database
create database telusko_emp;

-- Make sure we're using the correct database (you may need to select this is your workbench
use telusko_emp;

-- Set up the employee table
create table employee (
  emp_no int auto_increment primary key,
  emp_name varchar(255),
  designation varchar(255),
  salary float,
  role_id int,
  dept_no int
);

-- Set up the department table
create table department (
  dept_no int auto_increment primary key,
  dept_name varchar(255),
  dept_loc varchar(255)
);

-- Insert data into the employee table, except emp_no which auto increments
insert into
	employee (emp_name, designation, salary, role_id, dept_no)
values
	('Jones', 'Salesman', 7000, 2, 10),
	('Salter', 'Manager', 17000, 3, 10),
	('Cordoba', 'President', 40000, NULL, 30),
	('Furedi', 'Clerk', 5000, 5, 20),
	('Upadhyaya', 'Manager', 20000, 3, 20);

-- Insert data into the department table
insert into
	department (dept_name, dept_loc)
values
	('Sales', 'Mumbai'),
	('HR', 'London'),
	('Accounts', 'Paris'),
	('production', 'Madrid');

-- Optional Tear Down
drop database if exists telusko_emp;

select * from employee;
select * from department;