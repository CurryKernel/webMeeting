package Service;

import DAO.MeetingRespository;
import DAO.impl.MeetingImpl;
import VO.Meeting;

import java.util.List;

public class MyMeetingInfoService {
    private MeetingRespository myMeetingInfo = new MeetingImpl();
    public List<Meeting> findByUserId(String userId){
        return  myMeetingInfo.findByUserId(userId);
    }
}
