--2. questions
--2.1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;

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

--4.1.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
JOIN departments 
on dept_emp.dept_no = departments.dept_no;

--5.1. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' and last_name LIKE 'B%'; 

--6.1. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
JOIN departments 
on dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7.1.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
JOIN departments 
on dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8.1.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) as "frequency count"
FROM employees
GROUP BY last_name
ORDER BY "frequency count" DESC;