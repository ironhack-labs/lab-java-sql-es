CREATE TABLE authors(
	id INT NOT NULL,
    name_author VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE books(
	id INT NOT NULL,
    title VARCHAR(150),
    author_id INT NOT NULL,
    word_count INT,
    views INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
