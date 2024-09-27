# Creación del esquema (si no existe)
CREATE SCHEMA IF NOT EXISTS airline_db;

# Seleccionar el esquema
USE airline_db;

# Creación de la tabla customers
CREATE TABLE IF NOT EXISTS customers (
                                         customer_id INT AUTO_INCREMENT PRIMARY KEY,
                                         name VARCHAR(100) NOT NULL,
                                         status ENUM('Silver', 'Gold', 'None') NOT NULL
) ENGINE=InnoDB;

# Creación de la tabla aircrafts
CREATE TABLE IF NOT EXISTS aircrafts (
                                         aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
                                         model VARCHAR(100) NOT NULL,
                                         total_seats INT NOT NULL
) ENGINE=InnoDB;

# Creación de la tabla flights
CREATE TABLE IF NOT EXISTS flights (
                                       flight_id INT AUTO_INCREMENT PRIMARY KEY,
                                       flight_number VARCHAR(10) NOT NULL,
                                       aircraft_id INT NOT NULL,
                                       mileage INT NOT NULL,
                                       FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
) ENGINE=InnoDB;

# Creación de la tabla customer_flight
CREATE TABLE IF NOT EXISTS customer_flight (
                                               customer_flight_id INT AUTO_INCREMENT PRIMARY KEY,
                                               customer_id INT NOT NULL,
                                               flight_id INT NOT NULL,
                                               total_customer_mileage INT NOT NULL,
                                               FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                                               FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
) ENGINE=InnoDB;

# Inserción de los datos en la tabla customers
INSERT INTO customers (name, status) VALUES
                                         ('Agustine Riviera', 'Silver'),
                                         ('Alaina Sepulvida', 'None'),
                                         ('Tom Jones', 'Gold'),
                                         ('Sam Rio', 'None'),
                                         ('Jessica James', 'Silver'),
                                         ('Ana Janco', 'Silver'),
                                         ('Jennifer Cortez', 'Gold'),
                                         ('Christian Janco', 'Silver');

# Inserción de los datos en la tabla aircrafts
INSERT INTO aircrafts (model, total_seats) VALUES
                                               ('Boeing 747', 400),
                                               ('Airbus A330', 236),
                                               ('Boeing 777', 264);

# Inserción de los datos en la tabla flights
INSERT INTO flights (flight_number, aircraft_id, mileage) VALUES
                                                              ('DL143', 1, 135),
                                                              ('DL122', 2, 4370),
                                                              ('DL53', 1, 2078),
                                                              ('DL222', 3, 1765),
                                                              ('DL37', 1, 531);

# Inserción de los datos en la tabla customer_flight
INSERT INTO customer_flight (customer_id, flight_id, total_customer_mileage) VALUES
                                                                                 (1, 1, 115235),
                                                                                 (1, 2, 115235),
                                                                                 (2, 2, 6008),
                                                                                 (1, 1, 115235),
                                                                                 (3, 2, 205767),
                                                                                 (3, 1, 205767),
                                                                                 (1, 1, 115235),
                                                                                 (3, 4, 205767),
                                                                                 (4, 1, 2653),
                                                                                 (1, 1, 115235),
                                                                                 (5, 1, 127656),
                                                                                 (4, 1, 2653),
                                                                                 (6, 4, 136773),
                                                                                 (3, 4, 300582),
                                                                                 (5, 2, 127656),
                                                                                 (4, 5, 2653),
                                                                                 (7, 4, 14642);
