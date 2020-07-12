--1. create and fill in the database
--1.1. create titles table
DROP TABLE IF EXISTS titles;

CREATE TABLE titles(
title_id VARCHAR(255) not null primary key,
title VARCHAR(255)
);
--view titles table
select * from titles;

--1.2. create employees table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
emp_no float(10) not null primary key,
emp_title_id VARCHAR(255),
birth_date VARCHAR(255),	
first_name VARCHAR(255),
last_name VARCHAR(255),	
sex VARCHAR(1),
hire_date VARCHAR(255),
foreign key (emp_title_id) references titles(title_id)
);
--view employees table
SELECT * FROM employees;

--1.3. create salaries table
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries(
emp_no float(10),
salary float(10),
foreign key (emp_no) references employees(emp_no)
);
--view salaries table
SELECT * FROM salaries

--1.4. create departments table
DROP TABLE IF EXISTS departments;

CREATE TABLE departments(
dept_no VARCHAR(255) not null primary key,
dept_name VARCHAR(255)
);
--view departments table
select * from departments;

--1.5. create table dept_emp
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp(
emp_no float(10),
dept_no VARCHAR(255),
foreign key (emp_no) references employees(emp_no),	
foreign key (dept_no) references departments(dept_no)	
);
--view dep_emp table
select * from dept_emp;

--1.6. create table dept_emp
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager(
dept_no	VARCHAR(255),
emp_no float(10),
foreign key (emp_no) references employees(emp_no),	
foreign key (dept_no) references departments(dept_no)	
);
--view dept_manager table
select * from dept_manager;	

--2. questions
--2.1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2.1.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';
--ideally i would do it with DATA type extraction, but I was too late in the game
--to set up the hire_date like DATE type, so, used a work around :)

--3.1. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;