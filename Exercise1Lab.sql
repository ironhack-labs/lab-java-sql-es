CREATE TABLE blog
(
    autor VARCHAR(255) ,
    titulo VARCHAR(255),
    recuentoPalabras INT,
    vistas INT
);

INSERT INTO blog(autor, titulo, recuentoPalabras, vistas)
VALUES('María Charlotte', 'Los mejores colores de pintura', 814, 14),
      ('Juan Pérez', 'Consejos para decorar espacios pequeños', 1146, 221),
      ('María Charlotte', 'Accesorios calientes', 986, 105),
      ('María Charlotte', 'Mezcla de texturas', 765, 22),
      ('Juan Pérez', 'Renovación de la cocina', 1242, 307),
      ('María Charlotte', 'Trucos de arte casero', 1002, 193),
      ('Gemma Alcocer', 'Renovación de pisos de madera', 1571, 7542);