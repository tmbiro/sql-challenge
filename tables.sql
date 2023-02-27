-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS titles CASCADE;
-- DROP TABLE IF EXISTS departments CASCADE;
-- DROP TABLE IF EXISTS employees CASCADE;

-- Create tables and identify keys

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR  NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date VARCHAR   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date VARCHAR   NOT NULL,
    PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

-- Import Data

COPY titles
FROM '/Users/Shared/SQL_data/sql-challenge/data/titles.csv'
DELIMITER ','
CSV HEADER;

COPY departments
FROM '/Users/Shared/SQL_data/sql-challenge/data/departments.csv'
DELIMITER ','
CSV HEADER;

COPY employees
FROM '/Users/Shared/SQL_data/sql-challenge/data/employees.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp
FROM '/Users/Shared/SQL_data/sql-challenge/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager
FROM '/Users/Shared/SQL_data/sql-challenge/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY salaries
FROM '/Users/Shared/SQL_data/sql-challenge/data/salaries.csv'
DELIMITER ','
CSV HEADER;

-- Check data

SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

