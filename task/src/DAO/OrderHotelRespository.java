package DAO;
import VO.OrderHotel;
import VO.ShowOrderHotel;

import java.util.List;

public interface OrderHotelRespository {
    //管理员用
    //查全部
    public List<OrderHotel> findAll(int currentPage, int pageSize);
    //查全部
    public List<OrderHotel> findAll();
    //查，根据用户 id 查和酒店查
    public List<OrderHotel> findByUserId(String userId);
    //查，根据用户 id 和酒店查，分页
    public List<OrderHotel> findByUserId(String userId, int currentPage, int pageSize);

    //增
    public void insert(String userId, int people, int state,String hotelId);
    //酒店用，酒店只能查询自己酒店ID的
    //查，根据酒店Id和用户id查
    public List<ShowOrderHotel> findByHotel_User_Page(String hotelId,String userId, int currentPage, int pageSize);
    //查，根据酒店id查
    public List<ShowOrderHotel> findByHotel(String hotelId);
    //查，根据酒店查询、分页
    public List<ShowOrderHotel> findByHotel_page(String hotelId, int currentPage, int pageSize);
    //查，根据住房人数及酒店ID查
    public List<ShowOrderHotel> findByPeople_Hotel_Page(String hotelId, int people, int currentPage, int pageSize);
    //查，根据住房人数及酒店ID查,区间
    public List<ShowOrderHotel> findByPeople_Hotel_Page_Inter1(String hotelId, int peoplemin,int peoplemax,int currentPage, int pageSize);
    public List<ShowOrderHotel> findByPeople_Hotel_Page_Inter2(String hotelId, int peoplemin,int currentPage, int pageSize);
    //查，根据审核状态查及酒店ID查
    public List<ShowOrderHotel> findByState_Hotel_Page(String hotelId, int state, int currentPage, int pageSize);
    //查，根据酒店ID查,用户id，会议id查
    public List<ShowOrderHotel> findByUser_Hotel_Meeting_Page(String hotelId,String userId, String meetingId,int currentPage, int pageSize);

    //增 使用分别数据增加
    public void insert(String userId, int people, int state,String hotelId,String meetingId);
    //增 使用orderHotel类增加
    public void insertorder(OrderHotel orderHotel);


    //根据用户 id和酒店id删
    public void deleteByUserId_Hotelid(String userId,String hotelid);

    //改,根据用户 id 改
    public void update(String userId, String userId1, int people, int state,String hotel);
    //根据酒店ID,用户id,会议时间修改状态
    public void update_state(String userId,String hotelId,int newstate,String meetingId);


    //管理员查
    //查总记录数
    public int count();
    public int count(String userId);

    //查 userId 在某酒店的总记录数
    public int countByUserId_Hotelid(String userId,String hotelId);
    //查 查某酒店的总订单数
    public int countByHotelid(String hotelId);

    public int countByPeople_Hotelid(int people,String hotelId);
    //查 查某酒店的总订单数
    public int countByState_Hotelid(int state,String hotelId);


    //获取总页数
    public Integer PageTotal(String hotelId);


}
