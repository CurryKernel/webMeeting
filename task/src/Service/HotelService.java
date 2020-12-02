package Service;

import DAO.OrderHotelRespository;
import DAO.impl.OrderHotelImpl;
import VO.OrderHotel;

import java.util.List;

public class HotelService {
    private OrderHotelRespository orderhotel = new OrderHotelImpl();

    public HotelService() {

    }

    public List<OrderHotel> findByUserId_Hotel(String userId, String hotelId) {
        return orderhotel.findByUserId_Hotel(userId,hotelId);
    }


    public List<OrderHotel> findByHotel(String hotelId) {
        return orderhotel.findByHotel(hotelId);
    }

    public List<OrderHotel> findByPeople_Hotel(String hotelId, int people){
        return orderhotel.findByPeople_Hotel(hotelId,people);
    }

    public List<OrderHotel> findByState_Hotel(String hotelId, int state){
        return orderhotel.findByState_Hotel(hotelId,state);
    }

}
