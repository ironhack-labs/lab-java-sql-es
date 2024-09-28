CREATE TABLE aircraft
(
    models VARCHAR(255) PRIMARY KEY ,
    total_aircraftSeats INT
);

CREATE TABLE flights
(
    flight_number VARCHAR(255) PRIMARY KEY ,
    flight_mileage INT,
    aircraft VARCHAR(255),
    FOREIGN KEY(aircraft) REFERENCES aircraft(models)
);

CREATE TABLE customer
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    status VARCHAR(255),
    total_customer_mileage DECIMAL
);

CREATE TABLE bookings
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    customer_ID INT,
    flight_ID VARCHAR(255),
    FOREIGN KEY(flight_ID) REFERENCES flights(flight_number),
    FOREIGN KEY(customer_ID) REFERENCES customer(ID)
);

INSERT INTO aircraft(models, total_aircraftSeats)
VALUES('Boeing 747', 400),
      ('Boeing 777', 264),
      ('Airbus A330', 236);

INSERT INTO flights(flight_number, flight_mileage, aircraft)
VALUES('DL143',135,'Boeing 747'),
      ('DL122',4370, 'Airbus A330'),
      ('DL53', 2078, 'Boeing 777'),
      ('DL222', 1765, 'Boeing 777'),
      ('DL37', 531, 'Boeing 747');

INSERT INTO customer(name, status, total_customer_mileage)
VALUES('Agustine Riviera', 'Silver', 115235),
      ('Alaina Sepulvida', 'None', 6008),
      ('Tom Jones', 'Gold', 205767),
      ('Sam Rio', 'None', 2653),
      ('Jessica James', 'Silver', 127656),
      ('Ana Janco', 'Silver', 136773),
      ('Jennifer Cortez', 'Gold', 300582),
      ('Christian Janco', 'Silver', 14642);

INSERT INTO bookings(customer_ID, flight_ID)
VALUES(1, 'DL143'),
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

SELECT COUNT(*)
FROM flights;

SELECT AVG(flight_mileage)
FROM flights;

SELECT AVG(total_aircraftSeats)
FROM aircraft;

SELECT status, AVG(total_customer_mileage)
FROM customer
GROUP BY status;

SELECT status, MAX(total_customer_mileage)
FROM customer
GROUP BY status;

SELECT COUNT(*)
FROM aircraft
WHERE models LIKE '%Boeing%';

SELECT *
FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT c.status, AVG(f.flight_mileage) AS average_mileage
FROM customer c
         JOIN bookings b ON c.ID = b.customer_ID
         JOIN flights f ON b.flight_ID = f.flight_number
GROUP BY c.status;

SELECT f.aircraft, COUNT(*) AS total_reservations
FROM customer c
         JOIN bookings b ON c.ID = b.customer_ID
         JOIN flights f ON b.flight_ID = f.flight_number
WHERE c.status = 'Gold'
GROUP BY f.aircraft
ORDER BY total_reservations DESC
    LIMIT 1;