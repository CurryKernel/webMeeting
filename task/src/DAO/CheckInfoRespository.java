package DAO;

import VO.CheckInfo;

import java.util.List;

public interface CheckInfoRespository {
    //查全部用户的信息，无分页
    public List<CheckInfo> findAll();

    //查全部用户的信息，分页
    public List<CheckInfo> findAll(int pageId, int pageSize);
    public List<CheckInfo> selets(CheckInfo t);

    //通过userId查，得到该用户信息
    /*
     * 2020/11/26  findByUserId(int userId)功能完成
     * */
    public List<CheckInfo> findByUserId(String userId);
    public List<CheckInfo> findByUserId(String userId, int currentPage, int pageSize);

    //查该用户参加的会议，返回的是 会议号 集合，需要通过会议号去找相应的会议
    public List<String> getJoinMeetings(String userId);

    //增
    public void insert(String userId, String userName, String password, String phone, String department, String email);

    //删
    public int deleteByUserId(String userId);
   // public int delete(CheckInfo ci);

    //改
    public void update(String userId, String username, String password, String phone, String department, String email);

    //总记录数
    public int count();


}
