package Service;

import DAO.OrganizeRespository;
import DAO.impl.OrganizeImpl;

public class OrganizeService {
    private OrganizeRespository organize= new OrganizeImpl();
    public String insert(String organizeId,String organizeName,String password,String phone,String department,String email){
        return organize.insert(organizeId,organizeName,password,phone,department,email);
    }
    public String checkOrganizeId(String organizeId){
        return organize.checkOrganizeId(organizeId);
    }
    public String check(String organizeId,String password){
        return organize.check(organizeId,password);
    }
}
