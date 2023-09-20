package myComfortableWay;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addSituationServlet")
public class addSituationServlet extends HttpServlet {
	private static final long serialVersionUID = -3351060204645008327L;
	
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
        String crossingName = request.getParameter("crossingName");
        String country = request.getParameter("country");
        String status = request.getParameter("status");
        String waitingSerbiaStr = request.getParameter("waitingSerbia");
        String waitingOtherCountryStr = request.getParameter("waitingOtherCountry");

        // Perform validation
        if (crossingName.isEmpty() || country.isEmpty() || status.isEmpty() || waitingSerbiaStr.isEmpty() || waitingOtherCountryStr.isEmpty()) {
            request.setAttribute("errorMessage", "Sva polja moraju biti popunjena.");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            return;
        }

        int waitingSerbia;
        int waitingOtherCountry;
        try {
            waitingSerbia = Integer.parseInt(waitingSerbiaStr);
            waitingOtherCountry = Integer.parseInt(waitingOtherCountryStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Uneta je pogrešna vrednost");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            return;
        }

        try {
            // Prepare the SQL statement
            String query = "INSERT INTO border_crossings (name, status, country, waiting_serbia, waiting_other_country) " +
                    "VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, crossingName);
            statement.setString(2, status);
            statement.setString(3, country);
            statement.setInt(4, waitingSerbia);
            statement.setInt(5, waitingOtherCountry);

            // Execute the query
            int rowsAffected = statement.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("errorMessage", "Neuspešno dodavanje.");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors appropriately
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
