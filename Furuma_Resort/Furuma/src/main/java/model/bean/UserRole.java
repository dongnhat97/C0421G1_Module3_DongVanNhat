package model.bean;

public class UserRole {
    private int userRoleId;
    private String useName;
    private int role_id;

    public UserRole() {
    }

    public UserRole(int userRoleId, String useName, int role_id) {
        this.userRoleId = userRoleId;
        this.useName = useName;
        this.role_id = role_id;
    }

    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String getUseName() {
        return useName;
    }

    public void setUseName(String useName) {
        this.useName = useName;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

}
