import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Application {
    public static void main(String[] args) {
        try {
            // Cargar el driver de la base de datos (por ejemplo, MySQL)
            Class.forName("com.mysql.jdbc.Driver");

            // Establecer la conexión a la base de datos
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");

            // Crear un objeto Statement
            Statement statement = connection.createStatement();

            // Leer el archivo SQL
            BufferedReader reader = new BufferedReader(new FileReader("src/main/resources/create_tables.sql"));
            StringBuilder script = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                script.append(line).append("\n");
            }
            reader.close();

            // Ejecutar el script SQL
            statement.executeUpdate(script.toString());

            // Cerrar la conexión
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

