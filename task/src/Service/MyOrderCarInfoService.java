package Service;

import DAO.OrderCarRespository;
import DAO.impl.OrderCarImpl;
import VO.OrderCar;

import java.util.List;

public class MyOrderCarInfoService {
    private OrderCarRespository myOrderCarInfo = new OrderCarImpl();
    public List<OrderCar> findByUserId(String userId){
        return myOrderCarInfo.findByUserId(userId);
    }
}
