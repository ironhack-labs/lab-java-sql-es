USE airlinedatabase;
SELECT COUNT(*)
FROM flight;

SELECT AVG(mileage)
FROM flight;

SELECT AVG(seats)
FROM aircraft;
SELECT status, AVG(mileage)
FROM customer
GROUP BY status;
SELECT status, MAX(mileage)
FROM customer
GROUP BY status;
SELECT COUNT(*)
FROM aircraft
WHERE model LIKE 'Boeing%';
SELECT *
FROM flight
WHERE mileage BETWEEN 300 AND 2000;
SELECT AVG(f.mileage), c.status
FROM registry r
         JOIN (customer c, flight f) ON (r.customer_id = c.id AND r.flight_number = f.number)
GROUP BY c.status;
SELECT MAX(aircraft)
FROM registry r
         JOIN (customer c, flight f) ON (r.customer_id = c.id AND r.flight_number = f.number)
WHERE c.status = 'Gold';






