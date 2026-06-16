package lab6.com;

import java.sql.*;

/**
 * Data Access Object for the userprofile table.
 * Encapsulates all SQL/JDBC logic so JSP pages stay clean.
 */
public class UserDAO {

    private static final String URL  = "jdbc:mysql://localhost:3306/CSA3023";
    private static final String USER = "root";
    private static final String PASS = ""; // change if you set a MySQL root password

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    /** Returns true if the username already exists. */
    public boolean usernameExists(String username) throws Exception {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                 "SELECT username FROM userprofile WHERE username = ?")) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    /** Inserts a new user record. Returns true if successful. */
    public boolean insertUser(User user) throws Exception {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                 "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)")) {
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getFirstname());
            pstmt.setString(4, user.getLastname());
            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * Validates login credentials.
     * Returns a populated User object (firstname/lastname filled) if valid,
     * or null if the username/password combination is invalid.
     */
    public User validateLogin(String username, String password) throws Exception {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                 "SELECT username, firstname, lastname FROM userprofile " +
                 "WHERE username = ? AND password = ?")) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUsername(rs.getString("username"));
                    user.setFirstname(rs.getString("firstname"));
                    user.setLastname(rs.getString("lastname"));
                    return user;
                }
                return null;
            }
        }
    }
}
