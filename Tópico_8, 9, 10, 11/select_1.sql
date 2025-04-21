-- Esquema Human Resources
-- 1)
select first_name, last_name from employees;

-- 2)
select first_name, last_name from employees order by first_name;

-- 3)
select first_name, last_name from employees order by first_name, last name desc;

-- 4)
select * from employees order by hiredate desc;

-- 5)
select first_name as nome, last_name as sobrenome from employees;

-- 6)
select concat(concat(first_name, ' '), last_name) as nome_completo from employees;

-- Esquema Sales History
-- 1)
select product_name from products where unitprice between 900 and 1200;

-- 2)
select product_name from products where unitprice between 20 and 50 and subcategory='Accessories';

-- 3)
select first_name, last_name, birthdate, marital_status, 
CONCAT(CONCAT(CONCAT(CUST_STREET_ADDRESS, ', '), CUST_POSTAL_CODE), CONCAT(', ', CUST_CITY))  AS Endereço  
from customers;

-- 4)
select * from customers where CUST_CITY='Sao Jose dos Campos' or CUST_CITY='Santos';

-- 5)
select * from customers where not marital_status='married' and CUST_STATE_PROVINCE='Sao Paulo';

-- 6)
select * from customers where 
EXTRACT(YEAR FROM CUST_DATE_OF_BIRTH) between 1940 and 1950 and marital_status='single';

-- 7)
select * from customers where 
EXTRACT(YEAR FROM CUST_DATE_OF_BIRTH) between 1940 and 1950 and marital_status='married' and credit_limit>3000;

-- 8)
select * from customers where not CUST_STATE_PROVINCE='Sao Paulo' and not CUST_STATE_PROVINCE='Santa Catarina';

-- 9)
select * from customers where CUST_STATE_PROVINCE='Santa Catarina' and not CUST_CITY='Blumenau' 
order by first_name;