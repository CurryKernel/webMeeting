package Service;
import DAO.HotelInfoRespository;
import DAO.OrderHotelRespository;
import DAO.impl.HotelInfoImpl;
import VO.HotelInfo;
import VO.OrderHotel;
import java.util.List;

public class OrderHotelInfoService {
    private HotelInfoRespository HotelInfo = new HotelInfoImpl();
    public List<HotelInfo> findByUserId(String userId){
        return HotelInfo.findByUserId(userId);
    }
}
