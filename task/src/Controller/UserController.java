package Controller;

import DAO.UserRespository;
import DAO.impl.UserImpl;
import Servicce.UserService;
import VO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/*
<form action="/task/findByUserId" method="get">，form表单只有此路径可以跳转到用户界面
*/
/*
测试了从登陆界面跳转到用户个人信息界面的功能，个人信息正常显示
        2020/11/26
*/

@WebServlet("/findByUserId")
public class UserController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        //resp.setContentType("text/json");
        UserService userService= new UserService();
        int userId =Integer.parseInt(req.getParameter("userId"));

        List<User> userList = userService.findByUserId(userId);
        System.out.println(userId);
        //System.out.println(userList);
        req.setAttribute("userList",userList);
        req.getRequestDispatcher("/user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
