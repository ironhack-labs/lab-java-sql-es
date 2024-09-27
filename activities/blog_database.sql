# Creación del esquema (si no existe)
CREATE SCHEMA IF NOT EXISTS blog_database;

# Seleccionar el esquema
USE blog_database;

# Creación de la tabla authors
CREATE TABLE IF NOT EXISTS authors (
                                       author_id INT AUTO_INCREMENT PRIMARY KEY,
                                       name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

# Inserción de los datos en la tabla authors
INSERT INTO authors (name) VALUES
                               ('Maria Charlotte'),
                               ('Juan Perez'),
                               ('Gemma Alcocer');

# Creación de la tabla posts
CREATE TABLE IF NOT EXISTS posts (
                                     post_id INT AUTO_INCREMENT PRIMARY KEY,
                                     title VARCHAR(255) NOT NULL,
                                     word_count INT NOT NULL,
                                     views INT NOT NULL,
                                     author_id INT,
                                     FOREIGN KEY (author_id) REFERENCES authors(author_id)
) ENGINE=InnoDB;

# Inserción de los datos en la tabla posts
INSERT INTO posts (title, word_count, views, author_id) VALUES
                                                            ('Best Paint Colors', 814, 14, 1),
                                                            ('Small Space Decorating Tips', 1146, 221, 2),
                                                            ('Hot Accessories', 986, 105, 1),
                                                            ('Mixing Textures', 765, 22, 1),
                                                            ('Kitchen Refresh', 1242, 307, 2),
                                                            ('Homemade Art Hacks', 1002, 193, 1),
                                                            ('Refinishing Wood Floors', 1571, 7542, 3);
