CREATE TABLE Authors(
                        AuthorId Int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        Author varchar(255) NOT NULL
);

CREATE TABLE Titles(
                       TitleId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       AuthorId int NOT NULL,
                       Title varchar(255) NOT NULL,
                       WordCount int NOT NULL,
                       Views int NOT NULL,
                       FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);

INSERT INTO Authors VALUE
    (1,'Maria Charlotte'),
    (2, 'Juan Perez'),
    (3, 'Gemma Alcocer');

INSERT INTO Titles VALUE
    (1,1,'Best Paint Colors', 814,14),
    (2,2,'Small Space Decorating Tips',1146,221),
    (3,1,'Hot Accessories',986,105),
    (4,1,'Mixing Textures', 765,22),
    (5,2,'Kitchen Refresh', 1242,307),
    (6,1,'Homemade Art Hacks', 1002,193),
    (7,3,'Refreshing Wood Floors', 1571,7542);

DROP TABLE Titles;
DROP TABLE Authors;


CREATE TABLE customers(
                          customer_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          customer_name varchar(255) NOT NULL,
                          customer_status varchar(255) NOT NULL,
                          total_customer_mileage int NOT NULL
);
CREATE TABLE aircrafts(
                          aircraft_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          aircraft varchar(255) NOT NULL,
                          total_aircraft_seats int NOT NULL
);
CREATE TABLE flights(
                        flight_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        flight_number varchar(255) NOT NULL,
                        flight_mileage int NOT NULL,
                        aircraft_id int NOT NULL,
                        FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);

CREATE TABLE tickets(
                        ticket_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        customer_id int NOT NULL,
                        flight_id int NOT NULL,
                        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                        FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

DROP TABLE customers;
DROP TABLE aircrafts;
DROP TABLE flights;
DROP TABLE tickets;

INSERT INTO customers VALUE
    (1,'Agustine Rivier','Silver',115235),
    (2,'Alaina Sepulvida','None',6008),
    (3,'Tom Jones','Gold',205767),
    (4,'Jessica James','Silver',127656),
    (5,'Sam Rio','None',2653),
    (6,' Ana Janco','Silver',136773),
    (7,'Jennifer Cortez','Gold',300582),
    (8,'Christian Janco','Silver',14642);

INSERT INTO aircrafts VALUE
    (1,'Boeing 747',400),
    (2, 'Airbus A330', 236),
    (3, 'Boeing 777', 264);

INSERT INTO flights VALUE
    (1,'DL143',135,1),
    (2,'DL122',4370,2),
    (3,'DL53', 2078,3),
    (4,'DL222',1765,3),
    (5,'DL37',531,1);

INSERT INTO tickets VALUE
    (1,1,1),
    (2,1,2),
    (3,2,2),
    (4,3,2),
    (5,3,3),
    (6,3,4),
    (7,4,1),
    (8,5,1),
    (9,6,4),
    (10,7,4),
    (11,4,2),
    (12,5,5),
    (13,8,4);

SELECT COUNT(*) AS vuelos_totales
FROM flights;

SELECT COUNT(*) AS vuelos_totales2
FROM tickets;

SELECT AVG(flight_mileage) AS promedio_vuelo
FROM flights;

SELECT customer_status,
       AVG(total_customer_mileage) AS promedio_millas_whit_status
FROM customers
GROUP BY customer_status;

SELECT customer_status,
       MAX(total_customer_mileage) AS max_millas_whit_status
FROM customers
GROUP BY customer_status;

SELECT COUNT(*) AS aircraft_whit_boeing_in_the_name
FROM aircrafts
WHERE aircraft LIKE '%Boeing%';

SELECT *
FROM flights
WHERE flight_mileage
          BETWEEN 300 AND 2000;


-- 10 En la base de datos de aerolíneas escriba el script SQL para
-- encontrar la distancia promedio de vuelo reservada agrupada por
-- estatus de cliente (esto requerirá una unión).

SELECT c.customer_status, AVG(f.flight_mileage) AS promedio_vuelos_por_status
FROM customers c
         JOIN tickets t on c.customer_id = t.customer_id
         JOIN flights f on f.flight_id = t.flight_id
GROUP BY c.customer_status;

-- 11 En la base de datos de aerolíneas escriba el script SQL para encontrar la aeronave más a menudo
-- reservada por los miembros de estatus de oro (esto requerirá una unión).

SELECT MAX(a.aircraft) AS aircraftMasUsadaPorGoldEstatus
FROM tickets t
         JOIN customers c on c.customer_id = t.customer_id
         JOIN flights f on f.flight_id = t.flight_id
         JOIN aircrafts a on a.aircraft_id = f.aircraft_id
WHERE c.customer_status = 'Gold'



