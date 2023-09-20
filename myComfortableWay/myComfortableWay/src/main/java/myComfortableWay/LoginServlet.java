package myComfortableWay;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 5456387913995516140L;
	
	private Connection connection;
    private PreparedStatement statement;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Create the database connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_comfortable_way", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            // Close the database connection
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        try {
            // Prepare the SQL statement
            String query = "SELECT * FROM users WHERE username = ? AND password = ? AND user_type = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, type);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();
            System.out.println("testg");
            System.out.printf("%s %s %s\n", username, password, type);
            // Check if the user is authenticated
            if (resultSet.next()) {
                if (type.equals("Administrator")) {
                	System.out.println("admin");
                    response.sendRedirect("admin.jsp");
                } else if (type.equals("Driver")) {
                	System.out.println("vozac");
                    response.sendRedirect("driver.jsp");
                }
            } else {
            	System.out.println("nije nadjeno");
                request.setAttribute("errorMessage", "Uneti su pogrešni podaci.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
