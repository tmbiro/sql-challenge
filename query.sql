-- Check data

SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT employee.emp_no, 
  employee.first_name, 
  employee.last_name, 
  employee.sex, 
  salary.salary
FROM employees as employee
INNER JOIN salaries as salary ON
employee.emp_no = salary.emp_no
ORDER BY emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employee.first_name, 
	employee.last_name,
	employee.hire_date
FROM employees as employee
WHERE
	hire_date > CAST('1985-12-31' as Date)
	AND hire_date < CAST('1987-01-01' as Date)
ORDER BY emp_no;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.



-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.



-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.



-- List each employee in the Sales department, including their employee number, last name, and first name.



-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.



-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).