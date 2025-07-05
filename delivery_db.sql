/*DML */

/*DDL */

CREATE DATABASE delivery_db;

USE delivery_db;

CREATE TABLE user(
id INT primary KEY auto_increment,
name VARCHAR (100) NOT NULL,
email VARCHAR (100) UNIQUE NOT NULL,
phone VARCHAR (20),
address VARCHAR (255) NOT NULL
);

CREATE TABLE restaurant (
id INT primary KEY auto_increment,
name VARCHAR(100) NOT NULL,
address VARCHAR (255) NOT NULL UNIQUE,
phone VARCHAR (20) NOT NULL 
);

DROP TABLE rstaurant;

CREATE TABLE products(
id INT PRIMARY KEY AUTO_INCREMENT,
restaurant_id INT NOT NULL,
name VARCHAR (100) NOT NULL,
description TEXT,
price DECIMAL (10,2) NOT NULL,
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
restaurant_id INT NOT NULL,
date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
estatus VARCHAR(50) DEFAULT 'Pendiente', -- EJ: Pendiente, En camino, Entregado, Cancelado
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE order_details (
id INT primary KEY auto_increment,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
unitary_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);
