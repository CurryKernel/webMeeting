package Service;

import DAO.MeetingRespository;
import DAO.impl.MeetingImpl;
import VO.Meeting;

import java.util.List;

public class MeetingInfo {
    private MeetingRespository meetingInfo = new MeetingImpl();
    public List<Meeting> findAll(){
        return meetingInfo.findAll();
    }
}
