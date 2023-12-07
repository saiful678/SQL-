CREATE DATABASE sql_hr;

USE sql_hr;

CREATE TABLE offices (
office_id int NOT NULL, 
address varchar(50) NOT NULL,
city varchar(50) NOT NULL,
state varchar(50) NOT NULL,
PRIMARY KEY (office_id)
);

INSERT INTO offices VALUES(
1,'12 High street', 'New York City', 'NY');

-- instead of a new insert line you can add a , after the bracket and add another brackcet and add info the same format

SELECT * FROM offices;

-- write query to enter two offcies into the office table 

INSERT INTO offices VALUES
(2, '19 Flow Street', 'Long Beach', 'CL'),
(3, '12 Mid Street', 'Olando', 'FL'); 

DELETE FROM offices 
WHERE office_id = 3;

-- deletes row number 3

SELECT * FROM offices;

INSERT INTO `offices` VALUES (3,'54 Northland Court','Richmond','VA');
INSERT INTO `offices` VALUES (4,'08 South Crossing','Cincinnati','OH');
INSERT INTO `offices` VALUES (5,'553 Maple Drive','Minneapolis','MN');
INSERT INTO `offices` VALUES (6,'23 North Plaza','Aurora','CO');
INSERT INTO `offices` VALUES (7,'9658 Wayridge Court','Boise','ID');
INSERT INTO `offices` VALUES (8,'9 Grayhawk Trail','New York City','NY');
INSERT INTO `offices` VALUES (9,'16862 Westend Hill','Knoxville','TN');
INSERT INTO `offices` VALUES (10,'4 Bluestem Parkway','Savannah','GA');

CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `reports_to` int DEFAULT NULL,
  `office_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employees_offices_idx` (`office_id`),
  KEY `fk_employees_employees_idx` (`reports_to`),
  CONSTRAINT `fk_employees_managers` FOREIGN KEY (`reports_to`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_employees_offices` FOREIGN KEY (`office_id`) REFERENCES `offices` (`office_id`) ON UPDATE CASCADE
);

INSERT INTO `employees` VALUES (37270,'Yovonnda','Magrannell','Executive Secretary',63996,NULL,10);
INSERT INTO `employees` VALUES (33391,'D\'arcy','Nortunen','Account Executive',62871,37270,1);
INSERT INTO `employees` VALUES (37851,'Sayer','Matterson','Pharmacist',98926,37270,1);
INSERT INTO `employees` VALUES (40448,'Mindy','Crissil','Pharmacist',94860,37270,1);
INSERT INTO `employees` VALUES (56274,'Keriann','Alloisi','Account Executive',110150,37270,1);
INSERT INTO `employees` VALUES (63196,'Alaster','Scutchin','Account Executive',32179,37270,2);
INSERT INTO `employees` VALUES (67009,'North','de Clerc','Pharmacist',114257,37270,2);
INSERT INTO `employees` VALUES (67370,'Elladine','Rising','Social Worker',96767,37270,2);
INSERT INTO `employees` VALUES (68249,'Nisse','Voysey','Account Executive',52832,37270,2);
INSERT INTO `employees` VALUES (72540,'Guthrey','Iacopetti','Office Assistant I',117690,37270,3);
INSERT INTO `employees` VALUES (72913,'Kass','Hefferan','Computer Systems Analyst',96401,37270,3);
INSERT INTO `employees` VALUES (75900,'Virge','Goodrum','Social Worker',54578,37270,3);
INSERT INTO `employees` VALUES (76196,'Mirilla','Janowski','Computer Systems Analyst',119241,37270,3);
INSERT INTO `employees` VALUES (80529,'Lynde','Aronson','Pharmacist',77182,37270,4);
INSERT INTO `employees` VALUES (80679,'Mildrid','Sokale','Computer Systems Analyst',67987,37270,4);
INSERT INTO `employees` VALUES (84791,'Hazel','Tarbert','General Manager',93760,37270,4);
INSERT INTO `employees` VALUES (95213,'Cole','Kesterton','Pharmacist',86119,37270,4);
INSERT INTO `employees` VALUES (96513,'Theresa','Binney','Pharmacist',47354,37270,5);
INSERT INTO `employees` VALUES (98374,'Estrellita','Daleman','Computer Systems Analyst',70187,37270,5);
INSERT INTO `employees` VALUES (115357,'Ivy','Fearey','Social Worker',92710,37270,5);

SELECT * FROM employees
WHERE employee_id = 33391;

SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 70000;

SELECT * FROM employees 
WHERE first_name = 'Nisse';

SELECT * FROM employees 
WHERE first_name LIKE 'M%';

-- search for names starting with a letter, example M

SELECT * FROM employees
WHERE job_title = 'Social Worker' AND office_id = 5;

SELECT * FROM employees
WHERE reports_to IS NULL;

SELECT * FROM offices
WHERE city ='New York City';

SELECT * FROM offices 
Where office_id = '6' or '9' or '5';

-- use or when searching mulitple values 

SELECT * FROM employees
WHERE first_name like '%e';

-- to search for last letter you swap the % e.g. e% or %e 

SELECT * FROM employees 
WHERE NOT office_id = 2;

-- all values that dont include office_id 2 

SET SQL_SAFE_UPDATES = 0;
DELETE FROM offices 
WHERE city = 'Boise';

UPDATE employees 
SET job_title = 'Social Worker', salary = 45786
WHERE employee_id = 33391;

-- set means what we want to change current values to, where used to specify employee ID

SELECT * FROM employees;

SELECT MAX(salary) FROM employees;

-- max used to find highest value in field such as salary and MIN to look for lowest

SELECT MIN(salary) AS 'lowest salary' FROM employees;

-- AS funtion adds a title 

SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

-- using function from 132 to find salary lowest than current as data updates

SELECT job_title, AVG(salary) AS 'average salary' FROM employees
GROUP BY job_title;

SELECT count(employee_id) FROM employees;
SELECT count(DISTINCT job_title) AS 'distinct job titles' FROM employees;

-- Distinct means no duplicate valies 

SELECT job_title, MAX(salary) FROM employees 
GROUP BY job_title;

SELECT job_title, last_name, salary FROM employees 
WHERE salary IN (SELECT MAX(salary) FROM employees
GROUP BY job_title);
