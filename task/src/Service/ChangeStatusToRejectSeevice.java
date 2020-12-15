package Service;

import DAO.OrderCarRespository;
import DAO.impl.OrderCarImpl;

public class ChangeStatusToRejectSeevice {
    private OrderCarRespository changeStatusToSu = new OrderCarImpl();
    public boolean changeStatue(String userId, String dealine){
        return changeStatusToSu.changeStatue(userId, dealine);
    }
}
