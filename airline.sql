CREATE SCHEMA airline_data;

USE airline_data;

-- created a new schema and chose the schema to insert the tables to



-- the data needs to be devided into several tables

-- creating an aircrafts table
CREATE TABLE aircraft(
    aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
    aircraft_model VARCHAR(50),
    total_aircraft_seats INT
);


-- creating a flights table
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10),
    flight_mileage INT
);


-- creating customers table
CREATE TABLE customers (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_name VARCHAR(255),
    cust_status VARCHAR(10),
    total_cust_mileage INT,
    cust_flight_number VARCHAR(10)
);


---- inserting data into their respective tables


INSERT INTO aircraft (aircraft_model, total_aircraft_seats)
VALUES
    ('Boeing 747', 400),
    ('Airbus A330', 236),
    ('Boeing 777', 264);

INSERT INTO flights (flight_number, flight_mileage)
VALUES
    ('DL143', 135),
    ('DL122', 4370),
    ('DL53', 2078),
    ('DL222', 1765),
    ('DL37', 531);

INSERT INTO customers (cust_name, cust_status, total_cust_mileage, cust_flight_number)
VALUES
    ('Agustine Riviera', 'Silver', 115235, 'DL143'),
    ('Alaina Sepulvida', 'None', 6008, 'DL122'),
    ('Tom Jones', 'Gold', 205767, 'DL122'),
    ('Sam Rio', 'None', 2653, 'DL143'),
    ('Jessica James', 'Silver', 127656, 'DL143'),
    ('Ana Janco', 'Silver', 136773, 'DL222'),
    ('Jennifer Cortez', 'Gold', 300582, 'DL222'),
    ('Christian Janco', 'Silver', 14642, 'DL222');


-- exercises

-- total number of flights
SELECT count(*) as total_flights
FROM flights;


-- average flight distance
SELECT ROUND(AVG(flight_mileage)) as avg_flight_distance
FROM flights;


-- average amount of seats
SELECT ROUND(AVG(total_aircraft_seats)) AS avg_amount_seats
FROM aircraft;



-- average amount of flight miles per cst status group
SELECT
    AVG(total_cust_mileage) AS avg_mileage,
    cust_status
FROM customers
GROUP BY cust_status
ORDER BY avg_mileage DESC;

-- max number of flight miles per cst status group
SELECT
    MAX(total_cust_mileage) AS max_mileage,
    cust_status
FROM customers
GROUP BY cust_status
ORDER BY max_mileage DESC;


-- total number of "Boeing" aircrafts
SELECT COUNT(aircraft_model) AS total_Boeing_aircrafts
FROM aircraft
WHERE aircraft_model like '%Boeing%';



-- list of flights with a distance between 300 and 2000 miles
SELECT flight_number, flight_mileage
FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;


--------- dont understand the wording of the problem
---- the average distance per cst group??
SELECT
    c.cust_status,
    AVG(f.flight_mileage) AS average_flight_mileage
FROM customers c
JOIN flights f ON c.cust_flight_number = f.flight_number
GROUP BY c.cust_status;

---- 

