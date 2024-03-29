package Controller;

import Service.UserService;
import VO.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
        UserService userService= new UserService();
        int userId =Integer.parseInt(req.getParameter("userId"));
        List<User> userList = userService.findByUserId(String.valueOf(userId));
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(userList);
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
