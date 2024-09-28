-- Inserción de datos en la tabla Autor

INSERT INTO Autor (nombre) VALUES
            ('María Charlotte'),
            ('Juan Pérez'),
            ('Gemma Alcocer');

-- Inserción de datos en la tabla Artículo
INSERT INTO Articulo (titulo, recuento_de_palabras, vistas, id_autor) VALUES

        ('Los mejores colores de pintura', 814, 14, 1),
        ('Consejos para decorar espacios pequeños', 1146, 221, 2),
        ('Accesorios calientes', 986, 105, 1),
        ('Mezcla de texturas', 765, 22, 1),
        ('Renovación de la cocina', 1242, 307, 2),
        ('Trucos de arte caseros', 1002, 193, 1),
        ('Renovación de pisos de madera', 1571, 7542, 3);

-- Crear la tabla Clientes
CREATE TABLE Clientes (
        id_cliente INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(255) NOT NULL,
        estado VARCHAR(50),
        kilometraje_total INT NOT NULL
);

-- Crear la tabla Aeronaves
CREATE TABLE Aeronaves (
        id_aeronave INT AUTO_INCREMENT PRIMARY KEY,
        modelo VARCHAR(255) NOT NULL,
        total_asientos INT NOT NULL
);

-- Crear la tabla Vuelos
CREATE TABLE Vuelos (
        id_vuelo INT AUTO_INCREMENT PRIMARY KEY,
        numero_vuelo VARCHAR(50) NOT NULL,
        id_aeronave INT,
        kilometraje_vuelo INT NOT NULL,
         FOREIGN KEY (id_aeronave) REFERENCES Aeronaves(id_aeronave)
        );

-- Crear la tabla ClienteVuelo (relación muchos a muchos)
CREATE TABLE ClienteVuelo (
        id_cliente INT,
        id_vuelo INT,
        FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
      FOREIGN KEY (id_vuelo) REFERENCES Vuelos(id_vuelo),
        PRIMARY KEY (id_cliente, id_vuelo)
);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombre, estado, kilometraje_total) VALUES
        ('Riviera Agustina', 'Plata', 115235),
        ('Alaina Sepulvida', 'Ninguno', 6008),
        ('Tom Jones', 'Oro', 205767),
        ('Sam Río', 'Ninguno', 2653),
        ('Jessica James', 'Plata', 127656),
        ('Ana Janco', 'Plata', 136773),
        ('Jennifer Cortez', 'Oro', 300582),
        ('Janco Cristiano', 'Plata', 14642);

-- Insertar datos en la tabla Aeronaves
INSERT INTO Aeronaves (modelo, total_asientos) VALUES
        ('Boeing 747', 400),
        ('Airbus A330', 236),
        ('Boeing 777', 264);

-- Insertar datos en la tabla Vuelos
INSERT INTO Vuelos (numero_vuelo, id_aeronave, kilometraje_vuelo) VALUES
        ('DL143', 1, 135),
        ('DL122', 2, 4370),
        ('DL53', 3, 2078),
        ('DL222', 3, 1765),
        ('DL37', 1, 531);

-- Insertar datos en la tabla ClienteVuelo (relación muchos a muchos)
INSERT INTO ClienteVuelo (id_cliente, id_vuelo) VALUES
        (1, 1),
        (1, 2),
        (2, 2),
        (3, 2),
        (3, 3),
        (4, 1),
        (3, 4),
        (5, 1),
        (5, 2),
        (6, 4),
        (7, 4),
        (4, 5),
        (8, 4);

