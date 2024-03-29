package DAO;

import VO.User;

import java.util.List;

public interface UserRespository {
    //查全部用户的信息，无分页
    public List<User> findAll();

    //查全部用户的信息，分页
    public List<User> findAll(int pageId, int pageSize);

    //通过userId查，得到该用户信息
/*
* 2020/11/26  findByUserId(int userId)功能完成
* */
    public List<User> findByUserId(String userId);

    //查该用户参加的会议，返回的是 会议号 集合，需要通过会议号去找相应的会议
    public List<String> getJoinMeetings(String userId);

    //增
    public String insert(String userId, String username, String password, String phone,String department,String email);

    //删
    public void deleteByUserId(String userId);

    //改
    public void update(String userId, String username, String password, String phone,String department,String email);

    //总记录数
    public int count();

    //根据用户ID修改密码
    public void updatePasswordById(String id, String password);

    //根据用户ID一部分查询全部用户
    public List<User> findByPartOfUserId(String partId);

    public String checkUserId(String userId);

    public String check(String userId,String password);

}
