USE lab302

##PARTE 1
-- Crear la tabla
CREATE TABLE Author (
                        AuthorID INT PRIMARY KEY AUTO_INCREMENT,
                        AuthorName VARCHAR(255) NOT NULL
);

-- Crear tabla blogposts
CREATE TABLE blogpost (
                          PostID INT PRIMARY KEY AUTO_INCREMENT,
                          AuthorID INT,
                          Title VARCHAR(255) NOT NULL,
                          WordCount INT,
                          Views INT,
                          FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- Introducir datos en tabla de autor
INSERT INTO Author (AuthorName) VALUES
                                    ('Maria Charlotte'),
                                    ('Juan Perez'),
                                    ('Gemma Alcocer');

-- Introducir datos en tabla de blog post
INSERT INTO blogpost (AuthorID, Title, WordCount, Views) VALUES
                                                             (1, 'Best Paint Colors', 814, 14),
                                                             (2, 'Small Space Decorating Tips', 1146, 221),
                                                             (1, 'Hot Accessories', 986, 105),
                                                             (1, 'Mixing Textures', 765, 22),
                                                             (2, 'Kitchen Refresh', 1242, 307),
                                                             (1, 'Homemade Art Hacks', 1002, 193),
                                                             (3, 'Refinishing Wood Floors', 1571, 7542);

#------------------------------------------------------------------------------------------------------------------------------------------------------------

##Parte 2
-- Crear tabla de pasajero(customer)
CREATE TABLE Customer (
                          CustomerID INT PRIMARY KEY AUTO_INCREMENT,
                          CustomerName VARCHAR(255),
                          CustomerStatus VARCHAR(50)
);

-- Crear tabla de vuelos
CREATE TABLE Flight (
                        FlightID INT PRIMARY KEY AUTO_INCREMENT,
                        FlightNumber VARCHAR(10),
                        Aircraft VARCHAR(50),
                        TotalSeats INT,
                        FlightMileage INT
);

-- Crear tabla pasajero - vuelo
CREATE TABLE Customer_Flight (
                                 CustomerFlightID INT PRIMARY KEY AUTO_INCREMENT,
                                 CustomerID INT,
                                 FlightID INT,
                                 TotalCustomerMileage INT,
                                 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
                                 FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- Introducir en tabla de pasajeros
INSERT INTO Customer (CustomerName, CustomerStatus) VALUES
                                                        ('Agustine Riviera', 'Silver'),
                                                        ('Alaina Sepulvida', 'None'),
                                                        ('Tom Jones', 'Gold'),
                                                        ('Sam Rio', 'None'),
                                                        ('Jessica James', 'Silver'),
                                                        ('Ana Janco', 'Silver'),
                                                        ('Jennifer Cortez', 'Gold'),
                                                        ('Christian Janco', 'Silver');

-- Introducir en tabla de vuelo
INSERT INTO Flight (FlightNumber, Aircraft, TotalSeats, FlightMileage) VALUES
                                                                           ('DL143', 'Boeing 747', 400, 135),
                                                                           ('DL122', 'Airbus A330', 236, 4370),
                                                                           ('DL53', 'Boeing 777', 264, 2078),
                                                                           ('DL222', 'Boeing 777', 264, 1765),
                                                                           ('DL37', 'Boeing 747', 400, 531);

-- introducer en pasajero - vuelo
INSERT INTO Customer_Flight (CustomerID, FlightID, TotalCustomerMileage) VALUES
                                                                             (1, 1, 115235),
                                                                             (1, 2, 115235),
                                                                             (2, 2, 6008),
                                                                             (3, 2, 205767),
                                                                             (3, 3, 205767),
                                                                             (4, 1, 2653),
                                                                             (5, 1, 127656),
                                                                             (6, 4, 136773),
                                                                             (7, 4, 300582),
                                                                             (5, 2, 127656),
                                                                             (4, 5, 2653),
                                                                             (8, 4, 14642);

#número total de vuelos en la base de datos.
SELECT COUNT(DISTINCT FlightID) AS TotalVuelos
FROM Flight;
#distancia promedio de vuelo.
SELECT AVG(FlightMileage) AS DistanciaPromedioVuelo
FROM Flight;
#número promedio de asientos.
SELECT AVG(TotalSeats) AS PromedioAsientos
FROM Flight;
#úmero promedio de millas voladas por los clientes agrupados por estatus.
SELECT c.CustomerStatus, AVG(cf.TotalCustomerMileage) AS PromedioMillasVoladas
FROM Customer_Flight cf
         JOIN Customer c ON cf.CustomerID = c.CustomerID
GROUP BY c.CustomerStatus;
# máximo de millas voladas por los clientes agrupados por estatus.
SELECT c.CustomerStatus, MAX(cf.TotalCustomerMileage) AS MaximoMillasVoladas
FROM Customer_Flight cf
         JOIN Customer c ON cf.CustomerID = c.CustomerID
GROUP BY c.CustomerStatus;
# total de aeronaves con un nombre que contiene Boeing.
SELECT COUNT(DISTINCT FlightID) AS BoeingAircraft
FROM Flight
WHERE Aircraft LIKE '%Boeing%';
# vuelos con una distancia entre 300 y 2000 millas.
SELECT *
FROM Flight
WHERE FlightMileage BETWEEN 300 AND 2000;
#distancia promedio de vuelo reservada agrupada por estatus - USANDO UNION
SELECT c.CustomerStatus, AVG(f.FlightMileage) AS PromedioDistanciaVolada
FROM Customer_Flight cf
         JOIN Customer c ON cf.CustomerID = c.CustomerID
         JOIN Flight f ON cf.FlightID = f.FlightID
GROUP BY c.CustomerStatus;
#aeronave más a menudo reservada por los miembros de estatus de oro UNION
SELECT f.Aircraft, COUNT(cf.CustomerFlightID) AS Reservas
FROM Customer_Flight cf
         JOIN Customer c ON cf.CustomerID = c.CustomerID
         JOIN Flight f ON cf.FlightID = f.FlightID
WHERE c.CustomerStatus = 'Gold'
GROUP BY f.Aircraft
ORDER BY Reservas DESC
    LIMIT 1;


