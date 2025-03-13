package model;

public class User {
    private String username;
    private String password;
    private int registrationID; // ✅ Add registrationID field

    public User(String username, String password, int registrationID) {
        this.username = username;
        this.password = password;
        this.registrationID = registrationID; // ✅ Store registrationID
    }

    public User() {
    }

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

    public int getRegistrationID() {  // ✅ Getter for registrationID
        return registrationID;
    }

    public void setRegistrationID(int registrationID) { // ✅ Setter for registrationID
        this.registrationID = registrationID;
    }
}
