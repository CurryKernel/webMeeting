package Service;

import DAO.UserRespository;
import DAO.impl.UserImpl;
import VO.User;

import java.util.List;

public class UserService {
//    功能一 返回用户的个人信息。
    private UserRespository user = new UserImpl();

    public List<User> findByUserId(String userId){
        return user.findByUserId(userId);
    }
    public List<User> findAll(){
        return user.findAll();
    }

    //查全部用户的信息，分页
    public List<User> findAll(int pageId, int pageSize){
        return user.findAll(pageId,pageSize);
    }

    //根据用户ID修改密码
    public void updatePasswordById(String id, String password){
        user.updatePasswordById(id,password);
    }

    //总记录数
    public int count(){
        return user.count();
    }

    //根据用户ID一部分查询全部用户
    public List<User> findByPartOfUserId(String partId){
        return user.findByPartOfUserId(partId);
    }
}
