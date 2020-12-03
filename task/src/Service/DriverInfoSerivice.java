package Service;

import DAO.DriverRespository;
import DAO.impl.DriverImpl;
import VO.Driver;

import java.util.List;

public class DriverInfoSerivice {
    private DriverRespository driverInfo = new DriverImpl();
    public List<Driver> findAll(){
        return driverInfo.findAll();
    }
}
