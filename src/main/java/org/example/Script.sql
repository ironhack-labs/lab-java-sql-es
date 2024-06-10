-- 1) BLOG
-- CREATE TABLES
CREATE TABLE Author (
    AuthorID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(255) NOT NULL
);

CREATE TABLE Book (
  BookID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  AuthorID INT NOT NULL,
  Title VARCHAR(255) NOT NULL,
  WordCount INT NOT NULL,
  FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Views (
   BookID INT NOT NULL,
   AuthorID INT NOT NULL,
   Views INT NOT NULL,
   PRIMARY KEY (BookID, AuthorID),
   FOREIGN KEY (BookID) REFERENCES Book(BookID),
   FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- INSERT DATA
INSERT INTO Author (AuthorName) VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');

INSERT INTO Book (AuthorID, Title, WordCount) VALUES
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 'Best Paint Colors', 814),
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Juan Perez'), 'Small Space Decorating Tips', 1146),
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 'Hot Accessories', 986),
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 'Mixing Textures', 765),
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Juan Perez'), 'Kitchen Refresh', 1242),
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 'Homemade Art Hacks', 1002),
    ((SELECT AuthorID FROM Author WHERE AuthorName = 'Gemma Alcocer'), 'Refinishing Wood Floors', 1571);

INSERT INTO Views (BookID, AuthorID, Views) VALUES
    ((SELECT BookID FROM Book WHERE Title = 'Best Paint Colors'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 14),
    ((SELECT BookID FROM Book WHERE Title = 'Small Space Decorating Tips'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Juan Perez'), 221),
    ((SELECT BookID FROM Book WHERE Title = 'Hot Accessories'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 105),
    ((SELECT BookID FROM Book WHERE Title = 'Mixing Textures'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 22),
    ((SELECT BookID FROM Book WHERE Title = 'Kitchen Refresh'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Juan Perez'), 307),
    ((SELECT BookID FROM Book WHERE Title = 'Homemade Art Hacks'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Maria Charlotte'), 193),
    ((SELECT BookID FROM Book WHERE Title = 'Refinishing Wood Floors'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Gemma Alcocer'), 7542);

-- 2) AEROLÍNEAS
-- CREATE TABLES
CREATE TABLE Customer (
    CustomerID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) NOT NULL,
    CustomerStatus VARCHAR(50) NOT NULL,
    TotalCustomerMileage INT NOT NULL DEFAULT 0
);

CREATE TABLE Flight (
    FlightID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(10) NOT NULL,
    AircraftType VARCHAR(50) NOT NULL,
    TotalSeats INT NOT NULL,
    FlightMileage INT NOT NULL
);

CREATE TABLE FlightHistory (
    CustomerID INT NOT NULL,
    FlightID INT NOT NULL,
    PRIMARY KEY (CustomerID, FlightID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- INSERT DATA
INSERT INTO Customer (CustomerName, CustomerStatus, TotalCustomerMileage) VALUES
    ('Agustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', 'None', 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', 'None', 2653),
    ('Jessica James', 'Silver', 127656),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Christian Janco', 'Silver', 14642);

INSERT INTO Flight (FlightNumber, AircraftType, TotalSeats, FlightMileage) VALUES
    ('DL143', 'Boeing 747', 400, 135),
    ('DL122', 'Airbus A330', 236, 4370),
    ('DL53', 'Boeing 777', 264, 2078),
    ('DL222', 'Boeing 777', 264, 1765),
    ('DL37', 'Boeing 747', 400, 531);

INSERT INTO FlightHistory (CustomerID, FlightID) VALUES
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Agustine Riviera'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL143')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Agustine Riviera'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL122')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Alaina Sepulvida'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL122')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Tom Jones'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL122')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Tom Jones'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL53')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Tom Jones'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL222')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Sam Rio'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL143')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Sam Rio'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL37')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Jessica James'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL143')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Jessica James'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL122')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Ana Janco'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL222')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Jennifer Cortez'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL222')),
     ((SELECT CustomerID FROM Customer WHERE CustomerName = 'Christian Janco'), (SELECT FlightID FROM Flight WHERE FlightNumber = 'DL222'));

-- 3) NÚMERO TOTAL DE VUELOS
SELECT COUNT(*) AS TotalFlights
FROM Flight;

-- 4) DISTANCIA PROMEDIO DE LOS VUELOS
SELECT AVG(FlightMileage) AS AverageFlightDistance
FROM Flight;

-- 5) NÚMERO PROMEDIO DE ASIENTOS
SELECT AVG(TotalSeats) AS AverageNumberOfSeats
FROM Flight;

-- 6) NÚMERO PROMEDIO DE MILLAS VOLADAS POR ESTATUS DE LOS CLIENTES
SELECT CustomerStatus, AVG(TotalCustomerMileage) AS AverageMiles
FROM Customer
GROUP BY CustomerStatus;

-- 7) NÚMERO MÁXIMO DE VILLAS VOLADAS POR ESTATUS DE LOS CLIENTES
SELECT CustomerStatus, MAX(TotalCustomerMileage) AS MaxMiles
FROM Customer
GROUP BY CustomerStatus;

-- 8) NÚMERO TOTAL DE AERONAVES CON NOMBRE QUE CONTENGAN "Boeing"
SELECT COUNT(*) AS TotalBoeingAircrafts
FROM Flight
WHERE AircraftType LIKE '%Boeing%';

-- 9) TODOS LOS VUELOS CON UNA DISTANCIA ENTRE 300 Y 2000 MILLAS
SELECT FlightID, FlightMileage
FROM Flight
WHERE FlightMileage BETWEEN 300 AND 2000;

-- 10) DISTANCIA PROMEDIO DE VUELO AGRUPADA POR ESTATUS DE CLIENTE
SELECT CustomerStatus, AVG(FlightMileage) AS AverageFlightDistance
FROM Customer C
JOIN FlightHistory FH ON C.CustomerID = FH.CustomerID
JOIN Flight ON FH.FlightID = Flight.FlightID
GROUP BY CustomerStatus;

-- 11) AERONAVE MÁS A MENUDO RESERVADA POR MIEMBROS GOLD
SELECT F.AircraftType, COUNT(*) AS NumberOfFlights
FROM Customer C
JOIN FlightHistory FH ON C.CustomerID = FH.CustomerID
JOIN Flight F ON FH.FlightID = F.FlightID
WHERE C.CustomerStatus = 'Gold'
GROUP BY F.AircraftType
ORDER BY COUNT(*) DESC
LIMIT 1;

