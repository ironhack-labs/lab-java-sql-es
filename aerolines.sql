
CREATE TABLE Customers
(
    CustomerId          int             NOT NULL AUTO_INCREMENT,
    Name                varchar(255)    NOT NULL,
    Status              varchar(20)     NOT NULL,
    CustomerMilleage    int             NOT NULL,
    PRIMARY KEY (CustomerId)
);

CREATE TABLE Aircrafts
(
    AircraftId          int             NOT NULL AUTO_INCREMENT,
    AircraftName        varchar(20)     NOT NULL,
    AircraftSeats       int             NOT NULL,
    PRIMARY KEY (AircraftId)
);

CREATE TABLE Flights
(
    FlightId          int           NOT NULL AUTO_INCREMENT,
    CustomerId        int           NOT NULL,
    AircraftId        int           NOT NULL,
    FlightNumber      varchar(20)   NOT NULL,
    FlightMilleage    int           NOT NULL,
    PRIMARY KEY (FlightId),
    FOREIGN KEY (CustomerId) REFERENCES Customers (CustomerId),
    FOREIGN KEY (AircraftId) REFERENCES Aircrafts (AircraftId)
);

INSERT INTO Customers (Name, Status, CustomerMilleage)
VALUES  ('Agustine Riviera', 'Silver', 115235),
        ('Alaina Sepulvida', 'None', 6008),
        ('Tom Jones', 'Gold', 205767),
        ('Sam Rio', 'None', 2653),
        ('Jessica James', 'Silver', 127656),
        ('Ana Janco', 'Silver', 136773),
        ('Jennifer Cortez', 'Gold', 300582),
        ('Christian Janco', 'Silver', 14642);

INSERT INTO Aircrafts (AircraftName, AircraftSeats)
VALUES  ('Boeing 747', 400),
        ('Airbus A330', 236),
        ('Boeing 777', 264);

INSERT INTO Flights (CustomerId, AircraftId, FlightNumber, FlightMilleage)
VALUES  (1, 1, 'DL143', 135),
        (1, 2, 'DL122', 4370),
        (2, 2, 'DL122', 4370),
        (1, 1, 'DL143', 135),
        (3, 2, 'DL122', 4370),
        (3, 3, 'DL53', 2078),
        (1, 1, 'DL143', 135),
        (4, 1, 'DL143', 135),
        (1, 1, 'DL143', 135),
        (3, 3, 'DL222', 1765),
        (5, 1, 'DL143', 135),
        (4, 1, 'DL143', 135),
        (6, 3, 'DL222', 1765),
        (7, 3, 'DL222', 1765),
        (5, 2, 'DL122', 4370),
        (4, 1, 'DL37', 531),
        (8, 3, 'DL222', 1765);

-- ########   EJERCICIOS   ########
-- 3. Numero total de vuelos
SELECT COUNT(*) as Total_Vuelos FROM Flights;

-- 4. Distancia media de vuelo
SELECT ROUND(AVG(Flights.FlightMilleage), 2) AS Distancia_Media_De_Vuelo
FROM Flights;

-- 5. Numero promedio de asientos por vuelo
SELECT ROUND(AVG(AirCrafts.AircraftSeats), 2) AS Media_Asientos_Vuelo
FROM Aircrafts
INNER JOIN Flights
ON Aircrafts.AircraftId = Flights.AircraftId;

-- 6. Promedio de millas voladas por los clientes agrupados por estatus
SELECT Status, ROUND(AVG(CustomerMilleage), 2) AS Promedio_Millas_Por_Cliente
FROM Customers
INNER JOIN Flights
ON Customers.CustomerId = Flights.CustomerId
GROUP BY Status;

-- 7. Numero maximo de millas voladas por los clientes agrupadas por estatus
SELECT Status, MAX(CustomerMilleage) AS Maximo_Millas_Por_Cliente
FROM Customers
INNER JOIN Flights
ON Customers.CustomerId = Flights.CustomerId
GROUP BY Status;

-- 8. Numero de aeronaves cuyo nombre contiene "Boeing"
SELECT COUNT(*) AS Numero_Aeronaves_Boeing
FROM Aircrafts
WHERE AircraftName LIKE 'Boeing%';

-- 8Bis. Numero total de vuelos con aeronaves cuyo nombre contiene "Boeing"
SELECT COUNT(*) AS Numero_Vuelos_Aeronaves_Boeing
FROM Aircrafts
INNER JOIN Flights
ON Aircrafts.AircraftId = Flights.AircraftId
WHERE AircraftName LIKE 'Boeing%';

-- 9. Vuelos con distancia entre 300 y 2000 millas
SELECT Customers.Name, FlightNumber AS Numero_Vuelo, FlightMilleage as Millas_Vuelo
FROM Flights inner join Customers on Flights.CustomerId = Customers.CustomerId
WHERE FlightMilleage BETWEEN 200 AND 2000;

-- 10. Distancia promedio de vuelo reservada agrupada por estatus del cliente
SELECT Customers.Status, ROUND(AVG(Flights.FlightMilleage), 2)
FROM Customers
INNER JOIN Flights
ON Customers.CustomerId = Flights.CustomerId
GROUP BY Customers.Status;

-- 11. Aeronave mas reservada por los miembros de estatus Gold
SELECT Customers.Status AS Estatus_Cliente, Aircrafts.AircraftName AS Aeronave, COUNT(*) as Vuelos_Totales
FROM Customers
INNER JOIN Flights ON Customers.CustomerId = Flights.CustomerId
INNER JOIN Aircrafts ON Flights.AircraftId = Aircrafts.AircraftId
WHERE Status = 'Gold'
GROUP BY Customers.Status, AircraftName ORDER BY Vuelos_Totales DESC LIMIT 1;


