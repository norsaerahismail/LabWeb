package lab6.com;

/**
 * User JavaBean - represents a record in the userprofile table.
 * Used to encapsulate user data between insertUser.html/login.jsp
 * and the processing JSP pages.
 */
public class User {

    private String username;
    private String password;
    private String firstname;
    private String lastname;

    // Default constructor (required for JSP <jsp:useBean>)
    public User() {
    }

    // Getters and Setters

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Override
    public String toString() {
        return "User{username='" + username + "', firstname='" + firstname +
               "', lastname='" + lastname + "'}";
    }
}
