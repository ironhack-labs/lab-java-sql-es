
![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# LAB | Java SQL

## Introducción

Acabamos de aprender cómo normalizar bases de datos así como cómo crear esquemas de base de datos y cómo realizar consultas SQL complejas, así que practiquemos un poco más.

<br>

## Requisitos

1. Haz un fork de este repositorio.
2. Clona este repositorio.
3. Añade a tu instructor y a los calificadores de la clase como colaboradores de tu repositorio. Si no estás seguro de quiénes son los calificadores de tu clase, pregunta a tu instructor o consulta la presentación del primer día.
4. En el repositorio, crea un proyecto de Java y añade el código para las siguientes tareas.

## Entrega

Una vez que termines la tarea, envía un enlace URL a tu repositorio o tu solicitud de extracción en el campo de abajo.

<br>

## Instrucciones

1. Normalice la siguiente base de datos de blog y escriba los scripts DDL para crear las tablas de la base de datos:

| author          | title                       | word count | views |  
| --------------- | --------------------------- | ---------- | ----- |  
| Maria Charlotte | Best Paint Colors           | 814        | 14    |  
| Juan Perez      | Small Space Decorating Tips | 1146       | 221   |  
| Maria Charlotte | Hot Accessories             | 986        | 105   |  
| Maria Charlotte | Mixing Textures             | 765        | 22    |  
| Juan Perez      | Kitchen Refresh             | 1242       | 307   |  
| Maria Charlotte | Homemade Art Hacks          | 1002       | 193   |  
| Gemma Alcocer   | Refinishing Wood Floors     | 1571       | 7542  |  

<br>  

2. Normalice la siguiente base de datos de aerolíneas y escriba los scripts DDL para crear las tablas de la base de datos:

| Customer Name    | Customer Status | Flight Number | Aircraft    | Total Aircraft Seats | Flight Mileage | Total Customer Mileage |  
| ---------------- | --------------- | ------------- | ----------- | -------------------- | -------------- | ---------------------- |  
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |  
| Agustine Riviera | Silver          | DL122         | Airbus A330 | 236                  | 4370           | 115235                 |  
| Alaina Sepulvida | None            | DL122         | Airbus A330 | 236                  | 4370           | 6008                   |  
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |  
| Tom Jones        | Gold            | DL122         | Airbus A330 | 236                  | 4370           | 205767                 |  
| Tom Jones        | Gold            | DL53          | Boeing 777  | 264                  | 2078           | 205767                 |  
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |  
| Sam Rio          | None            | DL143         | Boeing 747  | 400                  | 135            | 2653                   |  
| Agustine Riviera | Silver          | DL143         | Boeing 747  | 400                  | 135            | 115235                 |  
| Tom Jones        | Gold            | DL222         | Boeing 777  | 264                  | 1765           | 205767                 |  
| Jessica James    | Silver          | DL143         | Boeing 747  | 400                  | 135            | 127656                 |  
| Sam Rio          | None            | DL143         | Boeing 747  | 400                  | 135            | 2653                   |  
| Ana Janco        | Silver          | DL222         | Boeing 777  | 264                  | 1765           | 136773                 |  
| Jennifer Cortez  | Gold            | DL222         | Boeing 777  | 264                  | 1765           | 300582                 |  
| Jessica James    | Silver          | DL122         | Airbus A330 | 236                  | 4370           | 127656                 |  
| Sam Rio          | None            | DL37          | Boeing 747  | 400                  | 531            | 2653                   |  
| Christian Janco  | Silver          | DL222         | Boeing 777  | 264                  | 1765           | 14642                  |  

<br>  

3. En la base de datos de aerolíneas escriba el script SQL para obtener el número total de vuelos en la base de datos.
4. En la base de datos de aerolíneas escriba el script SQL para obtener la distancia promedio de vuelo.
5. En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de asientos.
6. En la base de datos de aerolíneas escriba el script SQL para obtener el número promedio de millas voladas por los clientes agrupados por estatus.
7. En la base de datos de aerolíneas escriba el script SQL para obtener el número máximo de millas voladas por los clientes agrupados por estatus.
8. En la base de datos de aerolíneas escriba el script SQL para obtener el número total de aeronaves con un nombre que contiene Boeing.
9. En la base de datos de aerolíneas escriba el script SQL para encontrar todos los vuelos con una distancia entre 300 y 2000 millas.
10. En la base de datos de aerolíneas escriba el script SQL para encontrar la distancia promedio de vuelo reservada agrupada por estatus de cliente (esto requerirá una unión).
11. En la base de datos de aerolíneas escriba el script SQL para encontrar la aeronave más a menudo reservada por los miembros de estatus de oro (esto requerirá una unión).

<br>  

## FAQs (Preguntas frecuentes)

<br>

<details>  
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">Estoy atascado y no sé cómo resolver el problema o por dónde empezar. ¿Qué debo hacer?</summary>  

 <br> <!-- ✅ -->  

  Si estás atascado en tu código y no sabes cómo resolver el problema o por dónde empezar, debes dar un paso atrás y tratar de formular una pregunta clara y directa sobre el problema específico que enfrentas. El proceso que seguirás al tratar de definir esta pregunta te ayudará a limitar el problema y a encontrar soluciones potenciales.

  Por ejemplo, ¿estás enfrentando un problema porque no entiendes el concepto o estás recibiendo un mensaje de error que no sabes cómo arreglar? Por lo general, es útil intentar formular el problema de la manera más clara posible, incluyendo cualquier mensaje de error que estés recibiendo. Esto puede ayudarte a comunicar el problema a otras personas y, potencialmente, a obtener ayuda de tus compañeros o recursos en línea.

  Una vez que tengas una comprensión clara del problema, deberías poder comenzar a trabajar hacia la solución.

</details>  

<br>

<details>  
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">Cómo crear una tabla e insertar datos en ella en SQL?</summary>  

 <br> <!-- ✅ -->  

Crear una tabla e insertar datos en ella son las dos tareas más básicas que realizarás en SQL. Aquí hay una guía para hacerlo:

1. Crear una tabla

Para crear una tabla, debes usar la declaración CREATE TABLE. Aquí hay un ejemplo de cómo puedes crear una tabla llamada "empleados":

  ```sql
  CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
  );
  ```

2. Insertar datos en una tabla

Una vez que has creado una tabla, puedes insertar datos en ella. Para insertar datos, usas la declaración INSERT INTO. Aquí hay un ejemplo de cómo puedes insertar datos en la tabla "empleados":

  ```sql
  INSERT INTO employees (name, age, salary)
  VALUES ('John Doe', 32, 50000),
        ('Jane Doe', 28, 45000),
        ('Jim Smith', 40, 55000);
  ```

El código anterior inserta tres filas en la tabla "empleados". Puedes insertar tantas filas como quieras, solo separa cada fila con una coma.

</details>  

<br>

<details>  
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">¿Cuál es la diferencia entre usar "INNER JOIN", "LEFT JOIN", "RIGHT JOIN" y "FULL OUTER JOIN" en SQL?</summary>  

 <br> <!-- ✅ -->  

Un `INNER JOIN` solo devuelve las filas que tienen valores coincidentes en ambas tablas. Solo devuelve los valores comunes.

Un `LEFT JOIN` devuelve todas las filas de la tabla izquierda y los valores coincidentes de la tabla derecha. Si no hay coincidencia, devuelve valores NULL.

Un `RIGHT JOIN` devuelve todas las filas de la tabla derecha y los valores coincidentes de la tabla izquierda. Si no hay coincidencia, devuelve valores NULL.

Un `FULL OUTER JOIN` devuelve todas las filas de ambas tablas, incluyendo valores coincidentes y no coincidentes. Si no hay coincidencia, devuelve valores NULL.

Fragmentos de código:

INNER JOIN:

  ```sql
  SELECT *
  FROM table1
  INNER JOIN table2
  ON table1.column = table2.column;
  ```

LEFT JOIN:  
  
  ```sql
  SELECT *
  FROM table1
  LEFT JOIN table2
  ON table1.column = table2.column;
  ``` 

RIGHT JOIN:  
  
  ```sql
  SELECT *
  FROM table1
  RIGHT JOIN table2
  ON table1.column = table2.column;
  ```

FULL OUTER JOIN:  
  
  ```sql
  SELECT *
  FROM table1
  FULL OUTER JOIN table2
  ON table1.column = table2.column;
  ```
  
</details>  

<br>
  
<details>  
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">¿Cuál es el propósito de utilizar "GROUP BY", "ORDER BY" y "LIMIT" en SQL?</summary>  
  
 <br> <!-- ✅ -->  
  
 1. `GROUP BY` en SQL se utiliza para agrupar filas que tengan los mismos valores en las columnas especificadas. Esto es útil cuando quieres realizar funciones de agregación (como SUM, AVG, MIN, MAX) en cada grupo, en lugar de en el conjunto de resultados completo. Por ejemplo, si tienes una tabla de transacciones de ventas y quieres ver las ventas totales de cada vendedor, utilizarías el siguiente código SQL:  
  
   ```sql
   SELECT salesperson, SUM(sales)
   FROM sales_table
   GROUP BY salesperson;
   ```

 2. `ORDER BY` en SQL se utiliza para ordenar el conjunto de resultados en orden ascendente o descendente basado en una o más columnas. Por ejemplo, si tienes una tabla de clientes y quieres ver la lista ordenada por apellido, utilizarías el siguiente código SQL:  
  
   ```sql
   SELECT *
   FROM customers
   ORDER BY last_name;
   ```

 3. `LIMIT` en SQL se utiliza para especificar el número máximo de filas que se devolverán en el conjunto de resultados. Por ejemplo, si solo quieres ver los primeros 10 clientes en la lista, utilizarías el siguiente código SQL:  
  
   ```sql
   SELECT *
   FROM customers
   LIMIT 10;
   ```

  Al combinar estos comandos, puedes producir consultas sofisticadas que pueden satisfacer una amplia gama de necesidades.  
  
</details>  
  
  <br> 

<details>
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">No puedo enviar cambios a mi repositorio. ¿Qué debo hacer?</summary>

  <!-- ✅ -->

  Si no puedes enviar cambios a tu repositorio, aquí hay algunos pasos que puedes seguir:

  1. Verifica tu conexión a internet: Asegúrate de que tu conexión a internet sea estable y funcione.
  2. Verifica la URL de tu repositorio: Asegúrate de estar usando la URL correcta de tu repositorio para enviar tus cambios.
  3. Revisa tus credenciales de Git: Asegúrate de que tus credenciales de Git estén actualizadas y correctas. Puedes revisar tus credenciales usando el siguiente comando:

  ```bash
  git config --list
  ```

  4. Actualiza tu repositorio local: Antes de enviar cambios, asegúrate de que tu repositorio local esté actualizado con el repositorio remoto. Puedes actualizar tu repositorio local usando el siguiente comando:

  ```bash
  git fetch origin
  ```

  5. Revisa posibles conflictos: Si hay conflictos entre tu repositorio local y el repositorio remoto, resuélvelos antes de enviar cambios.
  6. Envía cambios: Una vez que hayas resuelto los conflictos y actualizado tu repositorio local, puedes intentar enviar cambios nuevamente usando el siguiente comando:

  ```bash
  git push origin <branch_name>
  ```

</details>