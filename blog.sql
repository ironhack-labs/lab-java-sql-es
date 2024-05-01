
CREATE TABLE Authors
(
    AuthorId    int          NOT NULL AUTO_INCREMENT,
    Name        varchar(255) NOT NULL,
    PRIMARY KEY (AuthorId)
);

CREATE TABLE Posts
(
    PostId          int             NOT NULL AUTO_INCREMENT,
    AuthorId        int             NOT NULL,
    Title          varchar(255)    NOT NULL,
    WordCount       int             NOT NULL,
    Views           int             NOT NULL,
    PRIMARY KEY (PostId),
    FOREIGN KEY (AuthorId) REFERENCES Authors (AuthorId)
);

INSERT INTO Authors (Name)
VALUES  ('Maria Charlotte'),
        ('Juan Perez'),
        ('Gemma Alcocer');

INSERT INTO Posts (AuthorId, Title, WordCount, Views)
VALUES  (1, 'Best Paint Colors', 814, 14),
        (2, 'Small Space Decorating Tips', 1146, 221),
        (1, 'Hot Accessories', 986, 105),
        (1, 'Mixing Textures', 765, 22),
        (2, 'Kitchen Refresh', 1242, 307),
        (1, 'Homemade Art Hacks', 1002, 193),
        (3, 'Refinishing Wood Floors', 1571, 7542);