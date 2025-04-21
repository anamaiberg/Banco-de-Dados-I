-- 1
SELECT r.region_name, c.country_name
FROM regions r
JOIN countries c ON r.region_id = c.region_id;

-- 2
SELECT d.department_name, l.city, e.first_name || ' ' || e.last_name AS manager_name, e.phone_number
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN employees e ON d.manager_id = e.employee_id;

-- 3
SELECT e.first_name || ' ' || e.last_name AS employee_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

-- 4
SELECT e.first_name || ' ' || e.last_name AS employee_name, jh.start_date, jh.end_date, j.job_title
FROM job_history jh
JOIN employees e ON jh.employee_id = e.employee_id
JOIN jobs j ON jh.job_id = j.job_id;

-- 5
SELECT e.first_name || ' ' || e.last_name AS employee_name, e.salary, 
       m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 6
SELECT e.first_name || ' ' || e.last_name AS employee_name, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
ORDER BY employee_name;

-- 7
SELECT e.first_name || ' ' || e.last_name AS employee_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.first_name LIKE '%A%' OR e.last_name LIKE '%A%';

-- 8
SELECT e.first_name || ' ' || e.last_name AS employee_name, j.job_title, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN jobs j ON e.job_id = j.job_id
WHERE l.city IN ('Tokyo', 'Roma', 'Oxford', 'Munich');

-- 9
SELECT e.first_name || ' ' || e.last_name AS employee_name, e.employee_id AS Nr_funcionario,
       m.first_name || ' ' || m.last_name AS manager_name, m.employee_id AS Nr_gerente
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 10
SELECT e1.department_id, e1.first_name || ' ' || e1.last_name AS employee_name,
       e2.first_name || ' ' || e2.last_name AS colleague_name
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id AND e1.employee_id != e2.employee_id
ORDER BY e1.department_id;

-- 11
SELECT m.first_name || ' ' || m.last_name AS manager_name, d.department_name, l.city
FROM departments d
JOIN employees m ON d.manager_id = m.employee_id
JOIN locations l ON d.location_id = l.location_id
ORDER BY l.city;

-- 12
SELECT DISTINCT job_title
FROM jobs;

-- 13
SELECT first_name || ' ' || last_name AS employee_name, salary
FROM employees
WHERE salary > 3850;

-- 14
SELECT first_name || ' ' || last_name AS employee_name, salary
FROM employees
WHERE salary NOT BETWEEN 1500 AND 2850;

-- 15
SELECT first_name || ' ' || last_name AS employee_name, job_title, hire_date
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE hire_date BETWEEN TO_DATE('20-FEB-1981', 'DD-MON-YYYY') 
                     AND TO_DATE('01-MAY-1981', 'DD-MON-YYYY')
ORDER BY hire_date;

-- 16
SELECT e.first_name || ' ' || e.last_name AS employee_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (10, 30)
ORDER BY e.first_name;

-- 17
SELECT e.first_name || ' ' || e.last_name AS Funcionario, e.salary AS Salario_Mensal
FROM employees e
WHERE e.salary > 1500 AND e.department_id IN (10, 30);

-- 18
SELECT first_name || ' ' || last_name AS employee_name, job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE manager_id IS NULL;

-- 19
SELECT first_name || ' ' || last_name AS employee_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- 20
SELECT first_name || ' ' || last_name AS employee_name
FROM employees
WHERE (first_name LIKE '%S%S%' OR last_name LIKE '%S%S%') 
  AND (department_id = 30 OR manager_id = 103);

-- 21
SELECT e.first_name || ' ' || e.last_name AS employee_name, j.job_title, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title IN ('Programmer', 'Marketing Manager', 'Marketing Representative')
  AND e.salary NOT IN (1000, 3000, 5000);

-- 22
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 5000
ORDER BY d.department_name;

-- 23
SELECT j.job_title, MAX(e.salary) AS "Mais alto por função"
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title
HAVING MAX(e.salary) <= 10000
ORDER BY MAX(e.salary);

-- 24
SELECT j.job_title, AVG(e.salary) AS "Média de salário por função"
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
WHERE j.job_title LIKE '%Manager%'
GROUP BY j.job_title
ORDER BY AVG(e.salary);

-- 25
SELECT job_title, AVG(salary) AS "Média de salário por função"
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE job_title LIKE '%Manager%'
GROUP BY job_title
HAVING AVG(salary) BETWEEN 10500 AND 12500;

-- 26
SELECT d.department_name, COUNT(*) AS num_managers
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.job_id LIKE '%Manager%'
GROUP BY d.department_name
HAVING COUNT(*) > 1;

-- 27
SELECT e.*, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary BETWEEN 5000 AND 7000 AND e.commission_pct IS NOT NULL
ORDER BY e.first_name;
