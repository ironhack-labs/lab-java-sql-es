CREATE TABLE authors (
                         author_id INT NOT NULL AUTO_INCREMENT,
                         name VARCHAR(255) NOT NULL,
                         PRIMARY KEY (author_id)
);

CREATE TABLE posts (
                       post_id INT NOT NULL AUTO_INCREMENT,
                       title VARCHAR(255) NOT NULL,
                       word_count INT NOT NULL,
                       views INT NOT NULL,
                       author_id INT,
                       PRIMARY KEY (post_id),
                       FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO authors (name) VALUES
                               ('Maria Charlotte'),
                               ('Juan Perez'),
                               ('Gemma Alcocer');

INSERT INTO posts (title, word_count, views, author_id) VALUES
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);

CREATE TABLE customers (
                           customer_id INT NOT NULL AUTO_INCREMENT,
                           name VARCHAR(255) NOT NULL,
                           status VARCHAR(50),
                           PRIMARY KEY (customer_id)
);

CREATE TABLE aircrafts (
                           aircraft_id INT NOT NULL AUTO_INCREMENT,
                           type VARCHAR(255) NOT NULL,
                           total_seats INT NOT NULL,
                           PRIMARY KEY (aircraft_id)
);

CREATE TABLE flights (
                         flight_id INT NOT NULL AUTO_INCREMENT,
                         flight_number VARCHAR(50) NOT NULL,
                         mileage INT NOT NULL,
                         aircraft_id INT,
                         PRIMARY KEY (flight_id),
                         FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);

CREATE TABLE customer_flights (
                                  customer_id INT,
                                  flight_id INT,
                                  total_customer_mileage INT,
                                  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                                  FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

INSERT INTO customers (name, status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT INTO aircrafts (type, total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO flights (flight_number, mileage, aircraft_id) VALUES
('DL143', 135, 1),
('DL122', 4370, 2),
('DL53', 2078, 3),
('DL222', 1765, 3),
('DL37', 531, 1);

INSERT INTO customer_flights (customer_id, flight_id, total_customer_mileage) VALUES
((SELECT customer_id FROM customers WHERE name = 'Agustine Riviera'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143'), 115235),
((SELECT customer_id FROM customers WHERE name = 'Agustine Riviera'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122'), 115235),
((SELECT customer_id FROM customers WHERE name = 'Alaina Sepulvida'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122'), 6008),
((SELECT customer_id FROM customers WHERE name = 'Tom Jones'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122'), 205767),
((SELECT customer_id FROM customers WHERE name = 'Tom Jones'), (SELECT flight_id FROM flights WHERE flight_number = 'DL53'), 205767),
((SELECT customer_id FROM customers WHERE name = 'Tom Jones'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222'), 205767),
((SELECT customer_id FROM customers WHERE name = 'Sam Rio'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143'), 2653),
((SELECT customer_id FROM customers WHERE name = 'Jessica James'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143'), 127656),
((SELECT customer_id FROM customers WHERE name = 'Sam Rio'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143'), 2653),
((SELECT customer_id FROM customers WHERE name = 'Ana Janco'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222'), 136773),
((SELECT customer_id FROM customers WHERE name = 'Jennifer Cortez'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222'), 300582),
((SELECT customer_id FROM customers WHERE name = 'Jessica James'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122'), 127656),
((SELECT customer_id FROM customers WHERE name = 'Sam Rio'), (SELECT flight_id FROM flights WHERE flight_number = 'DL37'), 2653),
((SELECT customer_id FROM customers WHERE name = 'Christian Janco'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222'), 14642);

-- Nº total de vuelos:
SELECT COUNT(DISTINCT flight_number) AS total_flights FROM flights;

-- Distancia promedio de vuelo:
SELECT AVG(mileage) AS average_flight_distance FROM flights;

-- Nº promedio de asientos:
SELECT AVG(total_seats) AS average_seats FROM aircrafts;

-- Nº promedio de millas voladas/clientes- por estatus:
SELECT
    c.status AS customer_status,
    MAX(cf.total_customer_mileage) AS max_miles
FROM
    customers c
        JOIN
    customer_flights cf ON c.customer_id = cf.customer_id
GROUP BY
    c.status;

-- Nº total de aeronaves Boeing:
SELECT COUNT(*) AS total_boeing_aircrafts FROM aircrafts WHERE type LIKE '%Boeing%';

-- Vuelos entre 300 y 2000 millas:
SELECT * FROM flights WHERE mileage BETWEEN 300 AND 2000;

-- Distancia promedio de vuelo reservada por estatus/cliente:
SELECT
    c.status AS customer_status,
    AVG(f.mileage) AS average_flight_distance
FROM
    customers c
        JOIN
    customer_flights cf ON c.customer_id = cf.customer_id
        JOIN
    flights f ON cf.flight_id = f.flight_id
GROUP BY
    c.status;

-- Aeronave + reservada por miembros oro:
SELECT
    a.type AS aircraft_type,
    COUNT(*) AS reservation_count
FROM
    customers c
        JOIN
    customer_flights cf ON c.customer_id = cf.customer_id
        JOIN
    flights f ON cf.flight_id = f.flight_id
        JOIN
    aircrafts a ON f.aircraft_id = a.aircraft_id
WHERE
    c.status = 'Gold'
GROUP BY
    a.type
ORDER BY
    reservation_count DESC
LIMIT 1;

