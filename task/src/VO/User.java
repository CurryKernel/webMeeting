package VO;

public class User {
    private String userId;//用户账号
    private String username;
    private String password;//用户密码
    private String phone;//用户电话
    private String department;//用户所属部门
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public User(String userId, String username, String password, String phone,String department,String email) {
        this.userId = userId;
        this.email=email;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.department = department;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", department='" + department + '\'' +
                ",email='"+email+'\''+
                '}';
    }
}
