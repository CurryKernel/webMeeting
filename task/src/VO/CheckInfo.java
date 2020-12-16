package VO;

public class CheckInfo {
    private String meetingId;
    private String userId;//用户账号
    private String userName;
    private String phone;//用户电话
    private String department;//用户所属部门
    private String email;

    public CheckInfo(String meetingId, String userId, String phone, String department, String email, String userName) {
        this.meetingId = meetingId;
        this.userId = userId;
        this.userName = userName;
        this.phone = phone;
        this.department = department;
        this.email=email;
    }
    public CheckInfo() {
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return userName;
    }

    public void setUsername(String userName) {
        this.userName = userName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
    public String getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(String meetingId) {
        this.meetingId = meetingId;
    }

    @Override
    public String toString() {
        return "CheckInfo{" +
                "meetingId='" + meetingId + '\'' +
                "userId='" + userId + '\'' +
                ",userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", department='" + department + '\'' +
                ",email='"+email+'\''+
                '}';
    }

}