-- 1.
-- Create table for Customers
CREATE TABLE Customers (
    Customer_Name VARCHAR(100) PRIMARY KEY,
    Customer_Status VARCHAR(50)
);

-- Create table for Flights
CREATE TABLE Flights (
    Flight_Number VARCHAR(10) PRIMARY KEY,
    Aircraft VARCHAR(50),
    Total_Aircraft_Seats INT,
    Flight_Mileage INT,
    Total_Customer_Mileage INT
);

-- Create junction table for Customer_Flights
CREATE TABLE Customer_Flights (
    Customer_Name VARCHAR(100),
    Flight_Number VARCHAR(10),
    PRIMARY KEY (Customer_Name, Flight_Number),
    FOREIGN KEY (Customer_Name) REFERENCES Customers(Customer_Name),
    FOREIGN KEY (Flight_Number) REFERENCES Flights(Flight_Number)
);

-- 2.
-- Insert sample data into Customers table
INSERT INTO Customers (Customer_Name, Customer_Status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

-- Insert sample data into Flights table
INSERT INTO Flights (Flight_Number, Aircraft, Total_Aircraft_Seats, Flight_Mileage, Total_Customer_Mileage) VALUES
('DL143', 'Boeing 747', 400, 135, 115235),
('DL122', 'Airbus A330', 236, 4370, 127656),
('DL53', 'Boeing 777', 264, 2078, 205767),
('DL222', 'Boeing 777', 264, 1765, 136773),
('DL37', 'Boeing 747', 400, 531, 2653);

-- Insert sample data into Customer_Flights junction table
INSERT INTO Customer_Flights (Customer_Name, Flight_Number) VALUES
('Agustine Riviera', 'DL143'),
('Agustine Riviera', 'DL122'),
('Alaina Sepulvida', 'DL122'),
('Tom Jones', 'DL122'),
('Tom Jones', 'DL53'),
('Agustine Riviera', 'DL143'),
('Sam Rio', 'DL143'),
('Agustine Riviera', 'DL143'),
('Tom Jones', 'DL222'),
('Jessica James', 'DL143'),
('Sam Rio', 'DL143'),
('Ana Janco', 'DL222'),
('Jennifer Cortez', 'DL222'),
('Jessica James', 'DL122'),
('Sam Rio', 'DL37'),
('Christian Janco', 'DL222');

-- 3. En la base de datos de aerolíneas escriba el script SQL para obtener el número total de vuelos en la base de datos.
SELECT COUNT(*) AS Total_Flights FROM Flights;

-- 4. En la base de datos de aerolíneas escriba el script SQL para obtener la distancia promedio de vuelo.
SELECT AVG(Flight_Mileage) AS Average_Flight_Distance FROM Flights;

-- 5. En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de asientos.
SELECT AVG(Total_Aircraft_Seats) AS Average_Seats FROM Flights;

-- 6. En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de millas voladas por los clientes agrupados por estatus.
SELECT c.Customer_Status, AVG(f.Total_Customer_Mileage) AS Average_Miles
FROM Customers c
JOIN Customer_Flights cf ON c.Customer_Name = cf.Customer_Name
JOIN Flights f ON cf.Flight_Number = f.Flight_Number
GROUP BY c.Customer_Status;

-- 7. En la base de datos de aerolíneas escriba el script SQL para obtener el número máximo de millas voladas por los clientes agrupados por estatus.
SELECT c.Customer_Status, MAX(f.Total_Customer_Mileage) AS Max_Miles
FROM Customers c
JOIN Customer_Flights cf ON c.Customer_Name = cf.Customer_Name
JOIN Flights f ON cf.Flight_Number = f.Flight_Number
GROUP BY c.Customer_Status;

-- 8. En la base de datos de aerolíneas escriba el script SQL para obtener el número total de aeronaves con un nombre que contiene Boeing.
SELECT COUNT(*) AS Total_Boeing_Aircraft 
FROM Flights
WHERE Aircraft LIKE '%Boeing%';

-- 9. En la base de datos de aerolíneas escriba el script SQL para encontrar todos los vuelos con una distancia entre 300 y 2000 millas.
SELECT *
FROM Flights
WHERE Flight_Mileage BETWEEN 300 AND 2000;

-- 10. En la base de datos de aerolíneas escriba el script SQL para encontrar la distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión).
SELECT c.Customer_Status, AVG(f.Flight_Mileage) AS Avg_Flight_Distance
FROM Customers c
JOIN Customer_Flights cf ON c.Customer_Name = cf.Customer_Name
JOIN Flights f ON cf.Flight_Number = f.Flight_Number
GROUP BY c.Customer_Status;

-- 11. En la base de datos de aerolíneas escriba el script SQL para encontrar la aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión).
SELECT f.Aircraft, COUNT(*) AS Reservation_Count
FROM Customers c
JOIN Customer_Flights cf ON c.Customer_Name = cf.Customer_Name
JOIN Flights f ON cf.Flight_Number = f.Flight_Number
WHERE c.Customer_Status = 'Gold'
GROUP BY f.Aircraft
ORDER BY Reservation_Count DESC
LIMIT 1;
