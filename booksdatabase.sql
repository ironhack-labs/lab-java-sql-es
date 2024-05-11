DROP SCHEMA IF EXISTS books;
CREATE SCHEMA books;

USE books;
CREATE TABLE author
(
    id   INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE post
(
    id         INT NOT NULL AUTO_INCREMENT,
    name       VARCHAR(255),
    word_count INT,
    views      INT,
    author_id  INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id)
        REFERENCES author (id)
);