package Service;

import DAO.HotelRespository;
import DAO.impl.HotelImpl;
import VO.Hotel;

import java.util.List;

public class HotelInfoService {
    private HotelRespository hotelInfo = new HotelImpl();
    public List<Hotel> findAll(){
        return hotelInfo.findAll();
    }
}
