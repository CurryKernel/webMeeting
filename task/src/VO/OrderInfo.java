package VO;

public class OrderInfo {
    private String userName;
    private String phone;
    private String place;
    private String deadline;
    private String people;

    public OrderInfo() {
    }

    public OrderInfo(String userName, String phone, String place, String deadline, String people) {
        this.userName = userName;
        this.phone = phone;
        this.place = place;
        this.deadline = deadline;
        this.people = people;
    }

    public String getDeadline() {
        return deadline;
    }

    public String getPeople() {
        return people;
    }

    public String getPhone() {
        return phone;
    }

    public String getUserName() {
        return userName;
    }

    public String getPlace() {
        return place;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", place='" + place + '\'' +
                ", deadline='" + deadline + '\'' +
                ", people='" + people + '\'' +
                '}';
    }
}
