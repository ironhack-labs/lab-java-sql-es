package org.example;

class AirlineDatabaseQueriesImpl extends AirlineDatabaseQueries {
    public AirlineDatabaseQueriesImpl() {
        super();
    }

    static AirlineDatabaseQueriesImpl createAirlineDatabaseQueriesImpl() {
        return new AirlineDatabaseQueriesImpl();
    }
}
