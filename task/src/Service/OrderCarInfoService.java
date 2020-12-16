package Service;
import DAO.CarInfoRespository;
import DAO.impl.CarInfoImpl;
import VO.CarInfo;
import java.util.List;
public class OrderCarInfoService {
    private CarInfoRespository CarInfo = new CarInfoImpl();
    public List<CarInfo> findByUserId(String userId){
        return CarInfo.findByUserId(userId);
    }
}
