package Service;

import DAO.AdminRespository;
import VO.Admin;

public class AdminService {
    private AdminRespository adminRespository;
    public Admin findById(String id){
        return adminRespository.findById(id);
    }
}
