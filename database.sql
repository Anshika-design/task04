CREATE DATABASE sales_report;

USE sales_report;

CREATE TABLE Customers(
   customer_id INT PRIMARY KEY auto_increment,
   name VARCHAR(100),
   email VARCHAR(255) UNIQUE,
   phone VARCHAR(15)
   );
   
   CREATE TABLE products(
		product_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150),
        price DECIMAL(10,2),
        category VARCHAR(100)
        );
        
	CREATE TABLE orders(
		order_id INT PRIMARY KEY AUTO_INCREMENT,
        customer_id INT,
        order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status VARCHAR(50) DEFAULT 'PENDING',
        total_price DECIMAL(10,2),
        FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
        );
        SHOW TABLES LIKE 'ORDERS';
 
	CREATE TABLE order_details(
      order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
      order_id INT primary KEY AUTO_INCREMENT,
      product_id INT primary KEY auto_increment,
      quantity INT,
      price DECIMAL(10,2),
      FOREIGN KEY (order_id) REFERENCES orders(order_id),
      FOREIGN KEY (product_id) REFERENCES products(product_id)
      );
      
      CREATE TABLE transactions(
		transaction_id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT auto_increment,
        payment_menthod VARCHAR(50),
        payment_status VARCHAR(50),
        amount DECIMAL(10,2),
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
        );
        SHOW TABLES LIKE 'transaction';

INSERT INTO customers (name, email, phone) 
VALUES
( 'ANSHIKA DHIMAN' , 'anshikadhman890@gmail.com', '6817462927'),
('ATHARV', 'anthavsharma292gmail.com','9420485769');


INSERT INTO products(name, price, category)
VALUES
('LAPTOP',38000,'ELECTRONICS'),
('MACBOOK',150000,'ELECTRONICS');
select*from products;

INSERT INTO orders (order_id,customer_id ,total_price)
VALUES
(23, 1, 40000),
(45,2, 200000);
delete from orders where order_id = 16;
select*from orders;

INSERT INTO order_details (order_id,quantity,product_id, price)
VALUES
(23,1,4,40000),
(45,1,3,200000);
delete from order_details where order_id = 13;
select*from order_details;

INSERT INTO transactions(transaction_id, payment_method, payment_status, amount)
VALUES
(905, 'online', 'paid',40000),
(906,'cash on delivery','pending', 200000);




