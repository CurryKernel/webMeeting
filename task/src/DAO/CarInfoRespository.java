package DAO;

import VO.CarInfo;

import java.util.List;

public interface CarInfoRespository {
    //查全部
    public List<CarInfo> findAll(int currentPage, int pageSize);
    //查全部
    public List<CarInfo> findAll();
    //查，根据用户 id 查
    public List<CarInfo> findByUserId(String userId);
    //查，根据用户 id 查，分页
    public List<CarInfo> findByUserId(String userId, int currentPage, int pageSize);

    //增
    public void insert(String userId, int people, String place, int state, String deadline, String driverId);

    //根据用户 id 删
    public void deleteByUserId(String userId);

    //改,根据用户 id 改
    public void update(String userId, String userId1, int people, String place, int state, String deadline);

    //查 该用户id 的记录数
    public int count(String userId);
    //查总记录数
    public int count();
}
