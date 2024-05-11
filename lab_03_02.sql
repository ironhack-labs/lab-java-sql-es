-- Ejercicio 1 --
DROP SCHEMA IF EXISTS webpost;
CREATE SCHEMA webpost;

USE webpost;

CREATE TABLE author
(
    id   INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE post
(
    id         INT NOT NULL AUTO_INCREMENT,
    name       VARCHAR(255),
    word_count INT,
    views      INT,
    author_id  INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id)
        REFERENCES author (id)
);

-- Ejercicio 2 --
DROP SCHEMA IF EXISTS airline;
CREATE SCHEMA airline;
USE airline;

CREATE TABLE aircraft
(
    model VARCHAR(100) NOT NULL,
    seats INT,
    PRIMARY KEY (model)
);

CREATE TABLE flight
(
    number   VARCHAR(20) NOT NULL,
    mileage  BIGINT,
    aircraft VARCHAR(100),
    PRIMARY KEY (number),
    FOREIGN KEY (aircraft) REFERENCES aircraft (model)
);

CREATE TABLE customer
(
    id      INT NOT NULL AUTO_INCREMENT,
    name    VARCHAR(255),
    status  ENUM ('None', 'Silver', 'Gold'),
    mileage INT,
    PRIMARY KEY (id)
);

CREATE TABLE registry
(
    id            INT NOT NULL AUTO_INCREMENT,
    customer_id   INT,
    flight_number VARCHAR(20),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (flight_number) REFERENCES flight (number)
);

INSERT INTO aircraft(model, seats)
VALUES ('Boeing 747', 400),
       ('Airbus A330', 236),
       ('Boeing 777', 264);

INSERT INTO flight(number, mileage, aircraft)
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
-- 3.
SELECT COUNT(*) FROM flight;
-- 4.
SELECT AVG(mileage) FROM flight;
-- 5.
SELECT AVG(seats) FROM aircraft;
-- 6. 
SELECT status, AVG(mileage)
FROM customer
GROUP BY status;
-- 7. 
SELECT status, MAX(mileage)
FROM customer
GROUP BY status;
-- 8.
SELECT COUNT(*)
FROM aircraft
WHERE model LIKE 'Boeing%';
-- 9. 
SELECT *
FROM flight
WHERE mileage BETWEEN 300 AND 2000;
-- 10. 
SELECT AVG(fli.mileage), cus.status
FROM registry AS reg
JOIN (customer AS cus, flight AS fli) ON (reg.customer_id = cus.id AND reg.flight_number = fli.number)
GROUP BY cus.status;
-- 11. 
SELECT MAX(aircraft)
FROM registry AS reg
JOIN (customer AS cus, flight AS fli) ON (reg.customer_id = cus.id AND reg.flight_number = fli.number)
WHERE cus.status = 'Gold';
