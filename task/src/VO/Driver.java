package VO;

public class Driver {
    private String driverId;//司机账号
    private String password;//司机密码
    private String phone;//司机电话
    private String description;//司机具体信息



    public Driver(String driverId, String password, String phone, String description) {
        this.driverId = driverId;
        this.password = password;
        this.phone = phone;
        this.description = description;
    }


    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "driverId='" + driverId + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
