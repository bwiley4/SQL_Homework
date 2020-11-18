
--I had to use "" because of capital letters in my tables
--employee information
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name, 
employees.sex, 
salaries.salary
FROM "Employees" AS employees
JOIN "Salaries" AS salaries 
ON (employees.emp_no = salaries.emp_no);

--employees hired in 1986
SELECT
first_name
last_name
FROM "Employees"
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31'

--List of each Manager
SELECT  departmentman.dept_no,
departments.dept_name,
departmentman.emp_no,
employees.last_name,
employees.first_name
FROM "Dept_Manager" AS departmentman
JOIN "Departments" AS departments
ON (departmentman.dept_no = departments.dept_no)
JOIN "Employees" AS employees
ON (departmentman.emp_no = employees.emp_no);

-- department of each employee 
SELECT  employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM "Employees" AS employees
JOIN "Dept_EMP" AS deptemp
ON (employees.emp_no = deptemp.emp_no)
JOIN "Departments" AS departments
ON (deptemp.dept_no = departments.dept_no)
ORDER BY employees.emp_no;


-- employees who is named Hercules and last name starts with B
SELECT first_name, last_name, birth_date, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- sales department employees 
SELECT  employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM "Employees" AS employees
JOIN "Dept_EMP" AS deptemp
ON (employees.emp_no = deptemp.emp_no)
JOIN "Departments" AS departments
ON (deptemp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;


-- employees in sales/development departments
SELECT  employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM "Employees" AS employees
JOIN "Dept_EMP" AS deptemp
ON (employees.emp_no = deptemp.emp_no)
JOIN "Departments" AS departments
ON (deptemp.dept_no = departments.dept_no)
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

-- frequency of employee's last names
SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;