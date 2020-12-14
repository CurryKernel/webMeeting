package Service;

import DAO.UserRespository;
import DAO.impl.UserImpl;
import VO.User;

import java.util.List;

public class UserService {
//    功能一 返回用户的个人信息。
    private UserRespository user= new UserImpl();
    public List<User> findByUserId(String userId){
        return user.findByUserId(userId);
    }
    public List<User> findAll(){
        return user.findAll();
    }
    public void update(String userId, String username, String password, String phone,String department,String email){}
}
