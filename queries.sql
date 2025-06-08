SELECT*FROM CUSTOMERS;

SELECT*FROM order_details
WHERE PRICE>20000;

SELECT*FROM order_details
WHERE PRICE>50000;

SELECT * FROM products
order by price desc;

SELECT customer_id, COUNT(*) AS total_price 
FROM orders 
GROUP BY customer_id;

SELECT SUM(total_price) AS total_amount 
FROM orders;

SELECT AVG(total_price) AS average_order_value 
FROM orders;

SELECT name, email 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id FROM orders WHERE total_price > 50000
);

CREATE VIEW customer_orders AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

