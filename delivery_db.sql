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

INSERT INTO USER (name, email, phone, address) VALUES
('Mariana Paez', 'mariana.p@email.com', '315-1112233', 'Calle 80 # 70-30'),
('Ricardo Solis', 'ricardo.s@email.com', '316-4445566', 'Diagonal 45 # 12-34'),
('Valeria Luna', 'valeria.l@email.com', '317-7778899', 'Carrera 19 # 120-50, Apto 502');

INSERT INTO restaurant (name, address, phone) VALUES
('Pizza Paraíso', 'Calle Falsa 123, Ciudad Capital', '555-0101'),
('Sushi Express', 'Avenida Siempre Viva 456, Villa Sabor', '555-0102'),
('Taco Fiesta', 'Plaza Central 789, Pueblo Delicia', '555-0103');

INSERT INTO Products (restaurant_id, name, description, price) VALUES
(1, 'Pizza Hawaiana', 'Pizza con piña, jamón y queso mozzarella.', 25.50),
(1, 'Pizza Pepperoni', 'Clásica pizza de pepperoni con extra queso.', 22.00),
(1, 'Lasaña de Carne', 'Capas de pasta con salsa boloñesa y bechamel.', 28.00);

-- Productos de Sushi Express (restaurante_id = 2)
INSERT INTO Products (restaurant_id, name, description, price) VALUES
(2, 'Rollo California', 'Rollo de cangrejo, aguacate y pepino.', 18.00),
(2, 'Nigiri de Salmón', 'Finas lonjas de salmón sobre arroz de sushi.', 15.50),
(2, 'Yakimeshi Mixto', 'Arroz frito con verduras, pollo y camarón.', 21.00);

-- Productos de Taco Fiesta (restaurante_id = 3)
INSERT INTO Products (restaurant_id, name, description, price) VALUES
(3, 'Tacos al Pastor', 'Tres tacos de cerdo marinado con piña.', 16.00),
(3, 'Quesadilla de Champiñones', 'Tortilla de harina con queso y champiñones.', 14.00),
(3, 'Burrito de Carne Asada', 'Gran burrito con carne, frijoles y arroz.', 20.50);

INSERT INTO orders (user_id, restaurant_id, estatus) VALUES
(2, 3, 'En preparacion'); 

SET @ID_ORDER = LAST_INSERT_ID();

INSERT INTO order_details (order_id, product_id, quantity, unitary_price) VALUES 
(@ID_ORDER, 7, 2, 16.00),
(@ID_ORDER, 8, 1, 14.00);
 
-- Valeria Luna (user_id =  3) ha cambiado su numero de telefono 
UPDATE user SET phone = "32154863" WHERE id = 3;

-- El precio de Pizza Hawaiana ha subido.
UPDATE Products SET price = 5000 WHERE name = "Pizza Hawaina";
