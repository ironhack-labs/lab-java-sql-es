## TABLA ORIGINAL

| Customer Name    | Customer Status | Flight Number | Aircraft    | Total Aircraft Seats | Flight Mileage | Total Customer Mileage |
|------------------|-----------------|---------------|-------------|----------------------|----------------|------------------------|
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |
| Agustine Riviera | Silver          | DL122         | Airbus A330 | 236                  | 4370           | 115235                 |
| Alaina Sepulvida | None            | DL122         | Airbus A330 | 236                  | 4370           | 6008                   |
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |
| Tom Jones        | Gold            | DL122         | Airbus A330 | 236                  | 4370           | 205767                 |
| Tom Jones        | Gold            | DL53          | Boeing 777  | 264                  | 2078           | 205767                 |
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |
| Sam Rio          | None            | DL143         | Boeing 747  | 400                  | 135            | 2653                   |
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |
| Tom Jones        | Gold            | DL222         | Boeing 777  | 264                  | 1765           | 205767                 |
| Jessica James    | Silver          | DL143         | Boeing 747  | 400                  | 135            | 127656                 |
| Sam Rio          | None            | DL143         | Boeing 747  | 400                  | 135            | 2653                   |
| Ana Janco        | Silver          | DL222         | Boeing 777  | 264                  | 1765           | 136773                 |
| Jennifer Cortez  | Gold            | DL222         | Boeing 777  | 264                  | 1765           | 300582                 |
| Jessica James    | Silver          | DL122         | Airbus A330 | 236                  | 4370           | 127656                 |
| Sam Rio          | None            | DL37          | Boeing 747  | 400                  | 531            | 2653                   |
| Christian Janco  | Silver          | DL222         | Boeing 777  | 264                  | 1765           | 14642                  |

# 1NF


| CustomerName     | CustomerStatus | FlightNumber | Aircraft    | TotalAircraftSeats | FlightMileage | TotalCustomerMileage |
|------------------|----------------|--------------|-------------|--------------------|---------------|----------------------|
| Agustine Riviera | Silver         | DL143        | Boeing 747  | 400                | 135           | 115235               |
| Agustine Riviera | Silver         | DL122        | Airbus A330 | 236                | 4370          | 115235               |
| Alaina Sepulvida | None           | DL122        | Airbus A330 | 236                | 4370          | 6008                 |
| Tom Jones        | Gold           | DL122        | Airbus A330 | 236                | 4370          | 205767               |
| Tom Jones        | Gold           | DL53         | Boeing 777  | 264                | 2078          | 205767               |
| Tom Jones        | Gold           | DL222        | Boeing 777  | 264                | 1765          | 205767               |
| Jessica James    | Silver         | DL143        | Boeing 747  | 400                | 135           | 127656               |
| Sam Rio          | None           | DL143        | Boeing 747  | 400                | 135           | 2653                 |
| Ana Janco        | Silver         | DL222        | Boeing 777  | 264                | 1765          | 136773               |
| Jennifer Cortez  | Gold           | DL222        | Boeing 777  | 264                | 1765          | 300582               |
| Jessica James    | Silver         | DL122        | Airbus A330 | 236                | 4370          | 127656               |
| Sam Rio          | None           | DL37         | Boeing 747  | 400                | 531           | 2653                 |
| Christian Janco  | Silver         | DL222        | Boeing 777  | 264                | 1765          | 14642                |

# 2NF


| Id | CustomerName     | CustomerStatus | FlightNumber | Aircraft      | TotalAircraftSeats | FlightMileage | TotalCustomerMileage |
|----|------------------|----------------|--------------|---------------|--------------------|---------------|----------------------|
| 1  | Agustine Riviera | Silver         | DL143        | Boeing 747    | 400                | 135           | 115235               |
| 2  | Agustine Riviera | Silver         | DL122        | Airbus A330   | 236                | 4370          | 115235               |
| 3  | Alaina Sepulvida | None           | DL122        | Airbus A330   | 236                | 4370          | 6008                 |
| 4  | Tom Jones        | Gold           | DL122        | Airbus A330   | 236                | 4370          | 205767               |
| 5  | Tom Jones        | Gold           | DL53         | 	Boeing 777   | 264                | 2078          | 205767               |
| 6  | Tom Jones        | Gold           | DL222        | Boeing 777    | 264                | 1765          | 205767               |
| 7  | Jessica James    | Silver         | DL143        | Boeing 747    | 400                | 135           | 127656               |
| 8  | Sam Rio          | None           | DL143        | 	Boeing 747   | 400                | 135           | 2653                 |
| 9  | Ana Janco        | Silver         | DL222        | 	Boeing 777   | 264                | 1765          | 136773               |
| 10 | Jennifer Cortez  | 	Gold          | DL222        | 	Boeing 777   | 264                | 1765          | 300582               |
| 11 | Jessica James    | Silver         | DL122        | 	Airbus A330	 | 236                | 4370          | 127656               |
| 12 | Sam Rio          | None           | DL37         | Boeing 747    | 400                | 531           | 2653                 |
| 13 | Christian Janco  | 	Silver        | DL222        | 	Boeing 777   | 264                | 1765          | 14642                |

# 3NF

## CUSTOMER
| CustomerId | CustomerName     | CustomerStatus | TotalCustomerMileage |
|------------|------------------|----------------|----------------------|
| 1          | Agustine Rivier	 | Silver         | 115235               |
| 2          | Alaina Sepulvida | None	          | 6008                 |
| 3          | Tom Jones        | Gold	          | 205767               |
| 4          | Jessica James    | Silver         | 127656               |
| 5          | Sam Rio          | None           | 2653                 |
| 6          | Ana Janco        | Silver         | 136773               |
| 7          | Jennifer Cortez  | 	Gold          | 300582               |
| 8          | Christian Janco  | Silver         | 14642                |

## AIRCRAFT
| AircraftId | Aircraft    | TotalAircraftSeats |  
|------------|-------------|--------------------|
| 1          | Boeing 747  | 400                |
| 2          | Airbus A330 | 236                | 
| 3          | Boeing 777  | 264                | 

## FLIGTH
| FlightId | FlightNumber | FlightMileage | AircraftId |
|----------|--------------|---------------|------------|
| 1        | DL143        | 135           | 1          |
| 2        | DL122        | 4370          | 2          |
| 3        | DL53         | 2078          | 3          |
| 4        | DL222        | 1765          | 3          |
| 5        | DL37         | 531           | 1          |

## TICKET
| TicketId | CustomerId | FlightId |
|----------|------------|----------|
| 1        | 1          | 1        |
| 2        | 1          | 2        |
| 3        | 2          | 2        |
| 4        | 3          | 2        | 
| 5        | 3          | 3        |
| 6        | 3          | 4        |
| 7        | 4          | 1        |
| 8        | 5          | 1        |
| 9        | 6          | 4        |
| 10       | 7          | 4        |
| 11       | 4          | 2        |
| 12       | 5          | 5        |
| 13       | 8          | 4        | 

