package myComfortableWay;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filterCrossingsServlet")
public class filterCrossingsServlet extends HttpServlet {
	private static final long serialVersionUID = -976481380906483029L;
	
	private Connection connection;
    private PreparedStatement statement;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

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
        String country = request.getParameter("country");

        try {
            // Prepare the SQL statement
            String query = "SELECT * FROM border_crossings WHERE country = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, country);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // Process the query results
            List<BorderCrossing> crossings = new ArrayList<>();
            while (resultSet.next()) {
                String crossingName = resultSet.getString("name");
                String crossingCountry = resultSet.getString("country");
                int waitingSerbia = resultSet.getInt("waiting_serbia");
                int waitingOtherCountry = resultSet.getInt("waiting_other_country");

                BorderCrossing crossing = new BorderCrossing(crossingName, crossingCountry, waitingSerbia, waitingOtherCountry);
                crossings.add(crossing);
                
                // Set the filtered crossings as a request attribute
                request.setAttribute("filteredCrossings", crossings);
                request.getRequestDispatcher("filtered_crossings.jsp").forward(request, response);
                
                // Set color based on waiting time
                if (waitingSerbia < 60 && waitingOtherCountry < 60) {
                    crossing.setColor("green");
                } else if (waitingSerbia >= 60 && waitingSerbia <= 120 && waitingOtherCountry >= 60 && waitingOtherCountry <= 120) {
                    crossing.setColor("yellow");
                } else {
                    crossing.setColor("red");
                }

                crossings.add(crossing);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Greška sa bazom podataka.");
            request.getRequestDispatcher("driver.jsp").forward(request, response);
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
