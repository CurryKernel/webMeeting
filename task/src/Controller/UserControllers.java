package Controller;

import Servicce.UserService;
import VO.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller

@RequestMapping("/ajax")
public class UserControllers {
    @RequestMapping("/find")
    @ResponseBody
    public List<User> getUserList(int userId){
        UserService userService= new UserService();
        List<User> userList = userService.findByUserId(userId);
        return userList;
    }
}
