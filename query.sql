-- Check data

SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT employee.emp_no AS "Employee Number", 
  employee.first_name AS "First Name", 
  employee.last_name AS "Last Name", 
  employee.sex AS "Sex", 
  salary.salary AS "Salary"
FROM employees as employee
INNER JOIN salaries as salary ON
employee.emp_no = salary.emp_no
ORDER BY "Employee Number";

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employee.first_name AS "First Name", 
	employee.last_name AS "Last Name",
	employee.hire_date AS "Hire Date"
FROM employees as employee
WHERE
	hire_date > CAST('1985-12-31' as Date)
	AND hire_date < CAST('1987-01-01' as Date)
ORDER BY "Hire Date", "Last Name";

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT department.dept_no AS "Department Number",
	department.dept_name AS "Department Name",
	manager.emp_no AS "Employee Number",  
	employee.last_name AS "Last Name", 
	employee.first_name AS "First Name"
FROM departments as department
INNER JOIN dept_manager as manager ON
department.dept_no = manager.dept_no
INNER JOIN employees as employee ON
manager.emp_no = employee.emp_no
ORDER BY "Department Number", "Employee Number";

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT department.dept_no AS "Department Number",
	designation.emp_no AS "Employee Number",  
	employee.last_name AS "Last Name", 
	employee.first_name AS "First Name",
	department.dept_name AS "Department Name"
FROM departments as department
INNER JOIN dept_emp as designation ON
department.dept_no = designation.dept_no
INNER JOIN employees as employee ON
designation.emp_no = employee.emp_no
ORDER BY "Department Number", "Employee Number";

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employee.first_name AS "First Name", 
	employee.last_name AS "Last Name",
	employee.sex AS "Sex"
FROM employees as employee
WHERE
	first_name = 'Hercules'
	AND LEFT(last_name, 1) = 'B'
ORDER BY "Last Name";

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT department.dept_name AS "Department Name",
	designation.emp_no AS "Employee Number",  
	employee.last_name AS "Last Name", 
	employee.first_name AS "First Name"
FROM departments as department
INNER JOIN dept_emp as designation ON
department.dept_no = designation.dept_no
INNER JOIN employees as employee ON
designation.emp_no = employee.emp_no
WHERE
	dept_name = 'Sales'
ORDER BY "Employee Number";

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT department.dept_name AS "Department Name",
	designation.emp_no AS "Employee Number",  
	employee.last_name AS "Last Name", 
	employee.first_name AS "First Name"
FROM departments as department
INNER JOIN dept_emp as designation ON
department.dept_no = designation.dept_no
INNER JOIN employees as employee ON
designation.emp_no = employee.emp_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY "Department Name", "Employee Number";

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM employees
GROUP BY "Last Name"
ORDER BY "Count" DESC;