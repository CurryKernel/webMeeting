package Service;

import DAO.AdminRespository;
import DAO.impl.AdminImpl;
import VO.Admin;

import java.util.List;

public class AdminService {
    private AdminRespository adminRespository = new AdminImpl();
    public Admin findById(String id){
        return adminRespository.findById(id);
    }
    public void update(String id, String password){
        adminRespository.update(id, password);
    }
    public List<Admin> findAll(){
        return adminRespository.findAll();
    }

    public String check(String adminId,String password){
        return adminRespository.check(adminId,password);
    }
}
