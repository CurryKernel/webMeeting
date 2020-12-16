
package VO;

import java.util.ArrayList;

public class HotelInfo {
    private String meetingId;
    private String userId;//预定酒店的用户账号
    private Integer people;//住房人数
    private Integer state;//预定状态，0表示未审核，1表示未通过，2,表示已通过
    private String hotelId;//酒店ID

    public String getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(String meetingId) {
        this.meetingId = meetingId;
    }

    public HotelInfo() {

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

    public HotelInfo(String meetingId,String userId, Integer people, Integer state, String hotelId) {
        this.meetingId=meetingId;
        this.userId = userId;
        this.people = people;
        this.state = state;
        this.hotelId = hotelId;
    }




    @Override
    public String toString() {
        return "HotelInfo{" +
                "meetingId='" + meetingId + '\'' +
                ",userId='" + userId + '\'' +
                ", people=" + people +
                ", state=" + state +
                '}';
    }
}
