--1. create titles table
DROP TABLE IF EXISTS titles;

CREATE TABLE titles(
title_id VARCHAR(255) not null primary key,
title VARCHAR(255)
);
--view titles table
select * from titles;
--1. create employees table

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
emp_no float(10) not null primary key,
emp_title_id VARCHAR(255),
birth_date VARCHAR(255),	
first_name VARCHAR(255),
last_name VARCHAR(255),	
sex VARCHAR(1),
hire_date VARCHAR(255)
foreign key (emp_title_id) references titles(title_id)
);