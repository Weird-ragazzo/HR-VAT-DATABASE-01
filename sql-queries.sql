CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id INT,
    salary DECIMAL(10,2),
    commission DECIMAL(5,2),
    manager_id INT,
    department_id INT
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE job_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, start_date)
);

INSERT INTO jobs VALUES (1, 'Software Engineer', 4000, 8000), (2, 'Manager', 6000, 12000);
INSERT INTO departments VALUES (1, 'IT', 'New York'), (2, 'HR', 'San Francisco');
INSERT INTO employees VALUES 
    (101, 'Alice', 'Brown', 'alice@example.com', '1234567890', '2018-06-12', 1, 7000, NULL, 201, 1),
    (102, 'Bob', 'Smith', 'bob@example.com', '1234567891', '2016-09-23', 2, 10000, 10, 201, 2),
    (103, 'Anson', 'Lee', 'anson@example.com', '1234567892', '2020-01-15', 1, 6500, NULL, 101, 1);
INSERT INTO job_history VALUES (101, '2016-01-01', '2018-06-11', 2, 2);


SELECT * FROM employees;

SELECT first_name, last_name, email FROM employees;

SELECT DISTINCT job_title FROM jobs;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT * FROM employees WHERE hire_date > '2015-01-01';

SELECT * FROM employees WHERE salary > 5000;

SELECT e.* FROM employees e JOIN jobs j ON e.job_id = j.job_id WHERE j.job_title LIKE '%Manager%';

SELECT * FROM employees WHERE first_name LIKE 'A%n';

SELECT * FROM employees WHERE commission IS NULL;

SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

SELECT AVG(salary) AS average_salary FROM employees;

SELECT department_id, COUNT(*) AS total_employees FROM employees GROUP BY department_id;

SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

SELECT first_name, YEAR(hire_date) AS hire_year FROM employees;

SELECT job_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees GROUP BY job_id;

SELECT e.first_name, e.last_name, d.department_name FROM employees e JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, j.job_title, d.location FROM employees e JOIN jobs j ON e.job_id = j.job_id JOIN departments d ON e.department_id = d.department_id;

SELECT d.department_name, COUNT(e.employee_id) AS employee_count FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_name;

SELECT e1.first_name, e1.last_name FROM employees e1 JOIN employees e2 ON e1.manager_id = e2.employee_id WHERE e1.job_id = e2.job_id;

SELECT DISTINCT e.first_name, e.last_name FROM employees e JOIN job_history jh ON e.employee_id = jh.employee_id;
