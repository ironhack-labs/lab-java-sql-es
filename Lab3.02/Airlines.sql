CREATE SCHEMA Airlines;

CREATE TABLE Status (
    status_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(255) NOT NULL
);

CREATE TABLE Customer (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status INT NOT NULL,
    FOREIGN KEY (customer_status) REFERENCES Status(status_id)
);

CREATE TABLE Aircraft (
    aircraft_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    aircraft_type VARCHAR(255) NOT NULL
);

CREATE TABLE Flight (
    flight_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    aircraft_id INT NOT NULL,
    flight_number VARCHAR(255) NOT NULL,
    total_aircraft_seats INT NOT NULL,
    flight_mileage INT NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Mileage (
    mileage_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    flight_id INT NOT NULL,
    total_customer_mileage INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

INSERT INTO Status (status_name) VALUES
    ('SILVER'),
    ('GOLD'),
    ('NONE');

INSERT INTO Customer (customer_name, customer_status) VALUES
    ('Agustine Riviera', 1),
    ('Alaina Sepulvida', 3),
    ('Tom Jones', 2),
    ('Sam Rio', 3),
    ('Jessica James', 1),
    ('Ana Janco', 1),
    ('Jennifer Cortez', 2),
    ('Christian Janco', 1);

INSERT INTO Aircraft (aircraft_type) VALUES
    ('Boeing 747'),
    ('Airbus A330'),
    ('Boeing 777');

INSERT INTO Flight (aircraft_id, flight_number, total_aircraft_seats, flight_mileage) VALUES
    (1, 'DL143', 400, 135),
    (2, 'DL122', 236, 4370),
    (3, 'DL53', 264, 2078),
    (3, 'DL222', 264, 1765),
    (1, 'DL37', 400, 531);

INSERT INTO Mileage (customer_id, flight_id, total_customer_mileage) VALUES
    (1, 1, 115235),
    (1, 2, 115235),
    (2, 2, 6008),
    (3, 2, 205767),
    (3, 3, 205767),
    (4, 1, 2653),
    (3, 4, 205767),
    (5, 1, 127656),
    (6, 4, 136773),
    (7, 4, 300582),
    (5, 2, 127656),
    (4, 5, 2653),
    (8, 4, 14642);

-- 3. En la base de datos de aerolíneas escriba el script SQL para obtener el número total de vuelos en la base de datos.

SELECT COUNT(*) AS total_flights FROM Mileage;

-- 4. En la base de datos de aerolíneas escriba el script SQL para obtener
-- la distancia promedio de vuelo.

SELECT AVG(flight_mileage) AS average_distance FROM Flight;

-- 5. En la base de datos de aerolíneas escriba el script SQL para obtener
-- el número promedio de asientos.

SELECT AVG(total_aircraft_seats) AS average_seats FROM Flight;

-- 6. En la base de datos de aerolíneas escriba el script SQL para obtener
-- el número promedio de millas voladas por los clientes agrupados por estatus.

SELECT status_name, AVG(total_customer_mileage) AS average_mileage FROM Mileage
    INNER JOIN Customer ON Mileage.customer_id = Customer.customer_id
    INNER JOIN Status ON Customer.customer_status = Status.status_id GROUP BY status_name;

-- 7. En la base de datos de aerolíneas escriba el script SQL para obtener
-- el número máximo de millas voladas por los clientes agrupados por estatus.

SELECT status_name, MAX(total_customer_mileage) AS max_mileage FROM Mileage
    INNER JOIN Customer ON Mileage.customer_id = Customer.customer_id
    INNER JOIN Status ON Customer.customer_status = Status.status_id GROUP BY status_name;

-- 8. En la base de datos de aerolíneas escriba el script SQL para obtener
-- el número total de aeronaves con un nombre que contiene Boeing.

SELECT COUNT(*) AS total_boeing_aircraft FROM Aircraft WHERE aircraft_type LIKE '%Boeing%';

-- 9. En la base de datos de aerolíneas escriba el script SQL para encontrar
-- todos los vuelos con una distancia entre 300 y 2000 millas.

-- SELECT flight_number, COUNT(*) FROM Flight WHERE flight_mileage BETWEEN 300 AND 2000 GROUP BY flight_number;

SELECT * FROM Flight WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10. En la base de datos de aerolíneas escriba el script SQL para encontrar
-- la distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión).

SELECT status_name, AVG(flight_mileage) AS average_flight_mileage FROM Mileage
    INNER JOIN Customer ON Mileage.customer_id = Customer.customer_id
    INNER JOIN Status ON Customer.customer_status = Status.status_id
    INNER JOIN Flight ON Mileage.flight_id = Flight.flight_id GROUP BY status_name;

-- 11. En la base de datos de aerolíneas escriba el script SQL para encontrar
-- la aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión).

SELECT Flight.aircraft_id, Aircraft.aircraft_type AS most_reserved_aircraft, COUNT(*) AS resevation FROM Customer
    INNER JOIN Status ON Customer.customer_status = Status.status_id
    INNER JOIN Mileage ON Customer.customer_id = Mileage.customer_id
    INNER JOIN Flight ON Mileage.flight_id = Flight.flight_id
    INNER JOIN Aircraft ON Flight.aircraft_id = Aircraft.aircraft_id
    WHERE status_name = 'GOLD' GROUP BY Flight.aircraft_id, Aircraft.aircraft_type ORDER BY resevation DESC LIMIT 1;