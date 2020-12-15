package Service;

import DAO.DriverRespository;
import DAO.impl.DriverImpl;
import VO.Driver;
import VO.OrderCar;

import java.util.List;

public class DriverService {
    private DriverRespository driver = new DriverImpl();
    private DriverRespository orderCar = new DriverImpl();
    public List<Driver> findByDrvierId(String driverId){
        return driver.findByDriverId(driverId);
    }
    public List<OrderCar>findOrderCarByDriverId(String driverId) {
        return orderCar.findOrderCarByDriverId(driverId);
    }
    public void update(String id, String id1, String password, String phone,String description){
        driver.update(id,id1, password, phone, description);
    }
}
