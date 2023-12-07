USE sql_hr;

SELECT * FROM employees;

SELECT * FROM offices;

SELECT first_name, last_name, job_title, city
FROM employees
JOIN 
offices
ON employees.office_id = offices.office_id;

-- INNER JOIN in this case is office_id found in both tables so you can use JOIN to create that relationship
-- ON means to join colums together 

SELECT first_name, last_name, job_title, city
FROM employees
RIGHT JOIN
offices
ON employees.office_id = offices.office_id;

-- RIGHT JOIN is everything below and LEFT JOIN is everythign above





 