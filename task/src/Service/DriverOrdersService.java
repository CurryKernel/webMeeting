package Service;

import DAO.OrderCarRespository;
import DAO.impl.OrderCarImpl;
import VO.OrderInfo;

import java.util.List;

public class DriverOrdersService {
    private OrderCarRespository orderIn = new OrderCarImpl();
    public List<OrderInfo> findOrderInfos(String driverId){
        return orderIn.findOrderInfos(driverId);
    }
}
