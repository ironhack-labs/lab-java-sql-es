CREATE SCHEMA Authors;

CREATE TABLE Authors (
                         author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                         author_name VARCHAR(255) NOT NULL
);

CREATE TABLE Posts (
                       post_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                       author_id INT NOT NULL,
                       title VARCHAR(255) NOT NULL,
                       word_count INT NOT NULL,
                       views INT NOT NULL,
                       FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_name) VALUES
                                      ('Maria Charlotte'),
                                      ('Juan Perez'),
                                      ('Gemma Alcocer');

INSERT INTO Posts (author_id, title, word_count, views) VALUES
                                                            (1, 'Best Paint Colors', 814, 14),
                                                            (2, 'Small Space Decorating Tips', 1146, 221),
                                                            (1, 'Hot Accessories', 986, 105),
                                                            (1, 'Mixing Textures', 765, 22),
                                                            (2, 'Kitchen Refresh', 1242, 307),
                                                            (1, 'Homemade Art Hacks', 1002, 193),
                                                            (3, 'Refinishing Wood Floors', 1571, 7542);