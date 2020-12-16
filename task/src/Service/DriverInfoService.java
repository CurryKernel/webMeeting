package Service;

import DAO.DriverRespository;
import DAO.impl.DriverImpl;
import VO.Driver;

import java.util.List;

public class DriverInfoService {
    private DriverRespository driverInfo = new DriverImpl();
    public List<Driver> findAll(){
        return driverInfo.findAll();
    }
    public String check(String driverId,String password){
        return driverInfo.check(driverId,password);
    }
    public String checkDriverId(String driverId){
        return driverInfo.checkDriverId(driverId);
    }

    public String insert(String driverId, String password, String phone, String description){
        return driverInfo.insert(driverId, password, phone, description);
    }

}
