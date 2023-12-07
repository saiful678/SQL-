USE world;

SELECT * FROM country;

SELECT count(*) FROM city WHERE CountryCode = 'USA';

SELECT * FROM country;

SELECT population, LifeExpectancy
FROM country 
WHERE name = 'Argentina';

SELECT LifeExpectancy 
FROM country
ORDER BY name ASC
LIMIT 1;

SELECT name
FROM city 
WHERE name LIKE 'f%'
LIMIT 25;

SELECT ID, Name, Population 
FROM city
LIMIT 10;

SELECT * FROM city 
WHERE population >2000000;

SELECT * FROM city 
WHERE name LIKE 'be%';

SELECT * FROM city 
WHERE population 
BETWEEN 500000 AND 1000000;

SELECT name, population FROM city 
ORDER BY population ASC
LIMIT 1;

SELECT * FROM country;

SELECT * FROM countrylanguage;

SELECT name, ((population/100)*percentage), language
FROM country
JOIN
countrylanguage
ON CountryCode = Code
WHERE name =  'Switzerland';

