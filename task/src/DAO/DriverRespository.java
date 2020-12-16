package DAO;

import VO.Driver;
import VO.OrderCar;

import java.util.List;

public interface DriverRespository {
    //实现分页的查找
    public List<Driver> findAll(int pageId, int pageSize);
    //无分页的查找
    public List<Driver> findAll();
    //增
    public String insert(String driverId, String password, String phone, String description);
    //根据 id 删除
    public void deleteByDriverId(String driverId);
    //根据 id 修改，修改密码、账号、电话
    public void update(String id, String id1, String password, String phone, String description);
    //查表的总记录数
    public int count();
    //查表是否存在

    public List<Driver> findByDriverId(String driverId);

    public List<OrderCar> findOrderCarByDriverId(String driverId);

    public String checkDriverId(String driverId);

    public String check(String driverId,String password);

}
