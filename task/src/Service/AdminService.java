package Service;

import DAO.AdminRespository;
import DAO.impl.AdminImpl;
import VO.Admin;

public class AdminService {
    private AdminRespository adminRespository = new AdminImpl();
    public Admin findById(String id){
        return adminRespository.findById(id);
    }
    public void update(String id, String password){
        adminRespository.update(id, password);
    }
}
