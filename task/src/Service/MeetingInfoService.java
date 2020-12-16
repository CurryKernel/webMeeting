package Service;

import DAO.MeetingRespository;
import DAO.impl.MeetingImpl;
import VO.Meeting;

import java.util.List;

public class MeetingInfoService {
    private MeetingRespository meetingInfo = new MeetingImpl();
    public List<Meeting> findAll(){
        return meetingInfo.findAll();
    }

    //根据用户ID一部分查询全部用户
    public List<Meeting> findByPartOfUserId(String partId){
        return meetingInfo.findByPartOfUserId(partId);
    }

    //根据会议id修改
    public void update(String meetingId,Meeting meeting){
        meetingInfo.update(meetingId,meeting);
    }

    public String checkMeetingId(String meetingId){
        return meetingInfo.checkMeetingId(meetingId);
    }

    public int updatePeopleByMeetingId(String meetingId,int peopleCount){
        return meetingInfo.updatePeopleByMeetingId(meetingId,peopleCount);
    }
    public int insert(String meetingId, String userId, String place, int peopleCount, String time, String detail ){
        return meetingInfo.insert(meetingId,userId,place,peopleCount,time,detail);
    }
}
