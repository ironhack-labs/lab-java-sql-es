-- Parte 1: Normalización de la base de datos de blog y creación de tablas

-- Crear Tabla de autores
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- Crearmos Tabla de publicaciones
CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Agregamos info las tablas
INSERT INTO authors (author_name) VALUES 
('Maria Charlotte'), 
('Juan Perez'), 
('Gemma Alcocer');

INSERT INTO posts (author_id, title, word_count, views) VALUES
((SELECT author_id FROM authors WHERE author_name = 'Maria Charlotte'), 'Best Paint Colors', 814, 14),
((SELECT author_id FROM authors WHERE author_name = 'Juan Perez'), 'Small Space Decorating Tips', 1146, 221),
((SELECT author_id FROM authors WHERE author_name = 'Maria Charlotte'), 'Hot Accessories', 986, 105),
((SELECT author_id FROM authors WHERE author_name = 'Maria Charlotte'), 'Mixing Textures', 765, 22),
((SELECT author_id FROM authors WHERE author_name = 'Juan Perez'), 'Kitchen Refresh', 1242, 307),
((SELECT author_id FROM authors WHERE author_name = 'Maria Charlotte'), 'Homemade Art Hacks', 1002, 193),
((SELECT author_id FROM authors WHERE author_name = 'Gemma Alcocer'), 'Refinishing Wood Floors', 1571, 7542);

-- Parte 2: Normalización de la base de datos de aerolíneas y creación de tablas

-- Creamos Tabla de clientes
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50) NOT NULL
);

-- Creamos Tabla de vuelos
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(50) NOT NULL,
    aircraft VARCHAR(255) NOT NULL,
    total_aircraft_seats INT NOT NULL,
    flight_mileage INT NOT NULL
);

-- Creamos Tabla de vuelos de clientes
CREATE TABLE customer_flights (
    customer_flight_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    total_customer_mileage INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

-- Agregamos Info a las tablas
INSERT INTO customers (customer_name, customer_status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT INTO flights (flight_number, aircraft, total_aircraft_seats, flight_mileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

INSERT INTO customer_flights (customer_id, flight_id, total_customer_mileage) VALUES
((SELECT customer_id FROM customers WHERE customer_name = 'Agustine Riviera'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL143' AND aircraft = 'Boeing 747'), 115235),
((SELECT customer_id FROM customers WHERE customer_name = 'Agustine Riviera'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL122' AND aircraft = 'Airbus A330'), 115235),
((SELECT customer_id FROM customers WHERE customer_name = 'Alaina Sepulvida'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL122' AND aircraft = 'Airbus A330'), 6008),
((SELECT customer_id FROM customers WHERE customer_name = 'Tom Jones'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL122' AND aircraft = 'Airbus A330'), 205767),
((SELECT customer_id FROM customers WHERE customer_name = 'Tom Jones'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL53' AND aircraft = 'Boeing 777'), 205767),
((SELECT customer_id FROM customers WHERE customer_name = 'Sam Rio'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL143' AND aircraft = 'Boeing 747'), 2653),
((SELECT customer_id FROM customers WHERE customer_name = 'Jessica James'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL143' AND aircraft = 'Boeing 747'), 127656),
((SELECT customer_id FROM customers WHERE customer_name = 'Ana Janco'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL222' AND aircraft = 'Boeing 777'), 136773),
((SELECT customer_id FROM customers WHERE customer_name = 'Jennifer Cortez'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL222' AND aircraft = 'Boeing 777'), 300582),
((SELECT customer_id FROM customers WHERE customer_name = 'Christian Janco'), 
 (SELECT flight_id FROM flights WHERE flight_number = 'DL222' AND aircraft = 'Boeing 777'), 14642);

-- Consultas SQL para la base de datos de aerolíneas

-- 3. Número total de vuelos
SELECT COUNT(*) AS total_vuelos FROM flights;

-- 4. Distancia promedio de vuelo
SELECT AVG(flight_mileage) AS distancia_promedio FROM flights;

-- 5. Número promedio de asientos
SELECT AVG(total_aircraft_seats) AS asientos_promedio FROM flights;

-- 6. Número promedio de millas voladas por los clientes agrupados por estatus
SELECT customer_status, AVG(total_customer_mileage) AS millas_promedio
FROM customers c
JOIN customer_flights cf ON c.customer_id = cf.customer_id
GROUP BY customer_status;

-- 7. Número máximo de millas voladas por los clientes agrupados por estatus
SELECT customer_status, MAX(total_customer_mileage) AS max_millas
FROM customers c
JOIN customer_flights cf ON c.customer_id = cf.customer_id
GROUP BY customer_status;

-- 8. Número total de aeronaves con un nombre que contiene "Boeing"
SELECT COUNT(DISTINCT aircraft) AS total_boeing
FROM flights
WHERE aircraft LIKE '%Boeing%';

-- 9. Vuelos con una distancia entre 300 y 2000 millas
SELECT * FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10. Distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión)
SELECT c.customer_status, AVG(f.flight_mileage) AS distancia_promedio
FROM customers c
JOIN customer_flights cf ON c.customer_id = cf.customer_id
JOIN flights f ON cf.flight_id = f.flight_id
GROUP BY c.customer_status;

-- 11. Aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión)
SELECT f.aircraft, COUNT(*) AS num_reservas
FROM customers c
JOIN customer_flights cf ON c.customer_id = cf.customer_id
JOIN flights f ON cf.flight_id = f.flight_id
WHERE c.customer_status = 'Gold'
GROUP BY f.aircraft
ORDER BY num_reservas DESC
LIMIT 1;
