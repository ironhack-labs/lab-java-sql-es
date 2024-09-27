USE airline_db;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número total de vuelos en la base de datos.
SELECT COUNT(*) AS total_flights FROM flights;

# En la base de datos de aerolíneas escriba el script SQL para obtener la distancia promedio de vuelo.
SELECT AVG(mileage) AS average_flight_distance FROM flights;

#  En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de asientos.
SELECT AVG(total_seats) AS average_total_seats FROM aircrafts;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de millas voladas por los clientes agrupados por estatus.
SELECT c.status, AVG(cf.total_customer_mileage) AS average_mileage
FROM customers c
         JOIN customer_flight cf ON c.customer_id = cf.customer_id
GROUP BY c.status;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número máximo de millas voladas por los clientes agrupados por estatus.
SELECT c.status, MAX(cf.total_customer_mileage) AS max_mileage
FROM customers c
         JOIN customer_flight cf ON c.customer_id = cf.customer_id
GROUP BY c.status;

# En la base de datos de aerolíneas escriba el script SQL para obtener el número total de aeronaves con un nombre que contiene Boeing.
SELECT COUNT(*) AS total_boeing_aircrafts
FROM aircrafts
WHERE model LIKE '%Boeing%';

# En la base de datos de aerolíneas escriba el script SQL para encontrar todos los vuelos con una distancia entre 300 y 2000 millas.
SELECT * FROM flights
WHERE mileage BETWEEN 300 AND 2000;

# En la base de datos de aerolíneas escriba el script SQL para encontrar la distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión).
SELECT c.status, AVG(f.mileage) AS average_distance
FROM customers c
         JOIN customer_flight cf ON c.customer_id = cf.customer_id
         JOIN flights f ON cf.flight_id = f.flight_id
GROUP BY c.status;

# En la base de datos de aerolíneas escriba el script SQL para encontrar la aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión).
SELECT a.model, COUNT(cf.flight_id) AS booking_count
FROM aircrafts a
         JOIN flights f ON a.aircraft_id = f.aircraft_id
         JOIN customer_flight cf ON f.flight_id = cf.flight_id
         JOIN customers c ON cf.customer_id = c.customer_id
WHERE c.status = 'Gold'
GROUP BY a.model
ORDER BY booking_count DESC
LIMIT 1;
