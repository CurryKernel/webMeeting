package Controller;

import Service.UserService;
import VO.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class MeetingInfo {
    public class UserController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            //解决中文乱码
            req.setCharacterEncoding("UTF-8");

            UserService userService= new UserService();
            int userId =Integer.parseInt(req.getParameter("userId"));
            List<User> userList = userService.findByUserId(userId);
//        System.out.println(userId);
//        System.out.println(userList);
//        req.setAttribute("userList",userList);
//        req.getRequestDispatcher("/user.jsp").forward(req, resp);
/*
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(userList);
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
* */
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
