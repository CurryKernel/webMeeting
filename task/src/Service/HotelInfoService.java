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
    public String checkHotelId(String hotelId){
        return hotelInfo.checkHotelId(hotelId);
    }

    public String check(String hotelId,String password){
        return hotelInfo.check(hotelId, password);
    }

    public String insert(String hotelId, String password,String description){
        return hotelInfo.insert(hotelId, password, description);
    }
    //根据 id 删除


}
