package Servicce;

import DAO.UserRespository;
import DAO.impl.UserImpl;
import VO.User;

import java.util.List;

public class UserService {
//    功能一 返回用户的个人信息。
    private UserRespository user= new UserImpl();
    public List<User> findByUserId(int userId){
        return user.findByUserId(userId);
    }
}
