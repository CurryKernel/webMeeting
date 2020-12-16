package VO;

//因为不属于对应实体，暂时放在这里，只是为了用于多表查询存储数据显示在页面上。可以另起一个文件夹
public class ShowOrderHotel {
    private String userId;//预定酒店的用户账号
    private String userName;
    private String phone;//用户电话
    private Integer people;//住房人数
    private String time;//会议开始时间，记得使用DBDate类里的方法
    private Integer state;//预定状态，0表示未审核，1表示未通过，2,表示已通过
    private String hotelId;//酒店ID

    public ShowOrderHotel(String userId, String userName, String phone,Integer people, String time,Integer state, String hotelId) {
        this.userId = userId;
        this.people = people;
        this.state = state;
        this.hotelId = hotelId;
        this.userName = userName;
        this.phone = phone;
        this.time = time;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getPeople() {
        return people;
    }

    public void setPeople(Integer people) {
        this.people = people;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
