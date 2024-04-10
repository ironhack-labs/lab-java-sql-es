-- Drop the existing tables if they exist
DROP TABLE IF EXISTS blog_posts;
DROP TABLE IF EXISTS authors;

-- Create table for authors
CREATE TABLE authors (
    author_id INT PRIMARY KEY, -- Primary key for authors
    author_name VARCHAR(100) NOT NULL -- Name of the author
);

-- Create table for blog posts
CREATE TABLE blog_posts (
    post_id SERIAL PRIMARY KEY, -- Auto-incrementing primary key for posts
    author_id INT NOT NULL, -- Foreign key referencing the authors table
    title VARCHAR(255) NOT NULL, -- Title of the blog post
    word_count INT NOT NULL, -- Number of words in the post
    views INT NOT NULL, -- Number of views for the post
    FOREIGN KEY (author_id) REFERENCES authors(author_id) -- Foreign key constraint
);

-- Inserting sample data into the authors table
INSERT INTO authors (author_id, author_name) VALUES 
(1, 'Maria Charlotte'),
(2, 'Juan Perez'),
(3, 'Gemma Alcocer');

-- Inserting sample data into the blog_posts table
INSERT INTO blog_posts (author_id, title, word_count, views) VALUES 
(1, 'Best Paint Colors', 814, 14),
(2, 'Small Space Decorating Tips', 1146, 221),
(1, 'Hot Accessories', 986, 105),
(1, 'Mixing Textures', 765, 22),
(2, 'Kitchen Refresh', 1242, 307),
(1, 'Homemade Art Hacks', 1002, 193),
(3, 'Refinishing Wood Floors', 1571, 7542);
