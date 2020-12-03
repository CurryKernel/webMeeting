package Service;

import DAO.HotelRespository;
import DAO.OrderHotelRespository;
import DAO.impl.HotelImpl;
import DAO.impl.OrderHotelImpl;
import VO.Hotel;

import java.util.List;

public class HotelInfoService {
    private HotelRespository hotelInfo = new HotelImpl();
    private OrderHotelRespository orderHotel = new OrderHotelImpl();
    public List<Hotel> findAll(){
        return hotelInfo.findAll();
    }


}
