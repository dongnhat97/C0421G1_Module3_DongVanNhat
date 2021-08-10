package model.bean;

public class User {
    private String user_name;
    private String passwordName;

    public User() {
    }

    public User(String user_name, String passwordName) {
        this.user_name = user_name;
        this.passwordName = passwordName;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPasswordName() {
        return passwordName;
    }

    public void setPasswordName(String passwordName) {
        this.passwordName = passwordName;
    }
}
