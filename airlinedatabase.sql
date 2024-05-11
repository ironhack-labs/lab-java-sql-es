create table aircraft
(
    model varchar(100) not null
        primary key,
    seats int          null
);

create table customer
(
    id      int auto_increment
        primary key,
    name    varchar(255)                    null,
    status  enum ('None', 'Silver', 'Gold') null,
    mileage int                             null
);

create table flight
(
    number   varchar(20)  not null
        primary key,
    mileage  bigint       null,
    aircraft varchar(100) null,
    constraint flight_ibfk_1
        foreign key (aircraft) references aircraft (model)
);

create index aircraft
    on flight (aircraft);

create table registry
(
    id            int auto_increment
        primary key,
    customer_id   int         null,
    flight_number varchar(20) null,
    constraint registry_ibfk_1
        foreign key (customer_id) references customer (id),
    constraint registry_ibfk_2
        foreign key (flight_number) references flight (number)
);

create index customer_id
    on registry (customer_id);

create index flight_number
    on registry (flight_number);

INSERT INTO airlinedatabase.aircraft (model, seats) VALUES ('Airbus A330', 236);
INSERT INTO airlinedatabase.aircraft (model, seats) VALUES ('Boeing 747', 400);
INSERT INTO airlinedatabase.aircraft (model, seats) VALUES ('Boeing 777', 264);

INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (1, 'Agustine Riviera', 'Silver', 115235);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (2, 'Alaina Sepulvida', 'None', 6008);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (3, 'Tom Jones', 'Gold', 205767);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (4, 'Sam Rio', 'None', 2653);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (5, 'Jessica James', 'Silver', 127656);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (6, 'Ana Janco', 'Silver', 136773);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (7, 'Jennifer Cortez', 'Gold', 300582);
INSERT INTO airlinedatabase.customer (id, name, status, mileage) VALUES (8, 'Christian Janco', 'Silver', 14642);

INSERT INTO airlinedatabase.flight (number, mileage, aircraft) VALUES ('DL122', 4370, 'Airbus A330');
INSERT INTO airlinedatabase.flight (number, mileage, aircraft) VALUES ('DL143', 135, 'Boeing 747');
INSERT INTO airlinedatabase.flight (number, mileage, aircraft) VALUES ('DL222', 1765, 'Boeing 777');
INSERT INTO airlinedatabase.flight (number, mileage, aircraft) VALUES ('DL37', 531, 'Boeing 747');
INSERT INTO airlinedatabase.flight (number, mileage, aircraft) VALUES ('DL53', 2078, 'Boeing 777');

INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (1, 1, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (2, 1, 'DL122');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (3, 2, 'DL122');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (4, 1, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (5, 3, 'DL122');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (6, 3, 'DL53');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (7, 1, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (8, 4, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (9, 1, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (10, 3, 'DL222');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (11, 5, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (12, 4, 'DL143');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (13, 6, 'DL222');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (14, 7, 'DL222');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (15, 5, 'DL122');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (16, 4, 'DL37');
INSERT INTO airlinedatabase.registry (id, customer_id, flight_number) VALUES (17, 8, 'DL222');


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






