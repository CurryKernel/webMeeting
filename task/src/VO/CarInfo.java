package VO;

public class CarInfo {
    private String meetingId;//订车用户的账号
    private String userId;//订车用户的账号
    private Integer people;//乘车人数
    private String place;//乘车地点
    private Integer state;//订单状态，0表示为审核；1表示未通过，2表示已通过
    private String deadline;//预约的最晚时间，记得使用DBDate类里的方法
    private String driverId;

    public String getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(String meetingId) {
        this.meetingId = meetingId;
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

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public CarInfo(String meetingId,String userId,String driverId ,String place,String deadline ,Integer people ,Integer state  ){
        this.meetingId=meetingId;
        this.userId = userId;
        this.people = people;
        this.place = place;
        this.state = state;
        this.deadline = deadline;
        this.driverId = driverId;
    }
    public CarInfo(){

    }
    @Override
    public String toString() {
        return "CarInfo{" +
                "meetingId='" + meetingId + '\'' +
                "userId='" + userId + '\'' +
                ", people=" + people +
                ", place='" + place + '\'' +
                ", state=" + state +
                ", driverId="+driverId+
                ", deadline='" + deadline + '\'' +
                '}';
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }
}
