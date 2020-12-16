package DAO;

import VO.CarInfo;
import VO.Hotel;
import VO.HotelInfo;

import java.util.List;

public interface HotelInfoRespository {
    //实现分页的查找
    public List<HotelInfo> findAll(int pageId, int pageSize);
    //无分页的查找
    public List<HotelInfo> findAll();
    //增
    public List<HotelInfo> findByUserId(String userId);
    //查，根据用户 id 查，分页
    public List<HotelInfo> findByUserId(String userId, int currentPage, int pageSize);

}
