package Service;

import DAO.MeetingRespository;
import DAO.impl.MeetingImpl;
import VO.Meeting;
import VO.User;

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
}
