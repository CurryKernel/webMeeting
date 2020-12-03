package Service;

import DAO.OrderHotelRespository;
import DAO.impl.OrderHotelImpl;
import VO.OrderHotel;

import java.util.List;

public class MyOrderHotelInfoService {
    private OrderHotelRespository myOrderHotelInfo = new OrderHotelImpl();
    public List<OrderHotel> findByUserId(String userId){
        return myOrderHotelInfo.findByUserId(userId);
    }
}
