# Parte 1 author Vs post

DROP SCHEMA if exists lab_sql;
CREATE SCHEMA lab_sql;

USE lab_sql;

CREATE TABLE author (
                        id INT NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255),
                        PRIMARY KEY (id)
);

CREATE TABLE post (
                      id INT NOT NULL AUTO_INCREMENT,
                      name VARCHAR(255),
                      word_count INT,
                      views INT,
                      PRIMARY KEY (id),
                      FOREIGN KEY (id)
                          REFERENCES author(id)
);

# Parte 2 DB aerolineas

# Normalice la siguiente base de datos de aerolíneas y escriba los scripts DDL para crear las tablas de la base de datos:

CREATE TABLE aircraft(
                         model VARCHAR(255) NOT NULL,
                         seats VARCHAR(255),
                         PRIMARY KEY (model)
);

CREATE TABLE flight(
                       flight_number VARCHAR(255) NOT NULL,
                       mileage INT,
                       aircraft VARCHAR(255),
                       PRIMARY KEY (flight_number),
                       FOREIGN KEY (aircraft)
                           REFERENCES aircraft(model)
);

CREATE TABLE customer(
                         id INT NOT NULL AUTO_INCREMENT,
                         name VARCHAR(255),
                         status ENUM ('None', 'Silver', 'Gold'),
                         mileage INT,
                         PRIMARY KEY (id)

);

CREATE TABLE registry(
                         id INT NOT NULL AUTO_INCREMENT,
                         customer_id INT,
                         flight_number VARCHAR(255),
                         PRIMARY KEY (id),
                         FOREIGN KEY (customer_id)
                             REFERENCES customer(id),
                         FOREIGN KEY (flight_number)
                             REFERENCES flight(flight_number)
);

# Inserir Datos:

INSERT INTO aircraft(model, seats)
VALUES ('Boeing 747', 400),
       ('Airbus A330', 236),
       ('Boeing 777', 264);

INSERT INTO flight(flight_number, mileage, aircraft)
VALUES ('DL143', 135, 'Boeing 747'),
       ('DL122', 4370, 'Airbus A330'),
       ('DL53', 2078, 'Boeing 777'),
       ('DL222', 1765, 'Boeing 777'),
       ('DL37', 531, 'Boeing 747');

INSERT INTO customer(name, status, mileage)
VALUES ('Agustine Riviera', 'Silver', 115235),
       ('Alaina Sepulvida', 'None', 6008),
       ('Tom Jones', 'Gold', 205767),
       ('Sam Rio', 'None', 2653),
       ('Jessica James', 'Silver', 127656),
       ('Ana Janco', 'Silver', 136773),
       ('Jennifer Cortez', 'Gold', 300582),
       ('Christian Janco', 'Silver', 14642);

INSERT INTO registry(customer_id, flight_number)
VALUES (1, 'DL143'),
       (1, 'DL122'),
       (2, 'DL122'),
       (1, 'DL143'),
       (3, 'DL122'),
       (3, 'DL53'),
       (1, 'DL143'),
       (4, 'DL143'),
       (1, 'DL143'),
       (3, 'DL222'),
       (5, 'DL143'),
       (4, 'DL143'),
       (6, 'DL222'),
       (7, 'DL222'),
       (5, 'DL122'),
       (4, 'DL37'),
       (8, 'DL222');

# Queries SQL
# En la base de datos de aerolíneas escriba el script SQL para obtener el número total de vuelos en la base de datos.
SELECT COUNT(*)
FROM flight;

# En la base de datos de aerolíneas escriba el script SQL para obtener la distancia promedio de vuelo.
SELECT AVG(flight.mileage)
FROM flight;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de asientos.
SELECT AVG(aircraft.seats)
FROM aircraft;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de millas voladas por los clientes agrupados por estatus.
SELECT status, AVG(customer.mileage)
FROM customer
GROUP BY status;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número máximo de millas voladas por los clientes agrupados por estatus.
SELECT status, MAX(customer.mileage)
FROM customer
GROUP BY status;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número total de aeronaves con un nombre que contiene Boeing.
SELECT *
FROM aircraft
WHERE model LIKE 'Boeing%';

# En la base de datos de aerolíneas escriba el script SQL para encontrar todos los vuelos con una distancia entre 300 y 2000 millas.
SELECT *
FROM flight
WHERE mileage BETWEEN 300 AND 2000;

# En la base de datos de aerolíneas escriba el script SQL para encontrar la distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión).
SELECT AVG(customer.mileage) , customer.status
FROM registry
    JOIN (customer,flight) ON (registry.customer_id = customer.id) AND (registry.flight_number = flight.flight_number)
GROUP BY customer.status;

# En la base de datos de aerolíneas escriba el script SQL para encontrar la aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión).
SELECT MAX(flight.aircraft)
FROM registry
    JOIN (customer, flight) ON (customer_id = customer.id AND registry.flight_number = flight.flight_number)
GROUP BY status = 'Gold';