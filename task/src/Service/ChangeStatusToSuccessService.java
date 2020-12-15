package Service;

import DAO.OrderCarRespository;
import DAO.impl.OrderCarImpl;

public class ChangeStatusToSuccessService {
    private OrderCarRespository changeStatusToSu = new OrderCarImpl();
    public boolean changeStatus(String userId,String dealine){
        return changeStatusToSu.changeStatus(userId,dealine);
    }
}
