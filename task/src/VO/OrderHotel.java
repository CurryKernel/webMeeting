package VO;

import java.util.ArrayList;

public class OrderHotel {
    private String userId;//预定酒店的用户账号
    private Integer people;//住房人数
    private Integer state;//预定状态，0表示未审核，1表示未通过，2,表示已通过
    private String hotelId;//酒店ID
    private String meetingId;//会议ID;

    public OrderHotel() {

    }

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

    public OrderHotel(String userId, Integer people, Integer state, String hotelId, String meetingId) {
        this.userId = userId;
        this.people = people;
        this.state = state;
        this.hotelId = hotelId;
        this.meetingId = meetingId;
    }

    //获取当前酒店的用户ID
    /*public String getMyUserID(String hotelId){
        return userId;
    }

    public void setMyUserID(String hotelId){
        return;
    }

    public ArrayList<OrderHotel> getAll(String hotelId){
        return
    }*/









    @Override
    public String toString() {
        return "OrderHotel{" +
                "userId='" + userId + '\'' +
                ", people=" + people +
                ", state=" + state +
                '}';
    }
}
