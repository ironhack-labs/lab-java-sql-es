CREATE TABLE seats
(
    id            INT,
    flight_number VARCHAR(255),
    aircraft      VARCHAR(255),
    total_seats         INT,
    PRIMARY KEY (id)

);

CREATE TABLE flight_milage(
                              id INT,
                              flight_number VARCHAR(255),
                              milage INT,
                              PRIMARY KEY (flight_number),
                              FOREIGN KEY (id) REFERENCES seats (id)
);


CREATE TABLE Vuelos(
                       ID INT,
                       Customer_Name VARCHAR(255),
                       customer_status VARCHAR(255),
                       Flight_Number VARCHAR(255),
                       Total_Milage INT,
                       PRIMARY KEY (ID),
                       FOREIGN KEY (Flight_Number) REFERENCES flight_milage(flight_number)
);

INSERT INTO seats (id, flight_number, aircraft, total_seats)
VALUES (1,'DL122','Airbus A330',236),
       (2,'DL143','Boeing 747',400),
       (3,'DL37','Boeing 747',747),
       (4,'DL222','Boeing 777',264),
       (5,'DL53','Boeing 777',264);

INSERT INTO flight_milage (id, flight_number, milage)
VALUES (1,'DL122',4370),
       (2,'DL143',135),
       (3,'DL37',531),
       (4,'DL222',1765),
       (5,'DL53',2078);


INSERT INTO  Vuelos(ID, Customer_Name, customer_status, Flight_Number, Total_Milage)
VALUES (1,'Tom Jones','Gold','DL122',205767),
       (2,'Tom Jones','Gold','DL53',205767),
       (3,'Sam Rio','None','DL143',2653),
       (4,'Sam Rio','None','DL37',2653),
       (5,'Jessica James','Silver','DL143',127656),
       (6,'Jessica James','Silver','DL122',127656),
       (7,'Jennifer Cortez','Gold','DL122',300582),
       (8,'Christian Janco','Silver','DL122',14642),
       (9,'Ana Janco','Silver','DL122',136773),
       (10,'Alaina Selpulvida','None','DL122',6008),
       (11,'Agustine Rivera','Silver','DL143',115235),
       (12,'Agustine Rivera','Silver','DL122',115235);


#En la base de datos de aerolíneas escriba el script SQL
# para obtener el número total de vuelos en la base de datos.
SELECT MAX(ID) AS 'Numero de Vuelos Totales' FROM Vuelos;


#En la base de datos de aerolíneas escriba el script SQL
# para obtener la distancia promedio de vuelo.
SELECT AVG(milage) AS 'La Distancia Promedio' FROM flight_milage;

#En la base de datos de aerolíneas escriba el script SQL
# para obtener el número promedio de asientos.
SELECT AVG(total_seats) AS 'El numero de asientos' FROM seats;

#En la base de datos de aerolíneas escriba el script SQL
# para obtener el número promedio de millas voladas por los clientes agrupados por estatus.
SELECT customer_status, AVG(Total_Milage) AS 'Promedio de millas por estatus' FROM Vuelos GROUP BY customer_status;

#En la base de datos de aerolíneas escriba el script SQL
# para obtener el número máximo de millas voladas por los clientes agrupados por estatus.
SELECT customer_status, MAX(Total_Milage) AS 'El Maxima de millas voladas' FROM Vuelos
GROUP BY (customer_status);

#En la base de datos de aerolíneas escriba el script SQL
# para obtener el número total de aeronaves con un nombre que contiene Boeing.
SELECT COUNT(aircraft) FROM seats
WHERE aircraft LIKE 'Boeing%';

#En la base de datos de aerolíneas escriba el script SQL
# para encontrar todos los vuelos con una distancia entre 300 y 2000 millas.
SELECT Flight_Number, milage FROM flight_milage
WHERE milage >300 AND milage<2000;

#En la base de datos de aerolíneas escriba el script SQL
# para encontrar la distancia promedio de vuelo reservada
# agrupada por estatus de cliente (esto requerirá una unión).
SELECT avg(milage) AS 'Promedio de vuelo', vuelos.customer_status FROM flight_milage
INNER JOIN Vuelos ON  Vuelos.Flight_Number=flight_milage.flight_number
GROUP BY vuelos.customer_status;

#En la base de datos de aerolíneas escriba el script SQL
# para encontrar la aeronave más a menudo reservada por los
# miembros de estatus de oro (esto requerirá una unión).
SELECT   customer_status, seats.aircraft FROM vuelos
INNER JOIN flight_milage ON vuelos.Flight_Number = flight_milage.flight_number
INNER JOIN seats ON flight_milage.id = seats.id
WHERE customer_status = 'Gold'
GROUP BY seats.aircraft
HAVING COUNT(aircraft)>1;
