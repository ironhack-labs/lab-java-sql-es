CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50)
);

CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(50) NOT NULL,
    aircraft VARCHAR(255) NOT NULL,
    total_aircraft_seats INT NOT NULL,
    flight_mileage INT NOT NULL
);

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    total_customer_mileage INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
SELECT COUNT(*) AS total_flights FROM flights;
SELECT AVG(flight_mileage) AS average_flight_distance FROM flights;
SELECT AVG(total_aircraft_seats) AS average_seats FROM flights;
SELECT AVG(total_aircraft_seats) AS average_seats FROM flights;
SELECT customer_status, AVG(total_customer_mileage) AS average_mileage
FROM customers
JOIN reservations ON customers.customer_id = reservations.customer_id
GROUP BY customer_status;
SELECT customer_status, MAX(total_customer_mileage) AS max_mileage
FROM customers
JOIN reservations ON customers.customer_id = reservations.customer_id
GROUP BY customer_status;
SELECT COUNT(*) AS boeing_aircrafts
FROM flights
WHERE aircraft LIKE '%Boeing%';
SELECT *
FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;
SELECT customer_status, AVG(flight_mileage) AS average_flight_distance
FROM customers
JOIN reservations ON customers.customer_id = reservations.customer_id
JOIN flights ON reservations.flight_id = flights.flight_id
GROUP BY customer_status;
SELECT aircraft, COUNT(*) AS reservations_count
FROM flights
JOIN reservations ON flights.flight_id = reservations.flight_id
JOIN customers ON reservations.customer_id = customers.customer_id
WHERE customer_status = 'Gold'
GROUP BY aircraft
ORDER BY reservations_count DESC
LIMIT 1;
