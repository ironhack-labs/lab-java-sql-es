CREATE TABLE author (
    ID INT,
    Author VARCHAR(255),
    PRIMARY KEY (ID)
);

CREATE TABLE views(
    title VARCHAR(255),
    views INT,
    PRIMARY KEY (title)
);

CREATE TABLE blog(
    id INT,
    Title VARCHAR(255),
    word_count INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES author(ID),
    FOREIGN KEY (Title)REFERENCES views(title)
);


