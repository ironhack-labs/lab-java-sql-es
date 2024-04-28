CREATE SCHEMA blog_info;

USE blog_info;

-- created a new schema and chose the schema to insert the tables to

CREATE TABLE blog_titles (
    blog_id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(50),
    title VARCHAR(255),
    word_count INT,
    views INT
);

INSERT INTO blog_titles (author, title, word_count, views)
VALUES
    ('Maria Charlotte', 'Best Paint Colors', 814, 14),
    ('Juan Perez', 'Small Space Decorating Tips', 1146, 221),
    ('Maria Charlotte', 'Hot Accessories', 986, 105),
    ('Maria Charlotte', 'Mixing Textures', 765, 22),
    ('Juan Perez', 'Kitchen Refresh', 1242, 307),
    ('Maria Charlotte', 'Homemade Art Hacks', 1002, 193),
    ('Gemma Alcocer', 'Refinishing Wood Floors', 1571, 7542);


-- displaying different information:

-- showing everything
SELECT *
FROM blog_titles;

-- number of views per author
SELECT author, SUM(views) AS total_views
FROM blog_titles
GROUP BY author
ORDER BY total_views DESC;


-- author ranking based on word count per views. "return on investment" of words and views
SELECT
    author,
    SUM(views) / SUM(word_count) AS return_per_views,
    ROW_NUMBER() OVER (ORDER BY SUM(views) / SUM(word_count) DESC) AS author_ranking
FROM blog_titles
GROUP BY author
ORDER BY return_per_views DESC;

