USE store;

SELECT name,unit_price
FROM products;

SELECT count(DISTINCT customer_id) 
AS total_customers, state 
FROM customers
GROUP BY state;

INSERT INTO customers VALUES(
11,'James','sun', '1987-09-23','789-321-4356','8 range grove', 'charlotte','NC',567);

SELECT * FROM customers;

DELETE FROM order_items
WHERE order_id = 6;

DELETE FROM orders
WHERE order_id = 6;

SELECT * FROM customers
WHERE points >2000;

UPDATE products
SET quantity_in_stock = 50
WHERE product_id = 3;

SELECT orders.*, order_id, order_date, status, shipped_date
FROM customers
INNER JOIN 
orders
ON customers.customer_id = orders.customer_id
WHERE 
customers.customer_id = 7;

