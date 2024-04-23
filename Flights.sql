CREATE TABLE Customers (
                           customer_id INT AUTO_INCREMENT PRIMARY KEY,
                           customer_name VARCHAR(255) NOT NULL,
                           customer_status VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Aircrafts (
                                         aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
                                         aircraft_type VARCHAR(255) UNIQUE NOT NULL
);

INSERT IGNORE INTO Aircrafts (aircraft_type) VALUES
                                                 ('Boeing 747'),
                                                 ('Airbus A330'),
                                                 ('Boeing 777');

CREATE TABLE IF NOT EXISTS Flights (
                                       flight_id INT AUTO_INCREMENT PRIMARY KEY,
                                       flight_number VARCHAR(255) UNIQUE NOT NULL,
                                       aircraft_id INT NOT NULL,
                                       total_aircraft_seats INT,
                                       flight_mileage INT,
                                       total_customer_mileage INT,
                                       customer_id INT,
                                       FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id)
);
CREATE UNIQUE INDEX unique_flight ON Flights(flight_number, aircraft_id, flight_mileage, total_customer_mileage);

INSERT INTO Customers (customer_id, customer_name, customer_status)  VALUES
                                                                         (1,'Agustine Riviera', 'Silver'),
                                                                         (2,'Sam Rio', 'None'),
                                                                         (3,'Alaina Sepulvida', 'None'),
                                                                         (4,'Jessica James', 'Silver'),
                                                                         (5,'Tom Jones', 'Gold'),
                                                                         (6,'Ana Janco', 'Silver'),
                                                                         (7,'Christian Janco', 'Silver'),
                                                                         (8,'Jennifer Cortez', 'Gold');

INSERT INTO Flights (flight_number, aircraft_id, total_aircraft_seats, flight_mileage, total_customer_mileage, customer_id)
VALUES
    ('DL143', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 135, 115235, 1),
    ('DL122', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Airbus A330'), 236, 4370, 115235, 1),
    ('DL122', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Airbus A330'), 236, 4370, 6008, 3),
    ('DL143', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 135, 115235, 1),
    ('DL122', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Airbus A330'), 236, 4370, 205767, 5),
    ('DL53', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 777'), 264, 2078, 205767, 5),
    ('DL143', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 135, 115235, 1),
    ('DL143', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 135, 2653, 2),
    ('DL143', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 135, 115235, 1),
    ('DL222', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 777'), 264, 1765, 205767, 5),
    ('DL143', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 135, 127656, 4),
    ('DL37', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 531, 2653, 2),
    ('DL222', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 777'), 264, 1765, 136773, 6),
    ('DL222', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 777'), 264, 1765, 300582, 8),
    ('DL122', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Airbus A330'), 236, 4370, 127656, 4),
    ('DL222', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 777'), 264, 1765, 14642, 7),
    ('DL37', (SELECT aircraft_id FROM Aircrafts WHERE aircraft_type = 'Boeing 747'), 400, 531, 2653, 2)
ON DUPLICATE KEY UPDATE flight_number = flight_number;

SELECT COUNT(*) AS total_flights
FROM Flights;

SELECT AVG(flight_mileage) AS avg_flight_distance
FROM Flights;

SELECT ROUND(AVG(total_aircraft_seats)) AS avg_seats
FROM Flights;

SELECT customer_status, ROUND(AVG(total_customer_mileage)) AS average_mileage
FROM Customers
         JOIN Flights ON Customers.customer_id = Flights.customer_id
GROUP BY customer_status;


SELECT customer_status, MAX(total_customer_mileage) AS max_mileage
FROM Customers
         JOIN Flights ON Customers.customer_id = Flights.customer_id
GROUP BY customer_status;

SELECT COUNT(*) AS total_boeing_aircraft
FROM Aircrafts
WHERE aircraft_type LIKE '%Boeing%';

SELECT *
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT c.customer_status, AVG(f.flight_mileage) AS avg_regular_flight_distance
FROM Customers c
         JOIN Flights f ON c.customer_id = f.customer_id
GROUP BY c.customer_status

UNION
SELECT c.customer_status, AVG(f.flight_mileage) AS avg_flight_distance
FROM Customers c
         JOIN Flights f ON c.customer_id = f.customer_id
GROUP BY c.customer_status;

WITH GoldMemberFlights AS (
    SELECT f.aircraft_id, COUNT(*) AS reservation_count
    FROM Flights f
             JOIN Customers c ON f.customer_id = c.customer_id
    WHERE c.customer_status = 'Gold'
    GROUP BY f.aircraft_id
),
     MaxReservation AS (
         SELECT MAX(reservation_count) AS max_count
         FROM GoldMemberFlights
     )
SELECT a.aircraft_type
FROM GoldMemberFlights g
         JOIN Aircrafts a ON g.aircraft_id = a.aircraft_id
         JOIN MaxReservation m ON g.reservation_count = m.max_count;
