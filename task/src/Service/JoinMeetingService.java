package Service;

import DAO.JoinMeetingRespository;
import DAO.impl.JoinMeetingImpl;
import VO.User;

import java.util.ArrayList;
import java.util.List;

public class JoinMeetingService {
    private JoinMeetingRespository joinMeetingRespository = new JoinMeetingImpl();




    //根据会议id查所有参加的用户，返回一个userId的集合，查用户信息还得根据用户名去查表
    public List<User> findByMeetingId(String meetingId, String partUserId){
        UserService userService = new UserService();
        List<String> list = joinMeetingRespository.findByMeetingId(meetingId,partUserId);
        List<User> userList = new ArrayList<>();
        for(int i = 0;i<list.size();i++){
            User user = userService.findByUserId(list.get(i)).get(0);
            userList.add(user);
        }
        return userList;
    }


    //根据用户id和会议id删除记录
    public void deleteByUserIdAndMeetingId(String userId, String meetingId){
        joinMeetingRespository.deleteByUserIdAndMeetingId(userId,meetingId);
    }
}
