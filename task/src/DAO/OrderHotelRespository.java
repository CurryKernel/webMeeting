package DAO;

import VO.OrderHotel;

import java.util.List;

public interface OrderHotelRespository {
    //查全部
    public List<OrderHotel> findAll(int currentPage, int pageSize);
    //查全部
    public List<OrderHotel> findAll();
    //查，根据用户 id 和酒店查，分页
    public List<OrderHotel> findByUserId(String userId, String hotelId,int currentPage, int pageSize);
    //查，根据用户 id 查和酒店查
    public List<OrderHotel> findByUserId_Hotel(String userId,String hotelId);
    //查，根据酒店id查
    public List<OrderHotel> findByHotel(String hotelId);
    //查，根据住房人数及酒店ID查
    public List<OrderHotel> findByPeople_Hotel(String hotelId,int people);
    //查，根据审核状态查及酒店ID查
    public List<OrderHotel> findByState_Hotel(String hotelId,int state);

    //增
    public void insert(String userId, int people, int state,String hotelId);



    //根据用户 id 删
    public void deleteByUserId(String userId);

    //改,根据用户 id 改
    public void update(String userId, String userId1, int people, int state,String hotel);


    //查总记录数
    public int count();
    //查 userId 的总记录数
    public int count(String userId);
}
