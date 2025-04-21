-- Parte I – Uso de operadores de comparação e de funções do tipo single-row

-- 1)
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS full_name
FROM employees
ORDER BY first_name, last_name;

-- 2)
SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper
FROM employees
ORDER BY last_name DESC;

-- 3)
SELECT *
FROM employees
ORDER BY department_id;

-- 4)
SELECT *
FROM employees
WHERE salary > 5000
ORDER BY last_name;

-- 5)
SELECT *
FROM employees
WHERE salary BETWEEN 3000 AND 6000
ORDER BY salary;

-- 6)
SELECT first_name, phone_number
FROM employees
WHERE department_id IN (10, 30);

-- 7)
SELECT hire_date, first_name, last_name
FROM employees
ORDER BY hire_date DESC;

-- 8)
SELECT *
FROM employees
WHERE  EXTRACT(YEAR FROM hire_date) BETWEEN 2001 AND 2005;

-- 9)
SELECT *
FROM employees
WHERE manager_id IS NULL OR commission_pct IS NULL;

-- 10)
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

-- 11)
SELECT DISTINCT job_id
FROM employees;

-- 12)
SELECT DISTINCT department_id
FROM employees
WHERE job_id LIKE '%MAN%' OR job_id LIKE '%MGR%';

-- 13)
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS full_name, LENGTH(CONCAT(CONCAT(first_name, ' '), last_name)) AS name_length
FROM employees
ORDER BY name_length;

-- 14)
SELECT *
FROM employees
WHERE first_name LIKE 'B%';

-- 15)
SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY salary DESC;

-- 16)
SELECT department_id, manager_id
FROM departments;

-- 17)
SELECT *
FROM employees
WHERE first_name LIKE 'B%' AND last_name LIKE '%n%';

-- 18)
SELECT 
    CONCAT(CONCAT(first_name, ' '), last_name) AS full_name, 
    (salary + IFNULL(commission_pct * salary, 0)) AS total_compensation
FROM employees
ORDER BY total_compensation DESC;

-- 19)
SELECT *
FROM employees
WHERE hire_date NOT BETWEEN '2000-01-01' AND '2002-12-31';

-- 20)
SELECT *
FROM employees
WHERE department_id IN (10, 30, 50, 80, 90);


-- 21)
SELECT 
    (SELECT CONCAT(CONCAT(first_name, ' '), last_name) 
     FROM employees 
     ORDER BY first_name, last_name 
     LIMIT 1) AS first_employee,
     
    (SELECT CONCAT(CONCAT(first_name, ' '), last_name) 
     FROM employees 
     ORDER BY first_name DESC, last_name DESC 
     LIMIT 1) AS last_employee;

-- 22)
SELECT first_name, last_name, EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM hire_date) AS years_in_company
FROM employees;



-- Parte II – uso de funções agregadas

-- 1)
SELECT SUM(salary) AS total_payroll
FROM employees;

-- 2)
SELECT COUNT(*) AS total_employees
FROM employees;

-- 3)
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees;

-- 4)
SELECT AVG(salary) AS average_salary
FROM employees;

-- 5)
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees
WHERE department_id = 80;



-- Parte III – uso do GROUP BY e HAVING

-- 1)
SELECT department_id, SUM(salary) AS total_payroll
FROM employees
GROUP BY department_id;

-- 2)
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

-- 3)
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

-- 4)
SELECT department_id, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id;

-- 5)
SELECT department_id, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id
HAVING MIN(salary) < 5000;

-- 6)
SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;

-- 7)
SELECT job_id, COUNT(*) AS total_employees
FROM employees
GROUP BY job_id;

-- 8)
SELECT job_id, COUNT(*) AS total_employees
FROM employees
GROUP BY job_id;

-- 9)
SELECT job_id, AVG(salary) AS average_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id;

-- 10)
SELECT job_id, AVG(salary) AS average_salary
FROM employees
GROUP BY job_id
HAVING AVG(salary) <= 5000;