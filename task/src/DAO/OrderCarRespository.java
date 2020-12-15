package DAO;

import VO.OrderCar;
import VO.OrderInfo;

import java.util.List;

public interface OrderCarRespository {
    //查全部
    public List<OrderCar> findAll(int currentPage, int pageSize);
    //查全部
    public List<OrderCar> findAll();
    //查，根据用户 id 查
    public List<OrderCar> findByUserId(String userId);
    //查，根据用户 id 查，分页
    public List<OrderCar> findByUserId(String userId, int currentPage, int pageSize);

    public List<OrderInfo> findOrderInfos(String driverId);
    //增
    public void insert(String userId, int people, String place, int state, String deadline,String driverId);

    //根据用户 id 删
    public void deleteByUserId(String userId);

    //改,根据用户 id 改
    public void update(String userId, String userId1, int people, String place, int state, String deadline);


    public boolean changeStatue(String userId, String deadline);

    public boolean changeStatus(String userId ,String deadline);

    public int count(String userId);
    //查总记录数
    public int count();
}
