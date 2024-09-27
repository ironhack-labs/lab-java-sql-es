#2.Normalice la siguiente base de datos de aerolíneas y escriba los scripts DDL para crear las tablas de la base de datos:
CREATE DATABASE airline_database;
USE airline_database;

CREATE TABLE customers(
	customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR (200),
    customer_status VARCHAR (8),
    total_customer_milage INT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE booking(
	booking_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    flight_id INT NOT NULL,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
    ON DELETE CASCADE
);

CREATE TABLE flights(
	flight_id INT NOT NULL AUTO_INCREMENT,
	flight_number VARCHAR(5),
    flight_milage INT,
    PRIMARY KEY (flight_id)
);

CREATE TABLE journeys(
	journey_id INT NOT NULL AUTO_INCREMENT,
	airplane_id INT NOT NULL,
    flight_id INT NOT NULL,
    PRIMARY KEY (journey_id),
    FOREIGN KEY (airplane_id) REFERENCES airplanes(airplane_id)
    ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
    ON DELETE CASCADE
);

CREATE TABLE airplanes(
	airplane_id INT NOT NULL AUTO_INCREMENT,
	aircraft VARCHAR(5),
    number_seats INT,
    PRIMARY KEY (airplane_id)
);

ALTER TABLE airplanes
MODIFY COLUMN aircraft VARCHAR(12);

INSERT INTO airplanes (aircraft, number_seats) VALUES 
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO flights (flight_number, flight_milage) VALUES 
('DL143', 135),
('DL122', 4370),
('DL53', 2078),
('DL222', 1765),
('DL37', 531);

INSERT INTO customers (customer_name, customer_status, total_customer_milage) VALUES 
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO journeys (airplane_id, flight_id) VALUES 
((SELECT airplane_id FROM airplanes WHERE aircraft = 'Boeing 747' AND number_seats = 400), (SELECT flight_id FROM flights WHERE flight_number = 'DL143')),
((SELECT airplane_id FROM airplanes WHERE aircraft = 'Airbus A330' AND number_seats = 236), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT airplane_id FROM airplanes WHERE aircraft = 'Boeing 777' AND number_seats = 264), (SELECT flight_id FROM flights WHERE flight_number = 'DL53')),
((SELECT airplane_id FROM airplanes WHERE aircraft = 'Boeing 777' AND number_seats = 264), (SELECT flight_id FROM flights WHERE flight_number = 'DL222')),
((SELECT airplane_id FROM airplanes WHERE aircraft = 'Boeing 747' AND number_seats = 400), (SELECT flight_id FROM flights WHERE flight_number = 'DL37'));

INSERT INTO booking (customer_id, flight_id) VALUES 
((SELECT customer_id FROM customers WHERE customer_name = 'Agustine Riviera'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM customers WHERE customer_name = 'Agustine Riviera'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM customers WHERE customer_name = 'Alaina Sepulvida'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM customers WHERE customer_name = 'Tom Jones'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM customers WHERE customer_name = 'Tom Jones'), (SELECT flight_id FROM flights WHERE flight_number = 'DL53')),
((SELECT customer_id FROM customers WHERE customer_name = 'Sam Rio'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM customers WHERE customer_name = 'Sam Rio'), (SELECT flight_id FROM flights WHERE flight_number = 'DL37')),
((SELECT customer_id FROM customers WHERE customer_name = 'Jessica James'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM customers WHERE customer_name = 'Jessica James'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM customers WHERE customer_name = 'Ana Janco'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222')),
((SELECT customer_id FROM customers WHERE customer_name = 'Jennifer Cortez'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222')),
((SELECT customer_id FROM customers WHERE customer_name = 'Christian Janco'), (SELECT flight_id FROM flights WHERE flight_number = 'DL222'));

#3.En la base de datos de aerolíneas escriba el script SQL para obtener el número total de vuelos en la base de datos.
SELECT COUNT(flight_id) AS total_flights FROM flights;

#4.En la base de datos de aerolíneas escriba el script SQL para obtener la distancia promedio de vuelo.
SELECT CAST(AVG(flight_milage) AS DECIMAL (5,2)) AS average_flights FROM flights;

#5. En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de asientos.
SELECT CAST(AVG(number_seats) AS DECIMAL (5,2)) AS average_seats FROM airplanes;

#6. En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de millas voladas por los clientes agrupados por estatus.
SELECT customer_status, CAST(AVG(total_customer_milage) AS DECIMAL (15,2)) AS mileage_average_by_status FROM customers GROUP BY customer_status;

#7. En la base de datos de aerolíneas escriba el script SQL para obtener el número máximo de millas voladas por los clientes agrupados por estatus.
SELECT customer_status, CAST(MAX(total_customer_milage) AS DECIMAL (15,2)) AS mileage_maximun_by_status FROM customers GROUP BY customer_status;

#8. En la base de datos de aerolíneas escriba el script SQL para obtener el número total de aeronaves con un nombre que contiene Boeing.
SELECT aircraft FROM airplanes WHERE aircraft LIKE 'Boeing%'; 

#9. En la base de datos de aerolíneas escriba el script SQL para encontrar todos los vuelos con una distancia entre 300 y 2000 millas.
SELECT flight_number, flight_milage AS mileage_between_300_and_2000 FROM flights WHERE flight_milage BETWEEN 300 AND 2000;

#10. En la base de datos de aerolíneas escriba el script SQL para encontrar la distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión).
SELECT c.customer_status, CAST(AVG(flight_milage) AS DECIMAL (15, 2)) AS flight_mileage_by_customer_status FROM booking b 
JOIN flights f ON b.flight_id = f.flight_id 
JOIN customers c ON b.customer_id = c.customer_id
GROUP BY c.customer_status;

#11. En la base de datos de aerolíneas escriba el script SQL para encontrar la aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión).
SELECT a.aircraft, COUNT(*) AS total_reservations
FROM booking b
JOIN customers c ON b.customer_id = c.customer_id
JOIN flights f ON b.flight_id = f.flight_id
JOIN journeys j ON f.flight_id = j.flight_id
JOIN airplanes a ON j.airplane_id = a.airplane_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft
ORDER BY total_reservations DESC
LIMIT 1;

SELECT * FROM customers;
SELECT * FROM flights;
SELECT * FROM airplanes;
SELECT * FROM booking;
SELECT * FROM journeys;