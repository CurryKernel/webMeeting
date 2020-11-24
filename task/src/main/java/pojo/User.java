package main.java.pojo;

public class User {
    private String userId;
    private String userName;
    private String password;
    private String phone;
    private String email;
    private String department;

    public User(String userId, String userName, String password, String phone, String department, String email) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.department = department;
    }

    public User() {

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
