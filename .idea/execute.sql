USE lab_sql;
CREATE TABLE FirstTableFlights(
                                  ID  SMALLINT NOT NULL,
                                  CustomerName VARCHAR(255),
                                  CustomerStatus  VARCHAR(255),
                                  FlightNumber VARCHAR(6) NOT NULL,
                                  Aircraft  VARCHAR(255) NOT NULL,
                                  TotalAircraftSeats  SMALLINT NOT NULL,
                                  FlightMileage  INT NOT NULL,
                                  TotalCustomerMileage  INT NOT NULL,
                                  primary key (ID)
);
CREATE TABLE Flights(
                        ID SMALLINT NOT NULL,
                        CustomerName VARCHAR(255),
                        FligthID SMALLINT,
                        StatusID SMALLINT,
                        TotalCustomerMileage INT,
                        primary key (ID)
);

CREATE TABLE FlightID(
                         ID SMALLINT,
                         FlightNumber VARCHAR(6) NOT NULL,
                         Aircraft VARCHAR(255),
                         TotalAircraftSeats SMALLINT,
                         FlightMileage SMALLINT,
                         primary key (ID)
);

CREATE TABLE StatusID(
                         ID SMALLINT,
                         CustomerStatus VARCHAR(255),
                         primary key (ID)
);
INSERT INTO FirstTableFlights (ID, CustomerName, CustomerStatus, FlightNumber, Aircraft, TotalAircraftSeats, FlightMileage, TotalCustomerMileage) VALUES
                                                                                                                                                      ('1','Agustine Riviera','Silver','DL143','Boeing 747','400','135','115235'),
                                                                                                                                                      ('2','Agustine Riviera','Silver','DL122','Airbus A330','236','4370','115235'),
                                                                                                                                                      ('3','Alaina Sepulvida','None','DL22','Airbus A330','236','4370','6008'),
                                                                                                                                                      ('4','Agustine Riviera','Silver','DL143','Boeing 747','400','135','115235'),
                                                                                                                                                      ('5','Tom Jones','Gold','DL122','Airbus A330','236','4370','205767'),
                                                                                                                                                      ('6','Tom Jones','Gold','DL53','Boeing 777','264','2078','205767'),
                                                                                                                                                      ('7','Agustine Riviera','Silver','DL143','Boeing 747','400','135','15235'),
                                                                                                                                                      ('8','Sam Rio','None','DL143','Boeing 747','400','135','2653'),
                                                                                                                                                      ('9','Agustine Riviera','Silver','DL143','Boeing 747','400','135','115235'),
                                                                                                                                                      ('10','Tom Jones','Gold','DL222','Boeing 777','264','1765','205767'),
                                                                                                                                                      ('11','Jessica James','Silver','DL143','Boeing 747','400','135','127656'),
                                                                                                                                                      ('12','Sam Rio','None','DL143','Boeing 747','400','135','2653'),
                                                                                                                                                      ('13','Ana Janco','Silver','DL222','Boeing 777','264','1765','136773'),
                                                                                                                                                      ('14','Jennifer Cortez','Gold','DL222','Boeing 777','264','1765','300582'),
                                                                                                                                                      ('15','Jessica James','Silver','DL122','Airbus A330','236','4370','127656'),
                                                                                                                                                      ('16','Sam Rio','None','DL37','Boeing 747','400','531','2653'),
                                                                                                                                                      ('17','Christian Janco','Silver','DL222','Boeing 777','264','1765','14642');



INSERT INTO Flights (ID, CustomerName, FligthID, StatusID, TotalCustomerMileage) VALUES
                                                                                     ('1','Agustine Riviera','1','2','115235'),
                                                                                     ('2','Agustine Riviera','2','2','115235'),
                                                                                     ('3','Alaina Sepulvida','2','3','6008'),
                                                                                     ('4','Agustine Riviera','1','2','115235'),
                                                                                     ('5','Tom Jones','2','1','205767'),
                                                                                     ('6','Tom Jones','3','1','205767'),
                                                                                     ('7','Agustine Riviera','1','2','115235'),
                                                                                     ('8','Sam Rio','1','3','2653'),
                                                                                     ('9','Agustine Riviera','1','2','115235'),
                                                                                     ('10','Tom Jones','4','1','205767'),
                                                                                     ('11','Jessica James','1','2','127656'),
                                                                                     ('12','Sam Rio','1','3','2653'),
                                                                                     ('13','Ana Janco','4','2','136773'),
                                                                                     ('14','Jennifer Cortez','4','1','300582'),
                                                                                     ('15','Jessica James','2','2','127656'),
                                                                                     ('16','Sam Rio','5','3','2653'),
                                                                                     ('17','Christian Janco','2','2','14642');

INSERT INTO FlightID (ID, FlightNumber, Aircraft, TotalAircraftSeats, FlightMileage) VALUES
                                                                                         ('1','DL143','Boeing 747','400','135'),
                                                                                         ('2','DL122','Airbus A330','236','4370'),
                                                                                         ('3','DL53','Boeing 777','264','2078'),
                                                                                         ('4','DL222','Boeing 777','264','1765'),
                                                                                         ('5','DL37','Boeing 747','400','531');

INSERT INTO StatusID(ID, CustomerStatus) VALUES
                                             ('1','Gold'),
                                             ('2','Silver'),
                                             ('3','None');

SELECT COUNT(Flights.id) FROM Flights;

SELECT AVG(FlightID.FlightMileage) FROM FlightID;

SELECT AVG(FlightID.TotalAircraftSeats) FROM FlightID;

SELECT AVG(Flights.TotalCustomerMileage) FROM Flights
GROUP BY StatusID;

SELECT MAX(Flights.TotalCustomerMileage) FROM Flights
GROUP BY StatusID;

SELECT COUNT(Aircraft)
FROM FirstTableFlights
WHERE Aircraft LIKE '%Boeing%';

SELECT *
FROM FirstTableFlights
WHERE FlightMileage BETWEEN 300 AND 2000;

SELECT AVG(FirstTableFlights.TotalCustomerMileage) AS Avg_Flight_Mileage
FROM FirstTableFlights
         INNER JOIN(
    SELECT CustomerStatus
    FROM FirstTableFlights) AS Status
                   ON FirstTableFlights.CustomerStatus = Status.CustomerStatus
GROUP BY
    FirstTableFlights.CustomerStatus;

SELECT COUNT(FirstTableFlights.Aircraft) AS Quantity_Fligth_Gold
FROM FirstTableFlights
         INNER JOIN(
    SELECT CustomerStatus LIKE '%GOLD%'
    FROM FirstTableFlights) AS Status
GROUP BY
    FirstTableFlights.CustomerStatus;

SELECT *,
       COUNT(Aircraft) AS Quantity_Fligth_Gold
FROM (SELECT Aircraft
      FROM FirstTableFlights
      WHERE CustomerStatus = 'Gold'
      UNION ALL
      SELECT Aircraft
      FROM FirstTableFlights
      WHERE CustomerStatus = 'Gold') AS GOLD_DATA
GROUP BY
    Aircraft
ORDER BY
    Quantity_Fligth_Gold DESC
    LIMIT 1;