CREATE TABLE aerolineas
(
    costumerName VARCHAR(255),
    customerStatus VARCHAR(255),
    flightNumber VARCHAR(255),
    aircraft VARCHAR(255),
    totalAircraftSeats INT,
    flightMileage INT,
    totalCustomerMileage INT
);

INSERT INTO aerolineas( costumerName,
                        customerStatus,
                        flightNumber,
                        aircraft,
                        totalAircraftSeats,
                        flightMileage,
                        totalCustomerMileage)
VALUES
    ('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    ('Agustine Riviera', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 115235),
    ('Alaina Sepulvida', 'None', 'DL122', 'Airbus A330', 236, 4370, 6008),
    ('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    ('Tom Jones', 'Gold', 'DL122', 'Airbus A330', 236, 4370, 205767),
    ('Tom Jones', 'Gold', 'DL53', 'Boeing 777', 264, 2078, 205767),
    ('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    ('Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
    ('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    ('Tom Jones', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 205767),
    ('Jessica James', 'Silver', 'DL143', 'Boeing 747', 400, 135, 127656),
    ('Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
    ('Ana Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 136773),
    ('Jennifer Cortez', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 300582),
    ('Jessica James', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 127656),
    ('Sam Rio', 'None', 'DL37', 'Boeing 747', 400, 531, 2653),
    ('Christian Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 14642);

SELECT count(DISTINCT flightNumber) AS totalVuelos
FROM aerolineas;

SELECT AVG(flightMileage) AS promediodistanciaVuelo
FROM aerolineas;

SELECT AVG(totalAircraftSeats) AS promedioAsientos
FROM aerolineas;

SELECT customerStatus, AVG(totalCustomerMileage) AS averageMileage
FROM aerolineas
GROUP BY customerStatus;

SELECT customerStatus, MAX(totalCustomerMileage) AS maxMileage
FROM aerolineas
GROUP BY customerStatus;

SELECT COUNT(DISTINCT aircraft) AS totalBoeingAircraft
FROM aerolineas
WHERE aircraft LIKE 'Boeing%';

SELECT * FROM aerolineas
WHERE flightMileage BETWEEN 300 AND 2000;

SELECT customerStatus, AVG(flightMileage) AS averageFlightMileage
FROM aerolineas
GROUP BY customerStatus;

SELECT aircraft, COUNT(*) AS aircraftReservation
FROM aerolineas
WHERE customerStatus = 'Gold'
GROUP BY aircraft
ORDER BY aircraftReservation DESC;