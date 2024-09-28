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

------------------------------------------

-- Crear tabla de clientes
CREATE TABLE Clientes (
        id_cliente INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(255) NOT NULL,
        estado VARCHAR(50),
        kilometraje_total INT NOT NULL
);


-- Crear tabla de vuelos
CREATE TABLE Vuelos (
        id_vuelo INT AUTO_INCREMENT PRIMARY KEY,
        numero_vuelo VARCHAR(50) NOT NULL,
        kilometraje_vuelo INT NOT NULL
);

--Crear tabla de aeronaves
CREATE TABLE Aeronaves (
        id_aeronave INT AUTO_INCREMENT PRIMARY KEY,
        modelo VARCHAR(255) NOT NULL,
        total_asientos INT NOT NULL
);

-- Crear tabla de Reservas
CREATE TABLE Reservas (
        id_reserva INT AUTO_INCREMENT PRIMARY KEY,
        id_cliente INT,
        id_vuelo INT,
        id_aeronave INT,
        cantidad_pedida INT NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
        FOREIGN KEY (id_vuelo) REFERENCES Vuelos(id_vuelo),
        FOREIGN KEY (id_aeronave) REFERENCES Aeronaves(id_aeronave)
        );

-- Insertar datos tabla clientes
INSERT INTO Clientes (nombre, estado, kilometraje_total) VALUES
        ('Agustine Riviera', 'Silver', 115235),
        ('Alaina Sepulvida', 'None', 6008),
        ('Tom Jones', 'Gold', 205767),
        ('Sam Rio', 'None', 2653),
        ('Jessica James', 'Silver', 127656),
        ('Ana Janco', 'Silver', 136773),
        ('Jennifer Cortez', 'Gold', 300582),
        ('Christian Janco', 'Silver', 14642);

-- Insertar datos tabla vuelos
INSERT INTO Vuelos (numero_vuelo, kilometraje_vuelo) VALUES
        ('DL143', 135),
        ('DL122', 4370),
        ('DL53', 2078),
        ('DL222', 1765),
        ('DL37', 531);

-- Insertar datos tabla aeronaves
INSERT INTO Aeronaves (modelo, total_asientos) VALUES
        ('Boeing 747', 400),
        ('Airbus A330', 236),
        ('Boeing 777', 264);

-- Insertar datos tabla reserva
INSERT INTO Reservas (id_cliente, id_vuelo, id_aeronave, cantidad) VALUES
((SELECT id_cliente FROM Clientes WHERE nombre =
        'Agustine Riviera'), (SELECT id_vuelo FROM Vuelos WHERE numero_vuelo = 'DL143'), (SELECT id_aeronave FROM Aeronaves WHERE modelo = 'Boeing 747'), 1),
        ((SELECT id_cliente FROM Clientes WHERE nombre =
        'Agustine Riviera'), (SELECT id_vuelo FROM Vuelos WHERE numero_vuelo = 'DL122'), (SELECT id_aeronave FROM Aeronaves WHERE modelo = 'Airbus A330'), 1),
        ((SELECT id_cliente FROM Clientes WHERE nombre =
        'Alaina Sepulvida'), (SELECT id_vuelo FROM Vuelos WHERE numero_vuelo = 'DL122'), (SELECT id_aeronave FROM Aeronaves WHERE modelo = 'Airbus A330'), 1),
        ((SELECT id_cliente FROM Clientes WHERE nombre =
        'Tom Jones'), (SELECT id_vuelo FROM Vuelos WHERE numero_vuelo = 'DL122'), (SELECT id_aeronave FROM Aeronaves WHERE modelo

-- obtener Nubero total de vuelos
SELECT COUNT(*) AS total_vuelos FROM Vuelos;

--Obtener distancia promedio del vuelo
SELECT AVG(kilometraje_vuelo) AS distancia_promedio FROM Vuelos;

--Obtener el numero promedio de millas voladas por los clienes agrupados por estatus
SELECT AVG(total_asientos) AS promedio_asientos FROM Aeronaves;

--Obtener el numero maximo de millas voladas por los clientes agrupados por estatus
        SELECT estado, MAX(kilometraje_total) AS max_millas
           FROM Clientes
           GROUP BY estado;

-- Obtener el numero total de aeronaves con el nombre boeing
SELECT COUNT(*) AS total_boeing
FROM Aeronaves
WHERE modelo LIKE '%Boeing%';

--Encontrar todos los vuelos con una distancia de entre 300 y 2000 millas
SELECT *
FROM Vuelos
WHERE kilometraje_vuelo BETWEEN 300 AND 2000;

-- Encontrar la distancia promedio de vuelo
SELECT c.estado, AVG(v.kilometraje_vuelo) AS distancia_promedio
FROM Reservas r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Vuelos v ON r.id_vuelo = v.id_vuelo
GROUP BY c.estado;

--Encontrar la aeronave mas reservada por los miembros del estatus oro
SELECT a.modelo, COUNT(*) AS num_reservas
FROM Reservas r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Aeronaves a ON r.id_aeronave = a.id_aeronave
WHERE c.estado = 'Gold'
GROUP BY a.modelo
ORDER BY num_reservas DESC
LIMIT 1;